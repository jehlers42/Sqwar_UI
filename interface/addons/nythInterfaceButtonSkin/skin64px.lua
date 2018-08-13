--[[ PixelSkin ]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

MSQ:AddSkin("nythInterface 64px", {
	Author = "Nythoria",
	Version = "6.2.0",
	Masque_Version = 60200,
	Shape = "Square",

	-- Skin data start.
	Backdrop = {
		Width = 39,
		Height = 39,
		Color = {1, 1, 1, 0.75},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Backdrop64px]],
	},
	Icon = {
		Width = 39,
		Height = 39,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 40.5,
		Height = 40.5,
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Overlay64px]],
	},
	Cooldown = {
		Width = 39,
		Height = 39,
	},
	AutoCast = {
		Width = 39,
		Height = 39,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 40.5,
		Height = 40.5,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Normal64px]],
	},
	Pushed = {
		Width = 40.5,
		Height = 40.5,
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Overlay64px]],
	},
	Border = {
		Width = 40.5,
		Height = 40.5,
		BlendMode = "ADD",
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Border64px]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40.5,
		Height = 40.5,
		BlendMode = "ADD",
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Border64px]],
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 39,
		Height = 39,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\nythInterfaceButtonSkin\Textures\Highlight64px]],
	},
	Gloss = {
		Hide = true,
	},
	HotKey = {
		Width = 39,
		Height = 39,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = 3,
		OffsetY = -3,
	},
	Count = {
		Width = 39,
		Height = 39,
		JustifyH = "LEFT",
		JustifyV = "BOTTOM",
		OffsetX = -2,
		OffsetY = 3,
	},
	Name = {
		Color = {0, 0, 0, 0}
	},
	-- Skin data end.

}, true)