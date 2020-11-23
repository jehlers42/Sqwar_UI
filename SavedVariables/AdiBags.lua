
AdiBagsDB = {
	["namespaces"] = {
		["ItemLevel"] = {
		},
		["FilterOverride"] = {
			["profiles"] = {
				["Default"] = {
					["version"] = 3,
					["overrides"] = {
						[20562] = "Miscellaneous#Hallow's End",
						[138111] = "Equipment#Weapon",
						[169332] = "Consumable#Nazjatar",
						[33226] = "Miscellaneous#Hallow's End",
						[169844] = "Consumable#Mechagon",
						[20566] = "Miscellaneous#Hallow's End",
						[169333] = "Consumable#Nazjatar",
						[167562] = "Consumable#Mechagon",
						[37011] = "Miscellaneous#Hallow's End",
						[6948] = "Miscellaneous#Hearthstones",
						[34068] = "Miscellaneous#Hallow's End",
						[37604] = "Miscellaneous#Hallow's End",
						[20399] = "Miscellaneous#Hallow's End",
						[20567] = "Miscellaneous#Hallow's End",
						[166846] = "Consumable#Mechagon",
						[161053] = "Consumable#Food & Drink",
						[168216] = "Consumable#Mechagon",
						[169610] = "Consumable#Mechagon",
						[37583] = "Miscellaneous#Hallow's End",
						[110560] = "Miscellaneous#Hearthstones",
						[141605] = "Miscellaneous#Hearthstones",
						[168217] = "Consumable#Mechagon",
						[166971] = "Consumable#Mechagon",
						[168215] = "Consumable#Mechagon",
						[163073] = "Consumable#Nazjatar",
						[166970] = "Consumable#Mechagon",
						[168832] = "Consumable#Mechagon",
						[173363] = "Key#Key",
						[140192] = "Miscellaneous#Hearthstones",
					},
				},
			},
		},
		["ItemCategory"] = {
			["profiles"] = {
				["Default"] = {
					["splitBySubclass"] = {
						["Recipe"] = false,
						["Consumable"] = true,
						["Gem"] = false,
						["Tradeskill"] = true,
						["Glyph"] = false,
						["Miscellaneous"] = false,
					},
				},
			},
		},
		["NewItem"] = {
			["profiles"] = {
				["Default"] = {
					["highlight"] = "none",
					["glowScale"] = 2.45,
				},
			},
		},
		["AdiBags_TooltipInfo"] = {
		},
		["MoneyFrame"] = {
			["profiles"] = {
				["Default"] = {
					["small"] = true,
				},
			},
		},
		["ItemSets"] = {
		},
		["CurrencyFrame"] = {
			["profiles"] = {
				["Default"] = {
					["shown"] = {
						["Ancient Mana"] = false,
						["Elder Charm of Good Fortune"] = false,
						["Nethershard"] = false,
						["Lesser Charm of Good Fortune"] = false,
						["Curious Coin"] = false,
						["Order Resources"] = false,
						["Veiled Argunite"] = false,
						["Warforged Seal"] = false,
						["7th Legion Service Medal"] = false,
						["Corrupted Mementos"] = false,
						["Artifact Fragment"] = false,
						["Ironpaw Token"] = false,
						["Oil"] = false,
						["Garrison Resources"] = false,
						["Wakening Essence"] = false,
						["Sightless Eye"] = false,
						["Timeless Coin"] = false,
						["Essence of Corrupted Deathwing"] = false,
						["Apexis Crystal"] = false,
						["Prismatic Manapearl"] = false,
						["Mote of Darkness"] = false,
						["Mogu Rune of Fate"] = false,
						["Mark of the World Tree"] = false,
						["Lingering Soul Fragment"] = false,
						["Legionfall War Supplies"] = false,
					},
					["text"] = {
						["name"] = "Roboto-Regular",
						["size"] = 12,
					},
				},
			},
		},
		["DataSource"] = {
		},
		["Junk"] = {
			["profiles"] = {
				["Default"] = {
					["exclude"] = {
						[168215] = true,
						[168216] = true,
						[168217] = true,
					},
				},
			},
		},
		["Equipment"] = {
			["profiles"] = {
				["Default"] = {
					["armorTypes"] = true,
				},
			},
		},
	},
	["profileKeys"] = {
		["Alaeana - Proudmoore"] = "Default",
		["Gwathren - Proudmoore"] = "Default",
		["Jiaxing - Proudmoore"] = "Default",
		["Kathlian - Proudmoore"] = "Default",
		["Sifrun - Proudmoore"] = "Default",
		["Farathiel - Proudmoore"] = "Default",
		["Seimira - Proudmoore"] = "Default",
		["Athaeriel - Proudmoore"] = "Default",
		["Celíara - Proudmoore"] = "Default",
		["Mirethiel - Proudmoore"] = "Default",
		["Celiara - Hyjal"] = "Default",
		["Ravna - Proudmoore"] = "Default",
		["Gwathren - Hyjal"] = "Default",
		["Velithriel - Proudmoore"] = "Default",
		["Lucrais - Proudmoore"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["showBagType"] = false,
			["virtualStacks"] = {
				["notWhenTrading"] = 3,
				["stackable"] = true,
				["incomplete"] = true,
			},
			["columnWidth"] = {
				["Bank"] = 10,
				["Backpack"] = 14,
			},
			["maxHeight"] = 0.8,
			["skin"] = {
				["BackpackColor"] = {
					nil, -- [1]
					0.09803921568627451, -- [2]
					0.1686274509803922, -- [3]
					0.6410250961780548, -- [4]
				},
				["borderWidth"] = 1,
				["background"] = "Solid",
				["border"] = "1 Pixel",
				["insets"] = 0,
			},
			["bagFont"] = {
				["name"] = "stentiga",
			},
			["positions"] = {
				["anchor"] = {
					["xOffset"] = -11.168212890625,
					["yOffset"] = 339.166015625,
				},
				["Backpack"] = {
					["xOffset"] = -24.502197265625,
					["point"] = "TOPRIGHT",
					["yOffset"] = -218.0328979492188,
				},
			},
			["filterPriorities"] = {
				["Equipment"] = 90,
				["Junk"] = 53,
				["FilterOverride"] = 85,
				["ItemCategory"] = 29,
				["ItemSets"] = 100,
				["NewItem"] = 42,
				["Quest"] = 80,
			},
			["sectionFont"] = {
				["name"] = "Roboto-Bold",
				["r"] = 0.9411764705882353,
				["b"] = 0.3411764705882353,
				["g"] = 0.6196078431372549,
			},
			["compactLayout"] = true,
			["scale"] = 1,
			["positionMode"] = "manual",
			["modules"] = {
				["SectionVisibilityDropdown"] = false,
				["ItemLevel"] = false,
				["ChangeHighlight"] = false,
			},
		},
	},
}
