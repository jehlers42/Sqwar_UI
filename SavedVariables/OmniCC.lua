
OmniCCDB = {
	["profileKeys"] = {
		["Alaeana - Proudmoore"] = "Default",
		["Gwathren - Proudmoore"] = "Default",
		["Jiaxing - Proudmoore"] = "Default",
		["Lucrais - Proudmoore"] = "Default",
		["Sifrun - Proudmoore"] = "Default",
		["Celíara - Proudmoore"] = "Default",
		["Seimira - Proudmoore"] = "Default",
		["Athaeriel - Proudmoore"] = "Default",
		["Gwathren - Hyjal"] = "Default",
		["Celiara - Hyjal"] = "Default",
		["Mirethiel - Proudmoore"] = "Default",
		["Kathlian - Proudmoore"] = "Default",
		["Farathiel - Proudmoore"] = "Default",
		["Velithriel - Proudmoore"] = "Default",
		["Ravna - Proudmoore"] = "Default",
	},
	["global"] = {
		["addonVersion"] = "9.0.4",
		["dbVersion"] = 5,
	},
	["profiles"] = {
		["Default"] = {
			["themes"] = {
				["Default"] = {
					["textStyles"] = {
						["minutes"] = {
							["r"] = 0,
							["g"] = 0.7372549019607844,
							["b"] = 0.4901960784313725,
						},
						["soon"] = {
							["g"] = 0,
							["b"] = 0.3215686274509804,
						},
						["seconds"] = {
							["g"] = 0.5725490196078431,
							["b"] = 0,
						},
					},
					["fontSize"] = 19,
					["fontFace"] = "Interface\\Addons\\SharedMedia_MyMedia\\font\\stentiga.ttf",
					["yOff"] = -1,
				},
				["Plater Nameplates Theme"] = {
					["textStyles"] = {
						["minutes"] = {
						},
						["soon"] = {
						},
						["seconds"] = {
						},
					},
				},
			},
			["rules"] = {
				{
					["id"] = "Plater Nameplates Rule",
					["patterns"] = {
						"PlaterMainAuraIcon", -- [1]
						"PlaterSecondaryAuraIcon", -- [2]
						"ExtraIconRowIcon", -- [3]
					},
					["theme"] = "Plater Nameplates Theme",
					["priority"] = 1,
				}, -- [1]
			},
		},
	},
}
OmniCC4Config = nil
