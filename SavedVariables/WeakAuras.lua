
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["login_squelch_time"] = 10,
	["lastArchiveClear"] = 1602644502,
	["minimap"] = {
		["minimapPos"] = 16.62521152360473,
		["hide"] = true,
	},
	["lastUpgrade"] = 1605929414,
	["dbVersion"] = 40,
	["displays"] = {
		["Combo 2"] = {
			["parent"] = "Combo Points",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["powertype"] = 4,
						["use_power"] = true,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["names"] = {
						},
						["type"] = "status",
						["duration"] = "1",
						["unevent"] = "auto",
						["power_operator"] = ">",
						["power"] = "1",
						["event"] = "Power",
						["use_absorbMode"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 0,
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["rotation"] = 0,
			["selfPoint"] = "CENTER",
			["width"] = 79,
			["id"] = "Combo 2",
			["xOffset"] = 15,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				0.7607843137254902, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["uid"] = "Gi3P5pHC2dn",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["frameStrata"] = 1,
		},
		["Frenzy/Rupture"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["authorOptions"] = {
			},
			["yOffset"] = -180,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["auranames"] = {
							"Frenzy", -- [1]
						},
						["unit"] = "pet",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Rupture", -- [1]
						},
						["unit"] = "target",
						["ownOnly"] = true,
						["useName"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 40,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["barColor"] = {
				0.792156862745098, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Frenzy",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 20,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "stentiga",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_n_format"] = "none",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "Rupture",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 20,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "stentiga",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = true,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
				}, -- [3]
				{
					["border_offset"] = 0,
					["border_anchor"] = "bar",
					["border_size"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "1 Pixel",
					["type"] = "subborder",
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "[%s]",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 80,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "stentiga",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = true,
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_n_format"] = "none",
				}, -- [5]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = -10,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "stentiga",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = -1,
					["text_fontType"] = "None",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_format"] = "timed",
					["text_text_format_n_format"] = "none",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_dynamic"] = false,
				}, -- [6]
			},
			["height"] = 20,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["spark"] = false,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["selfPoint"] = "CENTER",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["icon_side"] = "RIGHT",
			["uid"] = "PW2t0JcZi3I",
			["anchorFrameParent"] = true,
			["texture"] = "Raven Reverso",
			["width"] = 400,
			["zoom"] = 0,
			["auto"] = true,
			["alpha"] = 1,
			["sparkHidden"] = "NEVER",
			["id"] = "Frenzy/Rupture",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["config"] = {
			},
			["inverse"] = false,
			["anchorFrameFrame"] = "Quartz3CastBarTarget",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "expirationTime",
						["value"] = "2",
						["op"] = "<",
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.7098039215686275, -- [2]
								0.6313725490196078, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["property"] = "sub.3.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "show",
						["value"] = 1,
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.3.text_visible",
						}, -- [2]
						{
							["property"] = "sub.5.text_visible",
						}, -- [3]
					},
				}, -- [3]
			},
			["information"] = {
			},
			["icon"] = false,
		},
		["Combo 4"] = {
			["xOffset"] = -5,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_power"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["powertype"] = 4,
						["duration"] = "1",
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["use_unit"] = true,
						["type"] = "status",
						["use_genericShowOn"] = true,
						["power"] = "3",
						["power_operator"] = ">",
						["unevent"] = "auto",
						["event"] = "Power",
						["use_absorbMode"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["spellName"] = 0,
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["discrete_rotation"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["width"] = 79,
			["id"] = "Combo 4",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				0.4784313725490196, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["uid"] = "Pqaiz)Slvqg",
			["parent"] = "Combo Points",
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["frameStrata"] = 1,
		},
		["Combo 6"] = {
			["color"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["powertype"] = 4,
						["spellName"] = 0,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["type"] = "status",
						["use_power"] = true,
						["unevent"] = "auto",
						["power_operator"] = ">",
						["power"] = "5",
						["event"] = "Power",
						["use_absorbMode"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["use_track"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["rotation"] = 0,
			["selfPoint"] = "CENTER",
			["width"] = 79,
			["id"] = "Combo 6",
			["xOffset"] = -25,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["uid"] = "OePiNlA29p4",
			["parent"] = "Combo Points",
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["frameStrata"] = 1,
		},
		["Details! Aura Group"] = {
			["grow"] = "DOWN",
			["controlledChildren"] = {
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 40,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = false,
			["radius"] = 200,
			["scale"] = 1,
			["fullCircle"] = true,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["rotation"] = 0,
			["xOffset"] = 0,
			["constantFactor"] = "RADIUS",
			["limit"] = 5,
			["borderOffset"] = 4,
			["borderInset"] = 1,
			["useLimit"] = false,
			["id"] = "Details! Aura Group",
			["gridWidth"] = 5,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "I7Y0mTf5KSP",
			["selfPoint"] = "TOP",
			["arcLength"] = 360,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["gridType"] = "RD",
		},
		["Combo 1"] = {
			["parent"] = "Combo Points",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["powertype"] = 4,
						["use_unit"] = true,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["use_power"] = true,
						["type"] = "status",
						["subeventPrefix"] = "SPELL",
						["power"] = "0",
						["power_operator"] = ">",
						["spellName"] = 0,
						["event"] = "Power",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_absorbMode"] = true,
						["unit"] = "player",
						["unevent"] = "auto",
						["use_track"] = true,
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["config"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "Combo 1",
			["xOffset"] = 25,
			["alpha"] = 1,
			["width"] = 80,
			["authorOptions"] = {
			},
			["uid"] = "OW(TcBRdQ1N",
			["rotation"] = 0,
			["color"] = {
				1, -- [1]
				0.8588235294117647, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Combo Points"] = {
			["grow"] = "RIGHT",
			["controlledChildren"] = {
				"Combo 1", -- [1]
				"Combo 2", -- [2]
				"Combo 3", -- [3]
				"Combo 4", -- [4]
				"Combo 5", -- [5]
				"Combo 6", -- [6]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -237,
			["yOffset"] = -158,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 0,
			["radius"] = 84,
			["selfPoint"] = "LEFT",
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["fullCircle"] = true,
			["animate"] = false,
			["internalVersion"] = 40,
			["scale"] = 1,
			["rotation"] = 0,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["rowSpace"] = 0,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["constantFactor"] = "SPACING",
			["config"] = {
			},
			["borderOffset"] = 4,
			["uid"] = "ymx8VFnB1Ev",
			["gridType"] = "RD",
			["id"] = "Combo Points",
			["frameStrata"] = 1,
			["gridWidth"] = 1,
			["anchorFrameType"] = "SCREEN",
			["limit"] = 5,
			["borderInset"] = 1,
			["useLimit"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["arcLength"] = 360,
		},
		["Details! Boss Mods Group"] = {
			["grow"] = "DOWN",
			["controlledChildren"] = {
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 40,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = false,
			["radius"] = 200,
			["scale"] = 1,
			["fullCircle"] = true,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["rotation"] = 0,
			["xOffset"] = 0,
			["constantFactor"] = "RADIUS",
			["limit"] = 5,
			["borderOffset"] = 4,
			["borderInset"] = 1,
			["useLimit"] = false,
			["id"] = "Details! Boss Mods Group",
			["gridWidth"] = 5,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = ")G85o2sY463",
			["selfPoint"] = "TOP",
			["arcLength"] = 360,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["gridType"] = "RD",
		},
		["Combo 3"] = {
			["xOffset"] = 5,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["powertype"] = 4,
						["names"] = {
						},
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["type"] = "status",
						["spellName"] = 0,
						["unevent"] = "auto",
						["power_operator"] = ">",
						["unit"] = "player",
						["event"] = "Power",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_absorbMode"] = true,
						["power"] = "2",
						["duration"] = "1",
						["use_track"] = true,
						["use_power"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "Combo 3",
			["parent"] = "Combo Points",
			["alpha"] = 1,
			["width"] = 79,
			["color"] = {
				1, -- [1]
				0.6274509803921569, -- [2]
				0.08627450980392157, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["uid"] = "0m(R6g)Cefz",
			["rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Combo 5"] = {
			["parent"] = "Combo Points",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_power"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["powertype"] = 4,
						["use_unit"] = true,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["spellName"] = 0,
						["type"] = "status",
						["unit"] = "player",
						["power"] = "4",
						["power_operator"] = ">",
						["subeventPrefix"] = "SPELL",
						["event"] = "Power",
						["subeventSuffix"] = "_CAST_START",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_absorbMode"] = true,
						["unevent"] = "auto",
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["duration"] = "1",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 40,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_White",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["alpha"] = 1,
			["width"] = 79,
			["id"] = "Combo 5",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				0.2588235294117647, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["uid"] = "pYsisqIVEXX",
			["discrete_rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = -15,
		},
	},
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -680.0008544921875,
		["yOffset"] = -451.666748046875,
		["height"] = 665.0001220703125,
		["width"] = 829.9999389648438,
	},
	["editor_theme"] = "Monokai",
}
