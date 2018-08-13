
Quartz3DB = {
	["namespaces"] = {
		["Swing"] = {
			["profiles"] = {
				["Default"] = {
					["swinggap"] = -2,
					["swingheight"] = 2,
					["durationtext"] = false,
					["remainingtext"] = false,
					["swingposition"] = "bottom",
				},
			},
		},
		["Buff"] = {
			["profiles"] = {
				["Default"] = {
					["bufffontsize"] = 11,
					["Poison"] = {
						0.0980392156862745, -- [1]
						0.647058823529412, -- [2]
						0.0980392156862745, -- [3]
						1, -- [4]
					},
					["bufftexture"] = "Flat Smooth",
					["target"] = false,
					["targetheight"] = 16,
					["targetbuffs"] = false,
					["Magic"] = {
						nil, -- [1]
						0.694117647058824, -- [2]
						0.725490196078431, -- [3]
						1, -- [4]
					},
					["targetgap"] = 3,
					["debuffcolor"] = {
						0.6, -- [1]
						0.00784313725490196, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["targetwidth"] = 167,
					["targetposition"] = "rightup",
					["Disease"] = {
						0.329411764705882, -- [1]
						0, -- [2]
						0.243137254901961, -- [3]
						1, -- [4]
					},
					["bufffont"] = "stentiga",
					["buffcolor"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["Curse"] = {
						0.325490196078431, -- [1]
						0.415686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["targeticons"] = false,
					["focus"] = false,
				},
			},
		},
		["Interrupt"] = {
			["profiles"] = {
				["Default"] = {
					["interruptcolor"] = {
						nil, -- [1]
						0.956862745098039, -- [2]
						1, -- [3]
						1, -- [4]
					},
				},
			},
		},
		["Flight"] = {
		},
		["Pet"] = {
			["profiles"] = {
				["test"] = {
					["x"] = 860,
				},
				["Default"] = {
					["x"] = 652.999816894531,
					["y"] = 532,
				},
			},
		},
		["Player"] = {
			["profiles"] = {
				["test"] = {
					["y"] = 463.000061035156,
					["x"] = 1088,
				},
				["Default"] = {
					["h"] = 24,
					["nametextx"] = 0,
					["w"] = 335,
					["hideicon"] = true,
					["font"] = "stentiga",
					["iconalpha"] = 1,
					["icongap"] = 0,
					["iconposition"] = "right",
					["border"] = "Raven SingleWhite",
					["fontsize"] = 16,
					["hidetimetext"] = true,
					["nametextposition"] = "center",
					["x"] = 537,
					["timetextposition"] = "caststart",
					["texture"] = "Grid2 Flat",
					["hidecasttime"] = true,
					["y"] = 270,
					["timetexty"] = 1,
				},
			},
		},
		["EnemyCasts"] = {
		},
		["GCD"] = {
			["profiles"] = {
				["Default"] = {
					["y"] = 203.99965333645,
					["gcdposition"] = "top",
					["gcdalpha"] = 1,
					["sparkcolor"] = {
						0.803921568627451, -- [1]
						0, -- [2]
						0.0235294117647059, -- [3]
						1, -- [4]
					},
					["gcdheight"] = 6,
					["x"] = 642.629060372385,
					["gcdgap"] = -1,
				},
			},
		},
		["Focus"] = {
			["profiles"] = {
				["test"] = {
					["x"] = 860,
				},
				["Default"] = {
					["h"] = 15,
					["timefontsize"] = 10,
					["w"] = 175,
					["y"] = 500.000030517578,
					["x"] = 654.000061035156,
					["border"] = "Square Outline",
					["fontsize"] = 13,
					["noInterruptBorder"] = "Square Outline",
					["hidetimetext"] = true,
					["timetexty"] = 1,
					["noInterruptChangeBorder"] = true,
					["timetextposition"] = "caststart",
					["font"] = "Sony_Sketch_EF",
					["nametextx"] = 0,
					["nametextposition"] = "center",
					["nametexty"] = 2,
					["texture"] = "Flat Smooth",
					["hideicon"] = true,
					["hidecasttime"] = true,
				},
			},
		},
		["Target"] = {
			["profiles"] = {
				["test"] = {
					["x"] = 860,
				},
				["Default"] = {
					["h"] = 24,
					["timefontsize"] = 10,
					["noInterruptBorderColor"] = {
						0.843137254901961, -- [1]
						0.843137254901961, -- [2]
						0.843137254901961, -- [3]
						1, -- [4]
					},
					["w"] = 335,
					["y"] = 270,
					["font"] = "stentiga",
					["iconposition"] = "left",
					["timetextposition"] = "caststart",
					["border"] = "Raven SingleWhite",
					["noInterruptColor"] = {
						0.12156862745098, -- [1]
						0.227450980392157, -- [2]
						0.392156862745098, -- [3]
						1, -- [4]
					},
					["fontsize"] = 16,
					["noInterruptBorder"] = "Blizzard Dialog",
					["texture"] = "Grid2 Flat",
					["x"] = 1249,
					["hidetimetext"] = true,
					["noInterruptChangeBorder"] = false,
					["noInterruptChangeColor"] = true,
					["nametextx"] = 0,
					["nametextposition"] = "center",
					["timetexty"] = 1,
					["hideicon"] = true,
					["hidecasttime"] = true,
				},
			},
		},
		["Mirror"] = {
			["profiles"] = {
				["Default"] = {
					["mirroricons"] = false,
					["READYCHECK"] = {
						1, -- [1]
						0.00392156862745098, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["DUEL_REQUESTED"] = {
						0.576470588235294, -- [1]
						0.0745098039215686, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["mirroroffset"] = 5,
					["mirrortimetext"] = false,
					["mirrory"] = 185.256730997872,
					["mirrorgap"] = -3,
					["mirrortexture"] = "Grid2 Flat",
					["mirrorfont"] = "stentiga",
					["FEIGNDEATH"] = {
						0, -- [1]
						1, -- [2]
						0.96078431372549, -- [3]
						1, -- [4]
					},
					["mirrorx"] = 511.885774782139,
					["mirrorposition"] = "bottomleft",
					["BREATH"] = {
						nil, -- [1]
						0.501960784313726, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["mirrorwidth"] = 114,
					["EXHAUSTION"] = {
						0.941176470588235, -- [1]
						1, -- [2]
						nil, -- [3]
						1, -- [4]
					},
					["mirrorheight"] = 10,
					["QUIT"] = {
						0.768627450980392, -- [1]
						0.113725490196078, -- [2]
						0.227450980392157, -- [3]
						1, -- [4]
					},
				},
			},
		},
		["Range"] = {
		},
		["Latency"] = {
			["profiles"] = {
				["Default"] = {
					["lagpadding"] = 0.1,
					["lagtext"] = false,
				},
			},
		},
	},
	["profileKeys"] = {
		
	},
	["profiles"] = {
		["test"] = {
		},
		["Default"] = {
			["channelingcolor"] = {
				0.572549019607843, -- [1]
				0.32156862745098, -- [2]
				0.674509803921569, -- [3]
				1, -- [4]
			},
			["completecolor"] = {
				0.215686274509804, -- [1]
				0.0705882352941177, -- [2]
				0.27843137254902, -- [3]
				1, -- [4]
			},
			["modules"] = {
				["GCD"] = false,
				["Focus"] = false,
				["Timer"] = false,
				["Flight"] = false,
				["Pet"] = false,
			},
			["bordercolor"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["backgroundcolor"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["failcolor"] = {
				0.615686274509804, -- [1]
				0.0901960784313726, -- [2]
				0.254901960784314, -- [3]
				1, -- [4]
			},
			["spelltextcolor"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["backgroundalpha"] = 0.85,
			["castingcolor"] = {
				0.349019607843137, -- [1]
				0.188235294117647, -- [2]
				0.415686274509804, -- [3]
				1, -- [4]
			},
			["sparkcolor"] = {
				nil, -- [1]
				0.984313725490196, -- [2]
				nil, -- [3]
				0.370000004768372, -- [4]
			},
			["borderalpha"] = 0,
		},
	},
}
