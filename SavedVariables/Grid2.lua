
Grid2DB = {
	["namespaces"] = {
		["Grid2AoeHeals"] = {
		},
		["Grid2RaidDebuffs"] = {
		},
		["Grid2Layout"] = {
			["global"] = {
				["customLayouts"] = {
					["Spread"] = {
						{
							["maxColumns"] = 1,
							["type"] = "raid",
							["sortMethod"] = "INDEX",
							["unitsPerColumn"] = 5,
							["groupFilter"] = "4",
						}, -- [1]
						{
							["maxColumns"] = 1,
							["type"] = "raid",
							["sortMethod"] = "INDEX",
							["unitsPerColumn"] = 5,
							["groupFilter"] = "2",
						}, -- [2]
						{
							["maxColumns"] = 1,
							["type"] = "raid",
							["sortMethod"] = "INDEX",
							["unitsPerColumn"] = 5,
							["groupFilter"] = "1",
						}, -- [3]
						{
							["maxColumns"] = 1,
							["type"] = "raid",
							["sortMethod"] = "INDEX",
							["unitsPerColumn"] = 5,
							["groupFilter"] = "3",
						}, -- [4]
						{
							["maxColumns"] = 1,
							["type"] = "raid",
							["sortMethod"] = "INDEX",
							["unitsPerColumn"] = 5,
							["groupFilter"] = "5",
						}, -- [5]
						["meta"] = {
							["solo"] = true,
							["raid10"] = true,
							["pvp"] = true,
							["party"] = true,
							["raid40"] = true,
							["raid"] = true,
							["raid25"] = true,
							["arena"] = true,
							["raid20"] = true,
							["raid15"] = true,
						},
						["defaults"] = {
							["showSolo"] = true,
							["showRaid"] = true,
							["showPlayer"] = true,
							["showParty"] = true,
							["toggleForVehicle"] = true,
						},
					},
				},
			},
			["profiles"] = {
				["Default"] = {
					["BorderB"] = 0,
					["layouts"] = {
						["solo"] = "Spread",
						["raid10"] = "Spread",
						["party"] = "Spread",
						["raid40"] = "By Group 25",
						["raid"] = "Spread",
						["raid25"] = "By Group 25",
						["arena"] = "Spread",
						["raid20"] = "Spread",
						["raid15"] = "Spread",
					},
					["BackgroundR"] = 1,
					["ScaleSize"] = 0.85,
					["FrameLock"] = true,
					["BorderR"] = 0,
					["BorderTexture"] = "None",
					["clamp"] = false,
					["minimapIcon"] = {
						["hide"] = true,
					},
					["PosY"] = -240.165176715401,
					["PosX"] = -2.026008223765530e-005,
					["anchor"] = "CENTER",
					["BackgroundA"] = 0,
					["FrameDisplay"] = "Grouped",
					["BorderG"] = 0,
					["BackgroundB"] = 1,
					["Spacing"] = 0,
					["BackgroundG"] = 1,
				},
			},
		},
		["LibDualSpec-1.0"] = {
			["char"] = {
				["Ithilien - Sargeras"] = {
					"Default", -- [1]
					"DPS/Tank", -- [2]
					"DPS/Tank", -- [3]
					["enabled"] = false,
				},
			},
		},
		["Grid2Options"] = {
		},
		["Grid2Utils"] = {
		},
		["Grid2Frame"] = {
			["profiles"] = {
				["Default"] = {
					["frameBorder"] = 1,
					["frameTexture"] = "Flat",
					["font"] = "stentiga",
					["frameHeight"] = 40,
					["frameContentColor"] = {
						["b"] = 0.258823529411765,
						["g"] = 0.258823529411765,
						["r"] = 0.258823529411765,
					},
					["frameWidth"] = 85,
					["orientation"] = "HORIZONTAL",
				},
			},
		},
	},
	["profileKeys"] = {

	},
	["profiles"] = {
		["Default"] = {
			["hideBlizzardRaidFrames"] = true,
			["indicators"] = {
				["corner-top-left"] = {
					["type"] = "text",
					["font"] = "Friz Quadrata TT",
					["duration"] = true,
					["location"] = {
						["y"] = 0,
						["relPoint"] = "TOPLEFT",
						["point"] = "TOPLEFT",
						["x"] = 0,
					},
					["level"] = 9,
					["textlength"] = 12,
					["fontSize"] = 8,
				},
				["side-top"] = {
					["type"] = "square",
					["duration"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["font"] = "Friz Quadrata TT",
					["borderSize"] = 1,
					["fontSize"] = 8,
					["location"] = {
						["y"] = 1,
						["relPoint"] = "TOP",
						["point"] = "TOP",
						["x"] = 0,
					},
					["level"] = 9,
					["textlength"] = 12,
					["size"] = 10,
				},
				["corner-bottom-right"] = {
					["type"] = "square",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["location"] = {
						["y"] = -1,
						["relPoint"] = "BOTTOMRIGHT",
						["point"] = "BOTTOMRIGHT",
						["x"] = 1,
					},
					["level"] = 9,
					["borderSize"] = 1,
					["size"] = 10,
				},
				["text-down"] = {
					["type"] = "text",
					["fontSize"] = 15,
					["location"] = {
						["y"] = -1,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 6,
					["textlength"] = 4,
					["font"] = "stentiga",
				},
				["icon-left"] = {
					["fontSize"] = 8,
					["duration"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["type"] = "square",
					["borderSize"] = 1,
					["font"] = "Friz Quadrata TT",
					["stack"] = false,
					["location"] = {
						["y"] = 0,
						["relPoint"] = "LEFT",
						["point"] = "LEFT",
						["x"] = -1,
					},
					["level"] = 8,
					["textlength"] = 12,
					["size"] = 10,
				},
				["border"] = {
					["color1"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "border",
				},
				["text-down-color"] = {
					["type"] = "text-color",
				},
				["icon-center"] = {
					["type"] = "icon",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 8,
					["fontSize"] = 8,
					["size"] = 14,
				},
				["health-color"] = {
					["type"] = "bar-color",
				},
				["icon-right"] = {
					["type"] = "icon",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "RIGHT",
						["point"] = "RIGHT",
						["x"] = 2,
					},
					["level"] = 8,
					["fontSize"] = 8,
					["size"] = 12,
				},
				["heals-color"] = {
					["type"] = "bar-color",
				},
				["alpha"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "alpha",
				},
				["heals"] = {
					["type"] = "bar",
					["color1"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["orientation"] = "VERTICAL",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "BOTTOM",
						["point"] = "BOTTOM",
						["x"] = 0,
					},
					["level"] = 8,
					["opacity"] = 0.5,
					["texture"] = "Raven Reverso",
				},
				["corner-top-right"] = {
					["type"] = "square",
					["duration"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["font"] = "Friz Quadrata TT",
					["borderSize"] = 1,
					["fontSize"] = 8,
					["location"] = {
						["y"] = 1,
						["relPoint"] = "TOPRIGHT",
						["point"] = "TOPRIGHT",
						["x"] = 1,
					},
					["level"] = 9,
					["textlength"] = 12,
					["size"] = 10,
				},
				["corner-top-left-color"] = {
					["type"] = "text-color",
				},
				["corner-bottom-left"] = {
					["type"] = "square",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "BOTTOMLEFT",
						["point"] = "BOTTOMLEFT",
						["x"] = 0,
					},
					["level"] = 5,
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["size"] = 5,
				},
				["text-up"] = {
					["type"] = "text",
					["font"] = "stentiga",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 7,
					["textlength"] = 4,
					["fontSize"] = 18,
				},
				["text-up-color"] = {
					["type"] = "text-color",
				},
				["health"] = {
					["type"] = "bar",
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 2,
					["opacity"] = 1,
					["texture"] = "Grid2 Flat",
				},
				["side-bottom"] = {
					["type"] = "square",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["location"] = {
						["y"] = -1,
						["relPoint"] = "BOTTOM",
						["point"] = "BOTTOM",
						["x"] = 0,
					},
					["level"] = 6,
					["borderSize"] = 1,
					["size"] = 10,
				},
			},
			["statuses"] = {
				["buff-Regrowth-mine"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.647058823529412,
						["r"] = 0.176470588235294,
					},
					["type"] = "buff",
					["color3"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.282352941176471,
						["r"] = 0.0784313725490196,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 0.274509803921569,
					},
					["mine"] = true,
					["colorCount"] = 3,
					["colorThreshold"] = {
						6, -- [1]
						3, -- [2]
					},
					["spellName"] = 8936,
				},
				["heals-incoming"] = {
					["includePlayerHeals"] = true,
				},
				["buff-WildGrowth-mine"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0.2,
						["g"] = 0.9,
						["r"] = 0.2,
					},
					["type"] = "buff",
					["mine"] = true,
					["spellName"] = 48438,
				},
				["buff-Rejuvenation-mine"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 0.545098039215686,
						["g"] = 0,
						["r"] = 0.545098039215686,
					},
					["type"] = "buff",
					["color3"] = {
						["a"] = 1,
						["b"] = 0.305882352941177,
						["g"] = 0,
						["r"] = 0.305882352941177,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 1,
					},
					["mine"] = true,
					["colorCount"] = 3,
					["colorThreshold"] = {
						6, -- [1]
						3, -- [2]
					},
					["spellName"] = 774,
				},
				["debuff-Priest>WeakenedSoul"] = {
					["type"] = "debuff",
					["color1"] = {
						["a"] = 1,
						["b"] = 0.219607843137255,
						["g"] = 0.0156862745098039,
						["r"] = 0.501960784313726,
					},
					["spellName"] = 6788,
				},
				["ready-check"] = {
					["color3"] = {
						["r"] = 0.266666666666667,
					},
					["color2"] = {
						["g"] = 0.337254901960784,
					},
					["color1"] = {
						["g"] = 0.63921568627451,
						["r"] = 0.63921568627451,
					},
				},
				["classcolor"] = {
					["colors"] = {
						["HUNTER"] = {
							["b"] = 0.431372549019608,
							["g"] = 0.780392156862745,
							["r"] = 0.635294117647059,
						},
						["PALADIN"] = {
							["b"] = 0.713725490196079,
							["g"] = 0.392156862745098,
							["r"] = 0.780392156862745,
						},
						["MAGE"] = {
							["b"] = 0.92156862745098,
							["g"] = 0.807843137254902,
							["r"] = 0,
						},
						["DRUID"] = {
							["b"] = 0.0823529411764706,
							["g"] = 0.415686274509804,
							["r"] = 0.811764705882353,
						},
						["MONK"] = {
							["g"] = 0.670588235294118,
							["b"] = 0.458823529411765,
						},
						["DEATHKNIGHT"] = {
							["b"] = 0.235294117647059,
							["g"] = 0,
							["r"] = 0.654901960784314,
						},
						["PRIEST"] = {
							["b"] = 0.850980392156863,
							["g"] = 0.850980392156863,
							["r"] = 0.850980392156863,
						},
						["WARRIOR"] = {
							["b"] = 0.2,
							["g"] = 0.282352941176471,
							["r"] = 0.368627450980392,
						},
						["WARLOCK"] = {
							["b"] = 0.623529411764706,
							["g"] = 0.0745098039215686,
							["r"] = 0.415686274509804,
						},
						["ROGUE"] = {
							["g"] = 0.968627450980392,
							["b"] = 0.4,
						},
						["SHAMAN"] = {
							["g"] = 0.337254901960784,
							["b"] = 0.670588235294118,
						},
					},
				},
				["buff-Lifebloom-mine"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 0.6,
						["g"] = 0.9,
						["r"] = 0.6,
					},
					["type"] = "buff",
					["color3"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0.2,
						["g"] = 0.7,
						["r"] = 0.2,
					},
					["colorCount"] = 3,
					["mine"] = true,
					["spellName"] = 33763,
				},
				["buff-Atonement-mine"] = {
					["color2"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0.317647058823529,
						["b"] = 0.254901960784314,
					},
					["type"] = "buff",
					["spellName"] = "Atonement",
					["mine"] = 1,
					["colorCount"] = 2,
					["colorThreshold"] = {
						6, -- [1]
					},
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0.96078431372549,
					},
				},
				["buff-PowerWord:Shield"] = {
					["color2"] = {
						["a"] = 1,
						["b"] = 0.254901960784314,
						["g"] = 0.603921568627451,
						["r"] = 0.63921568627451,
					},
					["type"] = "buff",
					["color3"] = {
						["a"] = 1,
						["b"] = 0.101960784313725,
						["g"] = 0.243137254901961,
						["r"] = 0.258823529411765,
					},
					["color1"] = {
						["a"] = 1,
						["b"] = 0.4,
						["g"] = 0.941176470588235,
						["r"] = 1,
					},
					["mine"] = false,
					["colorCount"] = 3,
					["colorThreshold"] = {
						5, -- [1]
						1, -- [2]
					},
					["spellName"] = 17,
				},
			},
			["versions"] = {
				["Grid2"] = 5,
				["Grid2RaidDebuffs"] = 4,
			},
			["statusMap"] = {
				["corner-top-left"] = {
				},
				["side-top"] = {
					["buff-Regrowth-mine"] = 99,
				},
				["corner-bottom-right"] = {
					["buff-Atonement-mine"] = 50,
				},
				["text-down"] = {
				},
				["icon-left"] = {
					["dungeon-role"] = 50,
				},
				["border"] = {
					["target"] = 50,
					["health-low"] = 55,
				},
				["text-down-color"] = {
				},
				["icon-center"] = {
					["debuff-Disease"] = 151,
					["debuff-Curse"] = 152,
					["death"] = 150,
				},
				["heals"] = {
					["heals-incoming"] = 50,
					["shields"] = 51,
				},
				["corner-top-right"] = {
					["buff-PowerWord:Shield"] = 50,
					["ready-check"] = 51,
				},
				["heals-color"] = {
					["shields"] = 50,
				},
				["alpha"] = {
					["offline"] = 97,
					["range"] = 99,
					["death"] = 98,
				},
				["health-color"] = {
					["classcolor"] = 50,
				},
				["health"] = {
					["health-current"] = 99,
				},
				["corner-bottom-left"] = {
					["threat"] = 99,
				},
				["text-up"] = {
					["charmed"] = 65,
					["name"] = 97,
					["health-deficit"] = 50,
					["feign-death"] = 96,
					["offline"] = 93,
					["vehicle"] = 70,
					["death"] = 95,
				},
				["text-up-color"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["health-deficit"] = 50,
					["offline"] = 93,
					["vehicle"] = 70,
					["death"] = 95,
				},
				["corner-top-left-color"] = {
					["buff-Lifebloom-mine"] = 99,
				},
				["side-bottom"] = {
					["buff-Rejuvenation-mine"] = 50,
				},
			},
		},
		["Celíara - Proudmoore"] = {
			["indicators"] = {
				["heals"] = {
					["type"] = "bar",
					["color1"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["anchorTo"] = "health",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 1,
					["opacity"] = 0.25,
					["texture"] = "Gradient",
				},
				["icon-right"] = {
					["type"] = "icon",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "RIGHT",
						["point"] = "RIGHT",
						["x"] = 2,
					},
					["level"] = 8,
					["fontSize"] = 8,
					["size"] = 12,
				},
				["heals-color"] = {
					["type"] = "bar-color",
				},
				["icon-left"] = {
					["type"] = "icon",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "LEFT",
						["point"] = "LEFT",
						["x"] = -2,
					},
					["level"] = 8,
					["fontSize"] = 8,
					["size"] = 12,
				},
				["alpha"] = {
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "alpha",
				},
				["text-down-color"] = {
					["type"] = "text-color",
				},
				["text-down"] = {
					["type"] = "text",
					["location"] = {
						["y"] = 4,
						["relPoint"] = "BOTTOM",
						["point"] = "BOTTOM",
						["x"] = 0,
					},
					["level"] = 6,
					["textlength"] = 6,
					["fontSize"] = 8,
				},
				["border"] = {
					["color1"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["type"] = "border",
				},
				["health"] = {
					["type"] = "bar",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 2,
					["color1"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["texture"] = "Gradient",
				},
				["text-up"] = {
					["type"] = "text",
					["location"] = {
						["y"] = -8,
						["relPoint"] = "TOP",
						["point"] = "TOP",
						["x"] = 0,
					},
					["level"] = 7,
					["textlength"] = 6,
					["fontSize"] = 8,
				},
				["corner-bottom-left"] = {
					["type"] = "square",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "BOTTOMLEFT",
						["point"] = "BOTTOMLEFT",
						["x"] = 0,
					},
					["level"] = 5,
					["color1"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["size"] = 5,
				},
				["text-up-color"] = {
					["type"] = "text-color",
				},
				["health-color"] = {
					["type"] = "bar-color",
				},
				["icon-center"] = {
					["type"] = "icon",
					["location"] = {
						["y"] = 0,
						["relPoint"] = "CENTER",
						["point"] = "CENTER",
						["x"] = 0,
					},
					["level"] = 8,
					["fontSize"] = 8,
					["size"] = 14,
				},
			},
			["versions"] = {
				["Grid2"] = 5,
				["Grid2RaidDebuffs"] = 4,
			},
			["statusMap"] = {
				["heals"] = {
					["heals-incoming"] = 99,
				},
				["text-down"] = {
					["name"] = 99,
				},
				["heals-color"] = {
					["classcolor"] = 99,
				},
				["icon-left"] = {
					["raid-icon-player"] = 155,
				},
				["alpha"] = {
					["offline"] = 97,
					["range"] = 99,
					["death"] = 98,
				},
				["text-down-color"] = {
					["classcolor"] = 99,
				},
				["border"] = {
					["target"] = 50,
					["health-low"] = 55,
				},
				["health"] = {
					["health-current"] = 99,
				},
				["text-up"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["health-deficit"] = 50,
					["offline"] = 93,
					["vehicle"] = 70,
					["death"] = 95,
				},
				["corner-bottom-left"] = {
					["threat"] = 99,
				},
				["text-up-color"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["health-deficit"] = 50,
					["offline"] = 93,
					["vehicle"] = 70,
					["death"] = 95,
				},
				["health-color"] = {
					["classcolor"] = 99,
				},
				["icon-center"] = {
					["ready-check"] = 150,
					["raid-debuffs"] = 155,
					["death"] = 155,
				},
			},
		},
	},
}
