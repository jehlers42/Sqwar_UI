
SkadaDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
			["char"] = {
				["Alaeana - Proudmoore"] = {
					"Tank", -- [1]
					"Default", -- [2]
					"Default", -- [3]
					["enabled"] = true,
				},
				["Celíara - Proudmoore"] = {
					"Default", -- [1]
					"Default", -- [2]
					"Default", -- [3]
					["enabled"] = true,
				},
				["Farathiel - Proudmoore"] = {
					"Default", -- [1]
					"Tank", -- [2]
					["enabled"] = true,
				},
				["Netiaa - Sargeras"] = {
					["profile"] = "Healers",
					["specGroup"] = 2,
					["enabled"] = true,
				},
				["Mirethiel - Sargeras"] = {
					"Default", -- [1]
					"Default", -- [2]
					"Tank", -- [3]
					"Default", -- [4]
					["enabled"] = true,
				},
			},
		},
	},
	["hasUpgraded"] = true,
	["profileKeys"] = {
		
	},
	["profiles"] = {
		["Default"] = {
			["report"] = {
				["channel"] = "raid",
			},
			["autostop"] = true,
			["showself"] = true,
			["versions"] = {
				["1.6.4"] = true,
				["1.6.3"] = true,
				["1.6.7"] = true,
			},
			["modulesBlocked"] = {
				["Enemies"] = false,
				["Friendly Fire"] = false,
				["Dispels"] = false,
				["Power"] = false,
			},
			["themes"] = {
				{
					["titleset"] = true,
					["barheight"] = 14,
					["color"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["issolidbackdrop"] = false,
					["classicons"] = false,
					["barslocked"] = true,
					["useframe"] = true,
					["modeincombat"] = "Damage",
					["wipemode"] = "",
					["set"] = "total",
					["hidden"] = false,
					["y"] = 1.00000751018524,
					["x"] = -6.999755859375,
					["name"] = "Sqwarlock",
					["height"] = 30,
					["title"] = {
						["textcolor"] = {
							["a"] = 1,
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["color"] = {
							["a"] = 0,
							["r"] = 0,
							["g"] = 0,
							["b"] = 1,
						},
						["bordertexture"] = "None",
						["font"] = "Sony_Sketch_EF",
						["borderthickness"] = 0,
						["bordercolor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["height"] = 13,
						["fontsize"] = 13,
						["fontflags"] = "",
						["texture"] = "Raven White",
					},
					["barfontflags"] = "",
					["isusingelvuiskin"] = true,
					["barfont"] = "stentiga",
					["strata"] = "LOW",
					["point"] = "BOTTOMRIGHT",
					["spellschoolcolors"] = true,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.125490196078431,
						["g"] = 0.541176470588235,
						["b"] = 0.866666666666667,
					},
					["enabletitle"] = true,
					["barfontsize"] = 11,
					["clickthrough"] = false,
					["returnaftercombat"] = true,
					["classcolortext"] = false,
					["roleicons"] = false,
					["barorientation"] = 1,
					["mode"] = "Damage",
					["showself"] = true,
					["isonnewline"] = false,
					["width"] = 600,
					["textcolor"] = {
						["r"] = 0.9,
						["g"] = 0.9,
						["b"] = 0.9,
					},
					["buttons"] = {
						["segment"] = true,
						["stop"] = false,
						["menu"] = true,
						["mode"] = false,
						["report"] = true,
						["reset"] = true,
					},
					["bartexture"] = "Raven Gray",
					["barwidth"] = 367.000244140625,
					["barspacing"] = 1,
					["scale"] = 1,
					["smoothing"] = false,
					["fixedbarwidth"] = false,
					["reversegrowth"] = false,
					["snapto"] = true,
					["classcolorbars"] = true,
					["isusingclasscolors"] = true,
					["version"] = 1,
					["background"] = {
						["height"] = 181.999969482422,
						["bordercolor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["borderthickness"] = 1,
						["tile"] = false,
						["color"] = {
							["a"] = 0,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["bordertexture"] = "None",
						["tilesize"] = 0,
						["texture"] = "None",
					},
					["display"] = "bar",
				}, -- [1]
			},
			["modules"] = {
				["threatsound"] = false,
				["threattreshold"] = 0,
				["threatsoundname"] = "None",
				["threatshake"] = false,
			},
			["showranks"] = false,
			["modeclicks"] = {
				["Threat"] = 2,
				["Enemy damage taken"] = 1,
				["Total healing"] = 1,
				["Enemy healing done"] = 1,
				["Healing"] = 4,
				["Enemy damage done"] = 1,
				["Damage"] = 67,
			},
			["setstokeep"] = 15,
			["windows"] = {
				{
					["barheight"] = 14,
					["barcolor"] = {
						["b"] = 0.866666666666667,
						["g"] = 0.541176470588235,
						["r"] = 0.125490196078431,
					},
					["barfontsize"] = 10,
					["classicons"] = false,
					["barslocked"] = true,
					["background"] = {
						["borderthickness"] = 0,
						["color"] = {
							["a"] = 0,
							["b"] = 0.129411764705882,
							["g"] = 0.129411764705882,
							["r"] = 0.976470588235294,
						},
						["bordertexture"] = "None",
						["height"] = 175.333297729492,
						["texture"] = "None",
					},
					["buttons"] = {
						["stop"] = false,
					},
					["barwidth"] = 373.667572021484,
					["barspacing"] = 1,
					["barfont"] = "stentiga",
					["bartexture"] = "Raven Gray",
					["y"] = 3.07596683502197,
					["x"] = -2.502685546875,
					["title"] = {
						["textcolor"] = {
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
						["borderthickness"] = 0,
						["font"] = "stentiga",
						["color"] = {
							["a"] = 0,
							["b"] = 1,
							["g"] = 0,
							["r"] = 0,
						},
						["fontsize"] = 11,
						["height"] = 14,
						["texture"] = "Raven White",
					},
					["name"] = "DPS",
					["returnaftercombat"] = true,
					["mode"] = "Damage",
					["modeincombat"] = "Damage",
					["point"] = "BOTTOMRIGHT",
				}, -- [1]
			},
			["tooltippos"] = "topleft",
			["icon"] = {
				["minimapPos"] = 47.6111242346361,
				["hide"] = true,
			},
			["reset"] = {
				["leave"] = 3,
				["instance"] = 3,
			},
		},
	},
}
