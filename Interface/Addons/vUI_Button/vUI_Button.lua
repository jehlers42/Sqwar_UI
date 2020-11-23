if (not vUIGlobal) then
	return
end

local KeyBinding, Popup, Move, Commands, General = vUIGlobal:get()
local vUI, GUI, Language, Assets, Settings, Defaults = vUIGlobal:get()
local Plugin = vUI:NewPlugin("vUI_Button")
-- Plugin definition is needed to be detected as a plugin in vUI :)

local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

local OnAccept = function()
	vUI:ToggleMovers()
	GUI:Toggle()
end

local OnCancel = function()
	vUI:ToggleMovers()
end

if LDB then

	local vUIButton = LDB:NewDataObject("vUIButton", {

		type = "launcher",
		icon = "Interface\\AddOns\\vUI_Button\\assets\\logo.tga",
		tocname = "vUI_Button",

		OnClick = function(clickedframe, button)

			local alt_key = IsAltKeyDown()
			local shift_key = IsShiftKeyDown()
			local control_key = IsControlKeyDown()

			if UnitAffectingCombat("player") == false then

				if button == "LeftButton" then 
					
					if shift_key then

						vUI:GetModule("Key Binding"):Toggle()

					else

						GUI:Toggle()

					end

				elseif button == "RightButton" then 

					vUI:ToggleMovers()
					vUI:DisplayPopup(Language["Attention"], Language["Would you like to reopen the settings window?"], Language["Accept"], OnAccept, Language["Cancel"], OnCancel) -- PopupOnCancel

				elseif button == "MiddleButton" then 

				end

			else

				print("Cannot do that while in combat.")

			end
		end,

		OnTooltipShow = function(tt)

			tt:AddLine("|cFFFFC44DvUI|r Button")
			tt:AddLine("Left-Click |cff44ff44Open the Menu", cs, ce)
			tt:AddLine("Shift + Left-Click |cff44ff44Enable KeyBind Mode", cs, ce)
			tt:AddLine("Right-Click |cff44ff44Enable Move Mode", cs, ce)
			tt:Show()

		end,
	})
	
	if LDBIcon then

		LDBIcon:Register("vUIButton", vUIButton, vUIButton.MinimapIcon)

	end
end