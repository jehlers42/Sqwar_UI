
PlaterDB = {
	["profileKeys"] = {
		["Alaeana - Proudmoore"] = "Default",
		["Gwathren - Proudmoore"] = "Default",
		["Jiaxing - Proudmoore"] = "Default",
		["Lucrais - Proudmoore"] = "Default",
		["Seimira - Proudmoore"] = "Default",
		["Farathiel - Proudmoore"] = "Default",
		["Sifrun - Proudmoore"] = "Default",
		["Kathlian - Proudmoore"] = "Default",
		["Mirethiel - Proudmoore"] = "Default",
		["Ravna - Proudmoore"] = "Default",
		["Athaeriel - Proudmoore"] = "Default",
		["Velithriel - Proudmoore"] = "Default",
		["Celíara - Proudmoore"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1537884697,
					["url"] = "",
					["Icon"] = 135996,
					["Enabled"] = true,
					["Revision"] = 156,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Unit - Important [Plater]",
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Time"] = 1539013601,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 399,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the buff name in the trigger box.",
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["version"] = -1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561923707,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 391,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Very Important [Plater]",
					["NpcNames"] = {
					},
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["Time"] = 1540663131,
					["url"] = "",
					["Icon"] = 2175503,
					["Enabled"] = true,
					["Revision"] = 324,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Explosion Affix M+ [Plater]",
					["NpcNames"] = {
					},
				}, -- [4]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 232,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the debuff name in the trigger box.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561924439,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 574,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Big Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1539201768,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 376,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Small Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1538256464,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["Enabled"] = true,
					["Revision"] = 106,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["NpcNames"] = {
					},
				}, -- [8]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1543253273,
					["url"] = "",
					["Icon"] = 135024,
					["Enabled"] = true,
					["Revision"] = 59,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Color Change [Plater]",
					["NpcNames"] = {
						"141851", -- [1]
					},
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1547991413,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Enabled"] = true,
					["Revision"] = 157,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["NpcNames"] = {
					},
				}, -- [10]
				{
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Time"] = 1543680853,
					["url"] = "",
					["Icon"] = 133006,
					["Enabled"] = false,
					["Revision"] = 45,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Border Color [Plater]",
					["NpcNames"] = {
					},
				}, -- [11]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1539015649,
					["url"] = "",
					["Icon"] = 136048,
					["Enabled"] = true,
					["Revision"] = 131,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show the energy amount above the nameplate",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["version"] = -1,
					["Name"] = "UnitPower [Plater]",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
				}, -- [12]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["Time"] = 1539201849,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 171,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["NpcNames"] = {
					},
				}, -- [13]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["Time"] = 1539187387,
					["url"] = "",
					["Icon"] = 1029718,
					["Enabled"] = true,
					["Revision"] = 190,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Fixate [Plater]",
					["NpcNames"] = {
					},
				}, -- [14]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1543250950,
					["url"] = "",
					["Icon"] = 841383,
					["Enabled"] = true,
					["Revision"] = 194,
					["semver"] = "",
					["Author"] = "Tecno-Azralon",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Fixate On You [Plater]",
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
				}, -- [15]
			},
			["aura2_y_offset"] = 5,
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Unit - Important"] = 5,
				["Aura Border Color"] = 1,
				["Cast - Very Important"] = 2,
				["Explosion Affix M+"] = 3,
				["Aura - Debuff Alert"] = 3,
				["Unit Power"] = 1,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Aura - Blink Time Left"] = 1,
				["Color Change"] = 1,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 4,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Hide Neutral Units"] = 1,
				["Cast Bar Icon Config"] = 2,
				["Aura Reorder"] = 2,
				["Extra Border"] = 2,
				["Combo Points"] = 3,
				["Target Color"] = 3,
				["Attacking Specific Unit"] = 1,
				["Execute Range"] = 1,
			},
			["captured_spells"] = {
				[164815] = {
					["source"] = "Soraku",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259489] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[306474] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[280375] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Radiantnight",
					["npcID"] = 0,
				},
				[8222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mathildah",
					["npcID"] = 0,
				},
				[215479] = {
					["source"] = "Ayàki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315176] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[241835] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Calinea",
					["npcID"] = 0,
				},
				[152279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[298801] = {
					["source"] = "Xènon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285496] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[104318] = {
					["source"] = "Wild Imp",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 55659,
				},
				[313643] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[281403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zephyer",
					["npcID"] = 0,
				},
				[152280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mandras",
					["npcID"] = 0,
				},
				[315179] = {
					["source"] = "Fynyx-Uther",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85256] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[17364] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[153561] = {
					["source"] = "Orindor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31821] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bedavere",
					["npcID"] = 0,
				},
				[123254] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[270661] = {
					["source"] = "Gunwise",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275779] = {
					["source"] = "Reifal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280385] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[301367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stitcher-AzjolNerub",
					["npcID"] = 0,
				},
				[48018] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Boneapart",
					["npcID"] = 0,
				},
				[302392] = {
					["source"] = "Heyzuse-Suramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102401] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Denarrathis",
					["npcID"] = 0,
				},
				[116858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[167381] = {
					["source"] = "Dungeoneer's Training Dummy",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131992,
				},
				[200389] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whís",
					["npcID"] = 0,
				},
				[281413] = {
					["source"] = "Dexarcane-Fenris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221883] = {
					["source"] = "Dridien",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224186] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nosgoth-Silvermoon",
					["npcID"] = 0,
				},
				[118522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[194249] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["source"] = "Warrfaisal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[301886] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[45524] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[270670] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221886] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[313148] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203975] = {
					["source"] = "Skarrface-Nazgrel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[167385] = {
					["source"] = "Dungeoneer's Training Dummy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131992,
				},
				[278350] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[272721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[1719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[290121] = {
					["source"] = "Darkcrystal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280398] = {
					["source"] = "Biakabatuuka-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197835] = {
					["source"] = "Dumpee",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288075] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deathrattle-Tortheldrin",
					["npcID"] = 0,
				},
				[194509] = {
					["source"] = "Flailpriest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[313663] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[298823] = {
					["source"] = "Atairea",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235450] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[282449] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 144961,
				},
				[79632] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firepit-EchoIsles",
					["npcID"] = 0,
				},
				[245686] = {
					["source"] = "Choccymilk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228287] = {
					["source"] = "Adraak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3561] = {
					["source"] = "Keltesh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[271194] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[267612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[295248] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[219589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[203981] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298832] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Snoolulu",
					["npcID"] = 0,
				},
				[287062] = {
					["source"] = "Ragingmidget-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316744] = {
					["source"] = "Tidalhealz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5225] = {
					["source"] = "Kiahuno-Kilrogg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271711] = {
					["source"] = "Zorkone",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[298836] = {
					["source"] = "Talaera-Drenden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196819] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[7384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[279902] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298837] = {
					["source"] = "Elementhg-Ner'zhul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[226757] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[288091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[465] = {
					["source"] = "Cretoxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266087] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[121471] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[233411] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Painzmight",
					["npcID"] = 0,
				},
				[295258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rhunna",
					["npcID"] = 0,
				},
				[114051] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[298841] = {
					["source"] = "Drtybocephus-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204242] = {
					["source"] = "Reifal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33757] = {
					["source"] = "Magmarupt",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[214222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Atheñá",
					["npcID"] = 0,
				},
				[279397] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Napper-Runetotem",
					["npcID"] = 0,
				},
				[205523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[198103] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[98444] = {
					["source"] = "Tinomite",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[127230] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ödak",
					["npcID"] = 0,
				},
				[279913] = {
					["source"] = "Azulinix",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123904] = {
					["source"] = "Fynail",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1943] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[162794] = {
					["source"] = "Taayswifty",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[216528] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Locotu-Frostmane",
					["npcID"] = 0,
				},
				[175844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tsinya-Draenor",
					["npcID"] = 0,
				},
				[251839] = {
					["source"] = "Pöwer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[80534] = {
					["source"] = "Hebsibah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Catalorian",
					["npcID"] = 0,
				},
				[327510] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117892] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saltfin Swimmer",
					["npcID"] = 126682,
				},
				[185313] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[208086] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[319836] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[82326] = {
					["source"] = "Save",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[264057] = {
					["source"] = "Fizzledank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187874] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[255937] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Alâeyra",
					["npcID"] = 0,
				},
				[298859] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mortalbane",
					["npcID"] = 0,
				},
				[192225] = {
					["source"] = "Dêvôured",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256451] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Litara",
					["npcID"] = 0,
				},
				[6201] = {
					["source"] = "Boneapart",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[147193] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188389] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[187878] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48281] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153897,
				},
				[204255] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298357] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[256455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nimmaya-BoreanTundra",
					["npcID"] = 0,
				},
				[272260] = {
					["source"] = "Taleeha",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205025] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jjade",
					["npcID"] = 0,
				},
				[256456] = {
					["source"] = "Valreaúx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zizu",
					["npcID"] = 0,
				},
				[89751] = {
					["source"] = "Az'arad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[102417] = {
					["source"] = "Athenaa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304504] = {
					["source"] = "Lâmb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315763] = {
					["source"] = "Mypal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317301] = {
					["source"] = "K'thir Voidcaller",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161815,
				},
				[196840] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[256459] = {
					["source"] = "Saphina-Runetotem",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[171253] = {
					["source"] = "Stavetorlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[585] = {
					["source"] = "Thefinger-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[586] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viryuna",
					["npcID"] = 0,
				},
				[256460] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azeroth-Lightbringer",
					["npcID"] = 0,
				},
				[589] = {
					["source"] = "Riejo",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236502] = {
					["source"] = "Steverz-Daggerspine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89753] = {
					["source"] = "Az'arad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58965,
				},
				[299905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[190446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[111759] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[50842] = {
					["source"] = "Fendweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[334196] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273298] = {
					["source"] = "Ragingmidget-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277904] = {
					["source"] = "Adelphos-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34914] = {
					["source"] = "Slìcedbread-Warsong",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Måxwell",
					["npcID"] = 0,
				},
				[272276] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61781] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Waffoob-Uther",
					["npcID"] = 0,
				},
				[272790] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[132621] = {
					["source"] = "Swaby",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33763] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[279956] = {
					["source"] = "Slìcedbread-Warsong",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164862] = {
					["source"] = "Elyr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210152] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[93082] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50051,
				},
				[231390] = {
					["source"] = "Kimena",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[288146] = {
					["source"] = "Doraemoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200174] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[642] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wolvarine",
					["npcID"] = 0,
				},
				[273310] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341374] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[315787] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131347] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[259285] = {
					["source"] = "Kéoni",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[222695] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Franknhooker-AzjolNerub",
					["npcID"] = 0,
				},
				[267685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[5394] = {
					["source"] = "Duranun",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316814] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53595] = {
					["source"] = "Reifal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311186] = {
					["source"] = "Lorganoth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288158] = {
					["source"] = "Roloff-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[686] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[87840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Enword",
					["npcID"] = 0,
				},
				[691] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tinymac",
					["npcID"] = 0,
				},
				[204019] = {
					["source"] = "Mypal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[697] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Weirdlyholy-Korgath",
					["npcID"] = 0,
				},
				[698] = {
					["source"] = "Boneapart",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[703] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[20473] = {
					["source"] = "Save",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[125071] = {
					["source"] = "Madhishe",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Timmnmm",
					["npcID"] = 0,
				},
				[193530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obád",
					["npcID"] = 0,
				},
				[204021] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316823] = {
					["source"] = "Ragingmidget-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278954] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295842] = {
					["source"] = "Sorbetero-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197625] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zellon",
					["npcID"] = 0,
				},
				[16827] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Banthalos",
					["npcID"] = 54320,
				},
				[176644] = {
					["source"] = "Jedadead-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316826] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 162764,
				},
				[272817] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shotguun-Darrowmere",
					["npcID"] = 0,
				},
				[281517] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Velseliya",
					["npcID"] = 0,
				},
				[273842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Totemfade",
					["npcID"] = 0,
				},
				[275378] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[256735] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[193534] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ampzz",
					["npcID"] = 0,
				},
				[310690] = {
					["source"] = "Celíara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269239] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269751] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274357] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[187650] = {
					["source"] = "Ampzz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[117014] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[316835] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162764,
				},
				[300971] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hyperheals",
					["npcID"] = 0,
				},
				[317859] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195072] = {
					["source"] = "Kurino-Shadowsong",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277943] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["source"] = "Kiahuno-Kilrogg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196608] = {
					["source"] = "Ayàki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[256739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lexuss-Sen'jin",
					["npcID"] = 0,
				},
				[774] = {
					["source"] = "Tomatovendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47585] = {
					["source"] = "Iovia",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3110] = {
					["source"] = "Rultuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 416,
				},
				[781] = {
					["source"] = "Celíara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[783] = {
					["source"] = "Gimmik-Whisperwind",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[261602] = {
					["source"] = "Boneapart",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[243435] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23161] = {
					["source"] = "Siyoth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318378] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262115] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[111771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boneapart",
					["npcID"] = 0,
				},
				[85288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[158486] = {
					["source"] = "Idesdruid",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8690] = {
					["source"] = "Celíara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19483] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Infernal",
					["npcID"] = 89,
				},
				[21562] = {
					["source"] = "Nckvalentine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59548] = {
					["source"] = "Fernry",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[83242] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[319919] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taqueesha-Eitrigg",
					["npcID"] = 0,
				},
				[108446] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[275398] = {
					["source"] = "Fizzledank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256745] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lüdlum-KhazModan",
					["npcID"] = 0,
				},
				[307128] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[83243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Threeb",
					["npcID"] = 0,
				},
				[50977] = {
					["source"] = "Kasadoom",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[300989] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flamey-Cenarius",
					["npcID"] = 0,
				},
				[15407] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[185358] = {
					["source"] = "Carathiel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53600] = {
					["source"] = "Reifal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15487] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[83244] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Halleluia",
					["npcID"] = 0,
				},
				[53] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[261866] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Scrimshaw Racketeer",
					["npcID"] = 144213,
				},
				[243955] = {
					["source"] = "Hygeiah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34026] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[303041] = {
					["source"] = "Shabooke",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297412] = {
					["source"] = "Diogenesis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165658] = {
					["source"] = "Rock Stalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131890,
				},
				[324536] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[232698] = {
					["source"] = "Nckvalentine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279503] = {
					["source"] = "Lizel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298950] = {
					["source"] = "Morgorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295368] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[176151] = {
					["source"] = "Ceejj-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263642] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54049] = {
					["source"] = "Xelkek",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58964,
				},
				[77489] = {
					["source"] = "Troski-Quel'dorei",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186387] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Didll",
					["npcID"] = 0,
				},
				[883] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Catalorian",
					["npcID"] = 0,
				},
				[224001] = {
					["source"] = "Indigö-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Farathiel",
					["npcID"] = 0,
				},
				[212743] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[261616] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 132969,
				},
				[303564] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[203277] = {
					["source"] = "Orindor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204301] = {
					["source"] = "Mypal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107428] = {
					["source"] = "Adraak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[24858] = {
					["source"] = "Mosma",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295378] = {
					["source"] = "Drtybocephus-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["source"] = "Talaera-Drenden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[224772] = {
					["source"] = "Sylariel-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116768] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[317898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Training Dummy",
					["npcID"] = 126781,
				},
				[303570] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[297941] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[286171] = {
					["source"] = "Cherra-Nazgrel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132403] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Athéna",
					["npcID"] = 0,
				},
				[328136] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322507] = {
					["source"] = "Ayàki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[216331] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bedavere",
					["npcID"] = 0,
				},
				[157736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[101545] = {
					["source"] = "Fynail",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203538] = {
					["source"] = "Josephmccigz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[275429] = {
					["source"] = "Drgorb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319952] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[227847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[203539] = {
					["source"] = "Josephmccigz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203795] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280549] = {
					["source"] = "Bigsxy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[248062] = {
					["source"] = "Chibiyume",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292320] = {
					["source"] = "Vatan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rowanlock",
					["npcID"] = 0,
				},
				[250878] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Draigonel",
					["npcID"] = 0,
				},
				[157228] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264689] = {
					["source"] = "Thorandyre-Cenarius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308188] = {
					["source"] = "Brahmrose-Misha",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304606] = {
					["source"] = "Sorbetero-Cenarius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264178] = {
					["source"] = "Fizzledank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[308189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tchálla",
					["npcID"] = 0,
				},
				[157997] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[980] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[100780] = {
					["source"] = "Ayàki",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[183585] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lightsworn Anchorite",
					["npcID"] = 109751,
				},
				[270323] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[145205] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[186401] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304612] = {
					["source"] = "Tlaan-Nesingwary",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201754] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Banthalos",
					["npcID"] = 54320,
				},
				[111400] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Boneapart",
					["npcID"] = 0,
				},
				[115750] = {
					["source"] = "Mypal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295402] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kilahana-Misha",
					["npcID"] = 0,
				},
				[105771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[207640] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novoo",
					["npcID"] = 0,
				},
				[8042] = {
					["source"] = "Bebhelle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ðjflex",
					["npcID"] = 0,
				},
				[265722] = {
					["source"] = "Venomfang Lurker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 134899,
				},
				[262652] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[279029] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[257537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[207386] = {
					["source"] = "Isilaura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188196] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[8212] = {
					["source"] = "Mirithana-KulTiras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121253] = {
					["source"] = "Ayàki",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279033] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[194594] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[325092] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[270335] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257284] = {
					["source"] = "Carathiel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[237838] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 104493,
				},
				[100784] = {
					["source"] = "Adraak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2139] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tecjoolu",
					["npcID"] = 0,
				},
				[257541] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Métrium",
					["npcID"] = 0,
				},
				[55078] = {
					["source"] = "Fendweller",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8676] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[29722] = {
					["source"] = "Azulinix",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53351] = {
					["source"] = "Detrasxx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[254472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Save",
					["npcID"] = 0,
				},
				[43308] = {
					["source"] = "Punkyness",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299512] = {
					["source"] = "Rellyk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[120360] = {
					["source"] = "Desdahla",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[184364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[272903] = {
					["source"] = "Save",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273415] = {
					["source"] = "Nixasa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[265742] = {
					["source"] = "Gukra",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[290819] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[291843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[184367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[334320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[48107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[2383] = {
					["source"] = "Anjo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274447] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Phife-Dunemaul",
					["npcID"] = 0,
				},
				[248082] = {
					["source"] = "Chibiyume",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[178740] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292360] = {
					["source"] = "Hukhash-Kil'jaeden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278543] = {
					["source"] = "Lizel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85692] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doomguard",
					["npcID"] = 11859,
				},
				[292361] = {
					["source"] = "Rahnokan-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292362] = {
					["source"] = "Baldrur-Sen'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185394] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kelrez",
					["npcID"] = 0,
				},
				[273428] = {
					["source"] = "Batlerattle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[116014] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[292364] = {
					["source"] = "Ràzer-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195630] = {
					["source"] = "Ayàki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48108] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[96312] = {
					["source"] = "Wadizzle-Bloodscalp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33907] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 142294,
				},
				[119085] = {
					["source"] = "Gargorg-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308742] = {
					["source"] = "Tbonelli-Dragonblight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203819] = {
					["source"] = "Foamite",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[134477] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[236060] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[228128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Driftless",
					["npcID"] = 0,
				},
				[108211] = {
					["source"] = "Doraemoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ampzz",
					["npcID"] = 0,
				},
				[77762] = {
					["source"] = "Bebhelle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260881] = {
					["source"] = "Azurefisher",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285719] = {
					["source"] = "Elader",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257044] = {
					["source"] = "Carathiel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[165185] = {
					["source"] = "Tinomite",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48045] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299538] = {
					["source"] = "Veynk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cherzu-Hyjal",
					["npcID"] = 0,
				},
				[2643] = {
					["source"] = "Desdahla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[58984] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Denarrathis",
					["npcID"] = 0,
				},
				[294935] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lagz-Skywall",
					["npcID"] = 0,
				},
				[31707] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[77764] = {
					["source"] = "Taleeha",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[228645] = {
					["source"] = "Rune Weapon",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27893,
				},
				[298009] = {
					["source"] = "Nyrä",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316944] = {
					["source"] = "Baugulf-Ner'zhul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5484] = {
					["source"] = "Casuals",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272934] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[32379] = {
					["source"] = "Paràbola",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[263725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[191034] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[290337] = {
					["source"] = "Bellåtrixxe",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2823] = {
					["source"] = "Doraemoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18562] = {
					["source"] = "Hanqishi",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272940] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Psychopäth-Hyjal",
					["npcID"] = 0,
				},
				[273453] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[199736] = {
					["source"] = "Gryffin-Windrunner",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165961] = {
					["source"] = "Ninjaworgen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197690] = {
					["source"] = "Crmsn-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36213] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 95072,
				},
				[2963] = {
					["source"] = "Quazievil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[222256] = {
					["source"] = "Paladini",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268854] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47536] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Prozaque",
					["npcID"] = 0,
				},
				[1490] = {
					["source"] = "Sanzaku",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2983] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hahähehë-Ner'zhul",
					["npcID"] = 0,
				},
				[190784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Effric",
					["npcID"] = 0,
				},
				[265273] = {
					["source"] = "Fizzledank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268856] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Radiantnight",
					["npcID"] = 0,
				},
				[287280] = {
					["source"] = "Sazxo-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264764] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273465] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[273977] = {
					["source"] = "Lizel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267325] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212792] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[18499] = {
					["source"] = "Sevenwolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267326] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267327] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22817] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Guard Fengus",
					["npcID"] = 14321,
				},
				[118455] = {
					["source"] = "Desdahla",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267329] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275006] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zephyer",
					["npcID"] = 0,
				},
				[260643] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[212283] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[267331] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294966] = {
					["source"] = "Moniqué",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101568] = {
					["source"] = "Omegablack-Draka",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287802] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[160597] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ioannis",
					["npcID"] = 0,
				},
				[264774] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235313] = {
					["source"] = "Katherene",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55342] = {
					["source"] = "Madhishe",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207167] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[293945] = {
					["source"] = "Darayah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126389] = {
					["source"] = "Aduck",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301624] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Måxwell",
					["npcID"] = 0,
				},
				[160600] = {
					["source"] = "Spartiatis-Drak'thul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[175697] = {
					["source"] = "Qjiumi",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273992] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302651] = {
					["source"] = "Troski-Quel'dorei",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272970] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[268877] = {
					["source"] = "Desdahla",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185422] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[3355] = {
					["source"] = "Hynstheion-Aegwynn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20707] = {
					["source"] = "Indigö-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290372] = {
					["source"] = "Ormak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22818] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Guard Mol'dar",
					["npcID"] = 14326,
				},
				[322101] = {
					["source"] = "Fynail",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203846] = {
					["source"] = "Rambalamps",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296003] = {
					["source"] = "Whattheheal-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["source"] = "Avendil",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1706] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[203847] = {
					["source"] = "Inciz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Akàli",
					["npcID"] = 0,
				},
				[280653] = {
					["source"] = "Lowmaine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kitten",
					["npcID"] = 165189,
				},
				[300612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bhalmur",
					["npcID"] = 0,
				},
				[313918] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sushihunter",
					["npcID"] = 0,
				},
				[272979] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327225] = {
					["source"] = "Mypal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47540] = {
					["source"] = "Thefinger-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[127928] = {
					["source"] = "Naeb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[64044] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[268887] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275540] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[193359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dàrkstar",
					["npcID"] = 0,
				},
				[297034] = {
					["source"] = "Pöwer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116670] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Akàli",
					["npcID"] = 0,
				},
				[297035] = {
					["source"] = "Elementhg-Ner'zhul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[40120] = {
					["source"] = "Nebullous-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[127801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 65310,
				},
				[280149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nichols",
					["npcID"] = 0,
				},
				[297037] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Critsham-Lightbringer",
					["npcID"] = 0,
				},
				[1784] = {
					["source"] = "Degooser",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24450] = {
					["source"] = "豹",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 42718,
				},
				[289362] = {
					["source"] = "Steverz-Daggerspine",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297039] = {
					["source"] = "Talaera-Drenden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Weedow",
					["npcID"] = 0,
				},
				[115008] = {
					["source"] = "Gargorg-Muradin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Elliora-Rexxar",
					["npcID"] = 0,
				},
				[78674] = {
					["source"] = "Soraku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[125883] = {
					["source"] = "Stariela",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260402] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5221] = {
					["source"] = "Stareana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[342076] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[322118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Akàli",
					["npcID"] = 0,
				},
				[16870] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novoo",
					["npcID"] = 0,
				},
				[288343] = {
					["source"] = "Paràbola",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[268898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bhalmur",
					["npcID"] = 0,
				},
				[113858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[1850] = {
					["source"] = "Foley-Kilrogg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8679] = {
					["source"] = "Valianas-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51124] = {
					["source"] = "Naeb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205648] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[313424] = {
					["source"] = "Fynail",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31935] = {
					["source"] = "Reifal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[271462] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[268904] = {
					["source"] = "Vhalena",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32223] = {
					["source"] = "Molteram",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312915] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sushihunter",
					["npcID"] = 0,
				},
				[33917] = {
					["source"] = "Stareana",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48438] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[271465] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[206930] = {
					["source"] = "Fendweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[113860] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[221771] = {
					["source"] = "Adraak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[156779] = {
					["source"] = "Tööms",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[120] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[342601] = {
					["source"] = "Coex",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[223819] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[211793] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[185438] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[11366] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[22820] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Guard Slip'kik",
					["npcID"] = 14323,
				},
				[152175] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280170] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197721] = {
					["source"] = "Elyveen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312924] = {
					["source"] = "Fynail",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1966] = {
					["source"] = "Purplesipp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261947] = {
					["source"] = "Adraak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[117828] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[287338] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[317020] = {
					["source"] = "Dueycox",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246851] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[134522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hólýmóly",
					["npcID"] = 0,
				},
				[241222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cyzerdh",
					["npcID"] = 0,
				},
				[49143] = {
					["source"] = "Naeb",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53365] = {
					["source"] = "Omegablack-Draka",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246852] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obád",
					["npcID"] = 0,
				},
				[8004] = {
					["source"] = "Hulah",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19750] = {
					["source"] = "Tattíanna",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273525] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[298601] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norinn-Perenolde",
					["npcID"] = 0,
				},
				[246853] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obád",
					["npcID"] = 0,
				},
				[273526] = {
					["source"] = "Fizzledank",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[205146] = {
					["source"] = "Fizzledank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8092] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[284275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Twixlee",
					["npcID"] = 0,
				},
				[303211] = {
					["source"] = "Njal-Bladefist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288371] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[300142] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[279673] = {
					["source"] = "Azulinix",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105421] = {
					["source"] = "Mypal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315496] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[281209] = {
					["source"] = "Jedadead-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Døs",
					["npcID"] = 0,
				},
				[258883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[95826] = {
					["source"] = "Boralus Guard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139088,
				},
				[133] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[316522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obád",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Savvanti",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54710] = {
					["source"] = "Fullofhell",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[114250] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[136] = {
					["source"] = "Celíara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[343648] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Måxwell",
					["npcID"] = 0,
				},
				[215387] = {
					["source"] = "Tengold",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[211805] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[278147] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Olvim",
					["npcID"] = 0,
				},
				[8936] = {
					["source"] = "Draigonel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108366] = {
					["source"] = "Makari-Frostmane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315508] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dàrkstar",
					["npcID"] = 0,
				},
				[34433] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[335467] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[55095] = {
					["source"] = "Naeb",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194153] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[256075] = {
					["source"] = "Vespawoman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[90328] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151133,
				},
				[61684] = {
					["source"] = "Banthalos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 54320,
				},
				[280713] = {
					["source"] = "Aureline",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105809] = {
					["source"] = "Save",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278155] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cassun",
					["npcID"] = 0,
				},
				[220510] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ribmann",
					["npcID"] = 0,
				},
				[280204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[270481] = {
					["source"] = "Demonic Tyrant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135002,
				},
				[280205] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dimepiece",
					["npcID"] = 0,
				},
				[105682] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bombatta-Dragonblight",
					["npcID"] = 0,
				},
				[276112] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Effric",
					["npcID"] = 0,
				},
				[199786] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[126664] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[190319] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[280719] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[45181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sarline",
					["npcID"] = 0,
				},
				[195181] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59638] = {
					["source"] = "Mirror Image",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 31216,
				},
				[281744] = {
					["source"] = "Flexorcism-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["source"] = "Thakster",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195182] = {
					["source"] = "Fendweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2484] = {
					["source"] = "Xiie",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[344179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[202347] = {
					["source"] = "Stareana",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[115151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Akàli",
					["npcID"] = 0,
				},
				[268954] = {
					["source"] = "Bobbus-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[284307] = {
					["source"] = "Shotjennifer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[93402] = {
					["source"] = "Soraku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tamíko",
					["npcID"] = 0,
				},
				[299662] = {
					["source"] = "Háyama-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300174] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[80353] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264352] = {
					["source"] = "Ciradyl-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281240] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264353] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[299664] = {
					["source"] = "Aacropolis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276124] = {
					["source"] = "Taleeha",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317065] = {
					["source"] = "Talaera-Drenden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131474] = {
					["source"] = "Boneapart",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[80354] = {
					["source"] = "Valreaúx",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[105174] = {
					["source"] = "Fizzledank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279709] = {
					["source"] = "Stareana",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300691] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Karazorrel",
					["npcID"] = 0,
				},
				[209261] = {
					["source"] = "Zorkone",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[173183] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[7421] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bestialwrath",
					["npcID"] = 0,
				},
				[300693] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[333957] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[196980] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Slyvr",
					["npcID"] = 0,
				},
				[53563] = {
					["source"] = "Save",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Punchmeh",
					["npcID"] = 0,
				},
				[207472] = {
					["source"] = "Arcanekisses-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138130] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69792,
				},
				[8921] = {
					["source"] = "Soraku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[172] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[345219] = {
					["source"] = "Getherian",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17962] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[279204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[343173] = {
					["source"] = "Unmatched",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297116] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jorinda",
					["npcID"] = 0,
				},
				[44544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[297117] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celillenna",
					["npcID"] = 0,
				},
				[264877] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ouchpotato",
					["npcID"] = 0,
				},
				[333964] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Totemfade",
					["npcID"] = 0,
				},
				[264878] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43265] = {
					["source"] = "Fendweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[236645] = {
					["source"] = "Fantastic-Nazgrel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290468] = {
					["source"] = "Katherene",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290469] = {
					["source"] = "Drtybocephus-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[144787] = {
					["source"] = "Willdy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217200] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[270515] = {
					["source"] = "Azerite-Infused Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 137905,
				},
				[19434] = {
					["source"] = "Carathiel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2948] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[285357] = {
					["source"] = "Marimen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156560] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dramaticpàws",
					["npcID"] = 0,
				},
				[57723] = {
					["source"] = "Sainted-Cenarius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298152] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123986] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Døs",
					["npcID"] = 0,
				},
				[198013] = {
					["source"] = "Taayswifty",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188290] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Paper",
					["npcID"] = 0,
				},
				[58875] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85222] = {
					["source"] = "Mykerr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81256] = {
					["source"] = "Lizel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79849] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 61834,
				},
				[205180] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[276154] = {
					["source"] = "Vhalena",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165776] = {
					["source"] = "Rock Stalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131890,
				},
				[53822] = {
					["type"] = "BUFF",
					["source"] = "Kasadoom",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[12472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jaush",
					["npcID"] = 0,
				},
				[73325] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[277181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jaush",
					["npcID"] = 0,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Docken-Windrunner",
					["npcID"] = 0,
				},
				[322729] = {
					["source"] = "Ayàki",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[267972] = {
					["source"] = "Fizzledank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305843] = {
					["source"] = "Ceejj-Cenarius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[88423] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Denarrathis",
					["npcID"] = 0,
				},
				[271045] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196741] = {
					["source"] = "Inon-AzjolNerub",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131493] = {
					["source"] = "Imhorney-Shu'halo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302775] = {
					["source"] = "Fizzledank",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73685] = {
					["type"] = "BUFF",
					["source"] = "Hikarisno",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267288] = {
					["source"] = "Earthen Ring Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135671,
				},
				[281791] = {
					["type"] = "BUFF",
					["source"] = "Moxxi",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118922] = {
					["type"] = "BUFF",
					["source"] = "Celíara",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196742] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[56814] = {
					["type"] = "BUFF",
					["source"] = "Shade",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281795] = {
					["source"] = "Gumbâll",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vïncent",
					["npcID"] = 0,
				},
				[280772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[271049] = {
					["source"] = "Kéoni",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2061] = {
					["source"] = "Kiraera",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289349] = {
					["source"] = "Lizel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280773] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[289308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[225603] = {
					["source"] = "Quiz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[124503] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[163201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[113656] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[182993] = {
					["source"] = "Zephialynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262161] = {
					["source"] = "Njordd",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203720] = {
					["source"] = "Foamite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304056] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[110885] = {
					["source"] = "Alamaryn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[314040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[277706] = {
					["source"] = "Azulinix",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186254] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115804] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[288882] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kadmiff",
					["npcID"] = 0,
				},
				[279754] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodynuts-KhazModan",
					["npcID"] = 0,
				},
				[96231] = {
					["source"] = "Mypal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[79470] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sugelite-Hydraxis",
					["npcID"] = 0,
				},
				[85739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Weedow",
					["npcID"] = 0,
				},
				[633] = {
					["source"] = "Wolvarine",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[208772] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[137639] = {
					["source"] = "Fynail",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3408] = {
					["source"] = "Doraemoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263892] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Silk",
					["npcID"] = 165189,
				},
				[280780] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[273104] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bhalmur",
					["npcID"] = 0,
				},
				[104316] = {
					["source"] = "Fizzledank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[215607] = {
					["source"] = "Tengold",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278379] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Volcom",
					["npcID"] = 0,
				},
				[297995] = {
					["source"] = "Salidie",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81262] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[298343] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210053] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Huntingwolff",
					["npcID"] = 0,
				},
				[252216] = {
					["source"] = "Hothchocolat",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201223] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Icekrispy",
					["npcID"] = 0,
				},
				[139176] = {
					["source"] = "Littledanyal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278736] = {
					["source"] = "Sleipnir-Kilrogg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156064] = {
					["source"] = "Renyaw-Sen'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205448] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[195645] = {
					["source"] = "Hynstheion-Aegwynn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wolvarine",
					["npcID"] = 0,
				},
				[185311] = {
					["source"] = "Jackdsparrow-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257040] = {
					["source"] = "Velithriel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51714] = {
					["source"] = "Naeb",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315584] = {
					["source"] = "Dàrkstar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164812] = {
					["source"] = "Soraku",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296138] = {
					["source"] = "Goldrinn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[242551] = {
					["source"] = "Zzyzx-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297162] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ðjflex",
					["npcID"] = 0,
				},
				[2096] = {
					["source"] = "Aurvandil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101643] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Keudamonk",
					["npcID"] = 0,
				},
				[114108] = {
					["source"] = "Elyveen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202636] = {
					["source"] = "Kittypewpew",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273714] = {
					["source"] = "Paràbola",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205708] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[112042] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1860,
				},
				[321388] = {
					["source"] = "Kín",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316099] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[85673] = {
					["source"] = "Save",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210824] = {
					["source"] = "Musetta",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[44614] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[166302] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 101527,
				},
				[275672] = {
					["source"] = "Nixasa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[325202] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Døs",
					["npcID"] = 0,
				},
				[279572] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49028] = {
					["source"] = "Lizel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[84714] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[302796] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[186257] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5143] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[3600] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 2630,
				},
				[343737] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yu'lon",
					["npcID"] = 165374,
				},
				[297168] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[974] = {
					["source"] = "Sargheron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280876] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[276187] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288981] = {
					["source"] = "Zorvaque",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273836] = {
					["source"] = "Endinglife",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5215] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wildhardt",
					["npcID"] = 0,
				},
				[202425] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aspënn",
					["npcID"] = 0,
				},
				[29893] = {
					["source"] = "Boneapart",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[36554] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[124218] = {
					["source"] = "Lovehergnome",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265954] = {
					["source"] = "Kéoni",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273947] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156070] = {
					["source"] = "Grace",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[49966] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faultline",
					["npcID"] = 165189,
				},
				[56641] = {
					["source"] = "Carathiel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48517] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[138927] = {
					["source"] = "Cällisto",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207203] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[156071] = {
					["source"] = "Lovehergnome",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256374] = {
					["source"] = "Naeb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256453] = {
					["source"] = "Choccymilk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280286] = {
					["source"] = "Mykerr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[155853] = {
					["source"] = "Mêmnoch-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jonimitchelz",
					["npcID"] = 0,
				},
				[157644] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[186265] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[67833] = {
					["source"] = "Stormwollf",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[213644] = {
					["source"] = "Ratèl",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[320137] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[184362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[295855] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Timmnmm",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264173] = {
					["source"] = "Fizzledank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185123] = {
					["source"] = "Taayswifty",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[48518] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Furryforis",
					["npcID"] = 0,
				},
				[108294] = {
					["source"] = "Fionola",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5487] = {
					["source"] = "Idontstop-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24275] = {
					["source"] = "Mypal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268956] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[247677] = {
					["source"] = "Holyidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254474] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Radiantnight",
					["npcID"] = 0,
				},
				[72968] = {
					["source"] = "Monkguyver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[27576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[300762] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Måxwell",
					["npcID"] = 0,
				},
				[143625] = {
					["source"] = "Jedadead-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210320] = {
					["source"] = "Rellyk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[247454] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270058] = {
					["source"] = "Anjo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[2818] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[219788] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1543] = {
					["source"] = "Ampzz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210065] = {
					["source"] = "Ryunsera-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259449] = {
					["source"] = "Linang",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275689] = {
					["source"] = "Nixasa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1044] = {
					["source"] = "Emeera-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30451] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[198837] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[182104] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270339] = {
					["source"] = "Kéoni",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154797] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16591] = {
					["source"] = "Bigsxy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Karazorrel",
					["npcID"] = 0,
				},
				[8122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hiltomix",
					["npcID"] = 0,
				},
				[227723] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81141] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289277] = {
					["source"] = "Giantbeast-Frostmane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77535] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304611] = {
					["source"] = "Sorbetero-Cenarius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259452] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Janlevinson-Korgath",
					["npcID"] = 0,
				},
				[188089] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[297126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[194384] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[112870] = {
					["source"] = "Takêen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205766] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jaush",
					["npcID"] = 0,
				},
				[225921] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188370] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[44425] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tecjoolu",
					["npcID"] = 0,
				},
				[116849] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Karazorrel",
					["npcID"] = 0,
				},
				[19574] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2580] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297964] = {
					["source"] = "Rellyk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[302307] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krystalrage",
					["npcID"] = 0,
				},
				[274443] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fortifying",
					["npcID"] = 0,
				},
				[318038] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[321358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zakkann-Mal'Ganis",
					["npcID"] = 0,
				},
				[205231] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkglare",
					["npcID"] = 103673,
				},
				[279793] = {
					["source"] = "Tomatovendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156080] = {
					["source"] = "Seeriss",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190984] = {
					["source"] = "Soraku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[25771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tonymac-Cenarius",
					["npcID"] = 0,
				},
				[259454] = {
					["source"] = "Inquisition-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198300] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[270070] = {
					["source"] = "Wuornos-Vashj",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198813] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[167105] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[260734] = {
					["source"] = "Bebhelle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257408] = {
					["source"] = "Ollie-Suramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[248473] = {
					["source"] = "Idontstop-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grasshopper",
					["npcID"] = 0,
				},
				[154796] = {
					["source"] = "Sanzaku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12042] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[341282] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[115175] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Akàli",
					["npcID"] = 0,
				},
				[8220] = {
					["source"] = "Agonyspren",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259456] = {
					["source"] = "Laija",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341207] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Camz",
					["npcID"] = 0,
				},
				[193538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[280177] = {
					["source"] = "Fantastic-Nazgrel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264957] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196277] = {
					["source"] = "Fizzledank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289523] = {
					["source"] = "Chuntsy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164545] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257410] = {
					["source"] = "Njal-Bladefist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34767] = {
					["source"] = "Loganator-Arathor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288803] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[51271] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[246152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[295186] = {
					["source"] = "Musetta",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[284277] = {
					["source"] = "Callyndra-Daggerspine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[146739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[289524] = {
					["source"] = "Chuntsy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298703] = {
					["source"] = "Diogenesis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295856] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Guardian of Azeroth",
					["npcID"] = 152396,
				},
				[44100] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ödak",
					["npcID"] = 0,
				},
				[164273] = {
					["source"] = "Litlsnipes",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341291] = {
					["source"] = "Riejo",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272126] = {
					["source"] = "Choccymilk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318391] = {
					["source"] = "Great Worm From Beyond",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 152550,
				},
				[48265] = {
					["source"] = "Fleam-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312107] = {
					["source"] = "Sorbetero-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201846] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[303344] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[129250] = {
					["source"] = "Thefinger-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[27243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[12294] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[303345] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Katsumyo-KhazModan",
					["npcID"] = 0,
				},
				[16739] = {
					["source"] = "Nidee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Theaous-Terenas",
					["npcID"] = 0,
				},
				[268899] = {
					["source"] = "Purplesipp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318187] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[295367] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17] = {
					["source"] = "Fadedline-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316220] = {
					["source"] = "Purplesipp",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[115356] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[116841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[280433] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ampzz",
					["npcID"] = 0,
				},
				[304372] = {
					["source"] = "Strip",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118000] = {
					["source"] = "Arkeos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[342242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Malor",
					["npcID"] = 0,
				},
				[257415] = {
					["source"] = "Rootsalot-Muradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49184] = {
					["source"] = "Naeb",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2641] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sohjen",
					["npcID"] = 0,
				},
				[52127] = {
					["source"] = "Shâmaiden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113899] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 59262,
				},
				[279810] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Halleluia",
					["npcID"] = 0,
				},
				[280615] = {
					["source"] = "Steverz-Daggerspine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[48778] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Locasten",
					["npcID"] = 0,
				},
				[269576] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59052] = {
					["source"] = "Naeb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nivalisa",
					["npcID"] = 0,
				},
				[268955] = {
					["source"] = "Tjmackey",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162530] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Punchmeh",
					["npcID"] = 0,
				},
				[184575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[257161] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 140482,
				},
				[267330] = {
					["source"] = "Detrasxx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[335082] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderpump",
					["npcID"] = 0,
				},
				[264760] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20271] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Supreme-Drak'thul",
					["npcID"] = 0,
				},
				[113900] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 59271,
				},
				[272733] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123725] = {
					["source"] = "Ayàki",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251838] = {
					["source"] = "Felenkeller-Bloodscalp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257418] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shadders-Hydraxis",
					["npcID"] = 0,
				},
				[193641] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[256434] = {
					["source"] = "Darknnis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273232] = {
					["source"] = "Taayswifty",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271370] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eilina",
					["npcID"] = 0,
				},
				[30455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[104945] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Boralus Civilian",
					["npcID"] = 135603,
				},
				[224869] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lillykaze",
					["npcID"] = 0,
				},
				[204197] = {
					["source"] = "Thefinger-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[112866] = {
					["source"] = "Tjmackey",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275544] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124506] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[307026] = {
					["source"] = "Sorbetero-Cenarius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285959] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[6673] = {
					["source"] = "Toromata",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[257420] = {
					["source"] = "Arika",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256231] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[300801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ènvenom",
					["npcID"] = 0,
				},
				[116844] = {
					["source"] = "Adraak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188443] = {
					["source"] = "Holyginz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196770] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[115181] = {
					["source"] = "Ayàki",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[23214] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lucee",
					["npcID"] = 0,
				},
				[54149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Atheñá",
					["npcID"] = 0,
				},
				[300802] = {
					["source"] = "Reifal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[334463] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[114282] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Adareesa",
					["npcID"] = 0,
				},
				[61295] = {
					["source"] = "Hulah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68996] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Didymus",
					["npcID"] = 0,
				},
				[173184] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[46924] = {
					["source"] = "Nixasa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257422] = {
					["source"] = "Papalshaft-Bloodscalp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[270674] = {
					["source"] = "Ragingmidget-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[104276] = {
					["source"] = "Shiliao-Arathor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49020] = {
					["source"] = "Naeb",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wolvarine",
					["npcID"] = 0,
				},
				[313088] = {
					["source"] = "Dumpee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288074] = {
					["source"] = "Lydz-Ner'zhul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108271] = {
					["source"] = "Woozii",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[310530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Karazorrel",
					["npcID"] = 0,
				},
				[270332] = {
					["source"] = "Kéoni",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259491] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[294142] = {
					["source"] = "Ormak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273685] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193455] = {
					["source"] = "Celíara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210126] = {
					["source"] = "Razzdin-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186263] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hysterialol",
					["npcID"] = 0,
				},
				[194223] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Måxwell",
					["npcID"] = 0,
				},
				[119582] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Listrisa",
					["npcID"] = 0,
				},
				[188033] = {
					["source"] = "Prexxus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Janlevinson-Korgath",
					["npcID"] = 0,
				},
				[2649] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Banthalos",
					["npcID"] = 54320,
				},
				[193456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aralith-Ner'zhul",
					["npcID"] = 0,
				},
				[248622] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[187827] = {
					["source"] = "Foamite",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192106] = {
					["source"] = "Infaustus-Nordrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176458] = {
					["source"] = "Blacksmithing Follower - Alliance",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 88403,
				},
				[30213] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[285720] = {
					["source"] = "Araphia",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68992] = {
					["source"] = "Restax",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[63106] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[199854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[26573] = {
					["source"] = "Reifal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[212653] = {
					["source"] = "Fantastic-Nazgrel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268998] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116847] = {
					["source"] = "Ayàki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43198] = {
					["source"] = "Amulii",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152262] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bedavere",
					["npcID"] = 0,
				},
				[319237] = {
					["source"] = "Felenkeller-Bloodscalp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tjmackey",
					["npcID"] = 0,
				},
				[131894] = {
					["source"] = "Kéoni",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197214] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[51723] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Littrok",
					["npcID"] = 0,
				},
				[260242] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118699] = {
					["source"] = "Casuals",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[60103] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[199600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dàrkstar",
					["npcID"] = 0,
				},
				[100] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saix",
					["npcID"] = 0,
				},
				[288613] = {
					["source"] = "Carathiel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Karazorrel",
					["npcID"] = 0,
				},
				[185562] = {
					["source"] = "Slatebiscuit",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279584] = {
					["source"] = "Tbonelli-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162243] = {
					["source"] = "Taayswifty",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rholdan",
					["npcID"] = 0,
				},
				[2645] = {
					["source"] = "Azurefisher",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[293142] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[321507] = {
					["source"] = "Musetta",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1329] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verellyse",
					["npcID"] = 0,
				},
				[317420] = {
					["source"] = "Piker-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[327942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 6112,
				},
				[318219] = {
					["source"] = "Tbonelli-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164547] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228260] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205179] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Retraso",
					["npcID"] = 0,
				},
				[298700] = {
					["source"] = "Wadizzle-Bloodscalp",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302917] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celíara",
					["npcID"] = 0,
				},
				[223143] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yede",
					["npcID"] = 0,
				},
				[303380] = {
					["source"] = "Taleeha",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190356] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[267558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faylon-Silvermoon",
					["npcID"] = 0,
				},
				[199603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dàrkstar",
					["npcID"] = 0,
				},
				[280709] = {
					["source"] = "Wanknspaynk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188499] = {
					["source"] = "Taayswifty",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41425] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Jonimitchelz",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266779] = {
					["source"] = "Kéoni",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287790] = {
					["source"] = "Soraku",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267560] = {
					["source"] = "Abinsuur-Shu'halo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alâeyra",
					["npcID"] = 0,
				},
				[255129] = {
					["source"] = "Xènon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285472] = {
					["source"] = "Dridien",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295137] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soulfab",
					["npcID"] = 0,
				},
				[51505] = {
					["source"] = "Bebhelle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[344324] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Doomguard",
					["npcID"] = 11859,
				},
				[264761] = {
					["source"] = "Holyginz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313948] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Timmnmm",
					["npcID"] = 0,
				},
				[298839] = {
					["source"] = "Deätheater-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186406] = {
					["source"] = "Celíara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202164] = {
					["source"] = "Rahnokan-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253595] = {
					["source"] = "Mirithana-KulTiras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norindrel",
					["npcID"] = 0,
				},
				[304062] = {
					["source"] = "Dread Captain DeMeza",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154335,
				},
				[318227] = {
					["source"] = "Fendweller",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207744] = {
					["source"] = "Sanzaku",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300761] = {
					["source"] = "Riejo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[11426] = {
					["source"] = "Magebeast-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[293664] = {
					["source"] = "Mirithana-KulTiras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225919] = {
					["source"] = "Sanzaku",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[266030] = {
					["source"] = "Azulinix",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313310] = {
					["source"] = "Musetta",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279715] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[251837] = {
					["source"] = "Razzdin-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5672] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3527,
				},
				[51533] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[204213] = {
					["source"] = "Thefinger-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[247456] = {
					["source"] = "Zorkone",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313113] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Døs",
					["npcID"] = 0,
				},
				[299296] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Queldias-Perenolde",
					["npcID"] = 0,
				},
				[326419] = {
					["source"] = "Unrest-Dunemaul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341260] = {
					["source"] = "Senorau",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315161] = {
					["source"] = "Carathiel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49998] = {
					["source"] = "Fendweller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279028] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magmarupt",
					["npcID"] = 0,
				},
				[256948] = {
					["source"] = "Velithriel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chinhold",
					["npcID"] = 0,
				},
				[162264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[58506] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 137024,
				},
				[1449] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Eriselin",
					["npcID"] = 0,
				},
				[28694] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drastania",
					["npcID"] = 0,
				},
				[86659] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wolvarine",
					["npcID"] = 0,
				},
				[53390] = {
					["source"] = "Hulah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[341263] = {
					["source"] = "Riejo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1459] = {
					["source"] = "Ciradyl-Cairne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jonimitchelz",
					["npcID"] = 0,
				},
				[273843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azaziall",
					["npcID"] = 0,
				},
				[234153] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Felspark",
					["npcID"] = 0,
				},
				[196941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Atheñá",
					["npcID"] = 0,
				},
				[268905] = {
					["source"] = "Sainted-Cenarius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1953] = {
					["source"] = "Smoldertor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kayliuh",
					["npcID"] = 0,
				},
				[289324] = {
					["source"] = "Adraak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126457] = {
					["source"] = "Angeleca",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hordedwarf",
					["npcID"] = 0,
				},
				[86603] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 61838,
				},
				[31884] = {
					["source"] = "Save",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[167898] = {
					["source"] = "Atian-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12051] = {
					["source"] = "Bananafish",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mágiere",
					["npcID"] = 0,
				},
				[5740] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chinhold",
					["npcID"] = 0,
				},
				[215598] = {
					["source"] = "Tengold",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201427] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zombiezig",
					["npcID"] = 0,
				},
				[23920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ons",
					["npcID"] = 0,
				},
				[242599] = {
					["source"] = "Unrest-Dunemaul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315681] = {
					["source"] = "Gimmik-Whisperwind",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297989] = {
					["source"] = "Twelveinches",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[52174] = {
					["source"] = "Cheld",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1066] = {
					["source"] = "Pessimists",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[148539] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33943] = {
					["source"] = "Vændiskarl",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256074] = {
					["source"] = "Kandyraider",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115191] = {
					["source"] = "Unmatched",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124211] = {
					["source"] = "Slashemsz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tayjor",
					["npcID"] = 0,
				},
				[196555] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nyxeea",
					["npcID"] = 0,
				},
				[198590] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dotspot",
					["npcID"] = 0,
				},
				[54861] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Valghard",
					["npcID"] = 0,
				},
				[297118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mortalbane",
					["npcID"] = 0,
				},
				[124275] = {
					["source"] = "Ayàki",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[148541] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
			},
			["aura2_x_offset"] = 0,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.15",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateGlobalScale"] = "1.0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateMinScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateSelfAlpha"] = "0.75",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowSelf"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 52,
			["aura_y_offset"] = 5,
			["use_ui_parent"] = true,
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 50,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Name"] = "Color Automation [Plater]",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["Time"] = 1547392935,
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Hide Neutral Units [Plater]",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1990989,
					["Time"] = 1541606242,
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 348,
					["Options"] = {
						{
							["Type"] = 5,
							["Name"] = "Icon Settings",
							["Value"] = "Icon Settings:",
							["Key"] = "option4",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [1]
						{
							["Type"] = 4,
							["Name"] = "Show Icon",
							["Value"] = true,
							["Key"] = "showIcon",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "Show the castbar icon when enabled",
						}, -- [2]
						{
							["Type"] = 4,
							["Name"] = "Icon on Left Side",
							["Value"] = true,
							["Key"] = "iconOnLeftSide",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled it anchor the icon on the left side, right otherwise",
						}, -- [3]
						{
							["Type"] = 4,
							["Key"] = "useFullSize",
							["Value"] = false,
							["Name"] = "Use Big Icon",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled the icon has the size of the cast bar plus the healthbar",
						}, -- [4]
						{
							["Type"] = 2,
							["Max"] = 5,
							["Desc"] = "Fine tune the icon size",
							["Min"] = 0,
							["Fraction"] = true,
							["Value"] = 0,
							["Key"] = "iconSizeOffset",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Icon Size Offset",
						}, -- [5]
						{
							["Type"] = 2,
							["Max"] = 5,
							["Desc"] = "Space between the icon and the cast bar",
							["Min"] = -5,
							["Name"] = "Icon Padding",
							["Value"] = 0,
							["Fraction"] = false,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "iconPadding",
						}, -- [6]
						{
							["Type"] = 6,
							["Name"] = "Blank Space",
							["Value"] = 0,
							["Key"] = "option6",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
							["Desc"] = "",
						}, -- [7]
						{
							["Type"] = 5,
							["Name"] = "Interrupt Texture",
							["Value"] = "Can't Interrupt Texture:",
							["Key"] = "option5",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
							["Desc"] = "",
						}, -- [8]
						{
							["Type"] = 4,
							["Name"] = "Show Texture",
							["Value"] = true,
							["Key"] = "showTexture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enabled show a texture to tell the cast can't be interrupted",
						}, -- [9]
						{
							["Type"] = 3,
							["Name"] = "Texture Path",
							["Value"] = "Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON",
							["Key"] = "iconTexturePath",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
							["Desc"] = "Insert the path for the texture",
						}, -- [10]
						{
							["Type"] = 4,
							["Name"] = "Texture Desaturated",
							["Value"] = true,
							["Key"] = "desaturatedTexture",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
							["Desc"] = "If enbaled, texture is shown in black & white",
						}, -- [11]
						{
							["Type"] = 1,
							["Name"] = "Texture Color",
							["Value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.3056715726852417, -- [4]
							},
							["Key"] = "textureColor",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
							["Desc"] = "Select the color of the texture",
						}, -- [12]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Adjust the texture width",
							["Min"] = 1,
							["Fraction"] = false,
							["Value"] = 10,
							["Key"] = "textureWidth",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Texture Width",
						}, -- [13]
						{
							["Type"] = 2,
							["Max"] = 16,
							["Desc"] = "The texture is set to be the same size as the cast bar, fine tune the height as wanted",
							["Min"] = -16,
							["Name"] = "Texture Height Mod",
							["Value"] = 0,
							["Fraction"] = true,
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Key"] = "textureHeightMod",
						}, -- [14]
						{
							["Type"] = 2,
							["Max"] = 32,
							["Desc"] = "Adjust the texture position",
							["Min"] = -32,
							["Fraction"] = false,
							["Value"] = 0,
							["Key"] = "texturePosition",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Name"] = "Texture Position",
						}, -- [15]
						{
							["Type"] = 2,
							["Max"] = 1,
							["Desc"] = "Adjust the texture transparency",
							["Min"] = 0,
							["Key"] = "textureAlpha",
							["Value"] = 1,
							["Name"] = "Texture Alpha",
							["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
							["Fraction"] = true,
						}, -- [16]
					},
					["HooksTemp"] = {
					},
					["semver"] = "",
					["Author"] = "Ditador-Azralon",
					["version"] = -1,
					["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
					["Hooks"] = {
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Name"] = "Cast Bar Icon Settings [P]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\castbar_icon",
					["Time"] = 1597097268,
				}, -- [3]
				{
					["Enabled"] = false,
					["Revision"] = 59,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Don't Have Aura [Plater]",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 136207,
					["Time"] = 1554138845,
				}, -- [4]
				{
					["Enabled"] = false,
					["Revision"] = 84,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Name"] = "Execute Range [Plater]",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 135358,
					["Time"] = 1547406548,
				}, -- [5]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["Options"] = {
					},
					["HooksTemp"] = {
					},
					["semver"] = "",
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Name"] = "Reorder Nameplate [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 574574,
					["Time"] = 1596791840,
				}, -- [6]
				{
					["Enabled"] = false,
					["Revision"] = 222,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Name"] = "Attacking Specific Unit [Plater]",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["Time"] = 1547993111,
				}, -- [7]
				{
					["Enabled"] = false,
					["Revision"] = 176,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Name"] = "Extra Border [Plater]",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 133689,
					["Time"] = 1547409079,
				}, -- [8]
				{
					["Enabled"] = false,
					["Revision"] = 189,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Combo Points [Plater]",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
							[103] = true,
							["Enabled"] = true,
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 135426,
					["Time"] = 1548354524,
				}, -- [9]
				{
					["Enabled"] = false,
					["Revision"] = 182,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Players Targeting a Target [Plater]",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1966587,
					["Time"] = 1548278227,
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Name"] = "Current Target Color [Plater]",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["version"] = -1,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 878211,
					["Time"] = 1552354619,
				}, -- [11]
				{
					["Enabled"] = false,
					["Revision"] = 295,
					["Options"] = {
					},
					["HooksTemp"] = {
					},
					["semver"] = "",
					["Author"] = "Ditador-Azralon",
					["version"] = -1,
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        local horizontalLength = (-padding or 0)\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomleft\", anchorPoint, \"bottomleft\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end\n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomright\", anchorPoint, \"bottomright\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end                    \n            end\n            \n            --set the size of the buff frame\n            anchorPoint:SetWidth (horizontalLength)\n            anchorPoint:SetHeight (firstIcon:GetHeight())\n            \n        end\n    end\nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Name"] = "Aura Reorder [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Time"] = 1596741775,
				}, -- [12]
			},
			["aura_x_offset"] = 0,
			["first_run3"] = true,
			["ui_parent_scale_tune"] = 1.562500034924597,
			["aura_tracker"] = {
				["buff_tracked"] = {
					[209859] = true,
				},
			},
			["patch_version_profile"] = 1,
			["patch_version"] = 12,
			["number_region_first_run"] = true,
		},
	},
}
