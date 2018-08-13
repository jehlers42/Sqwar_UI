
local addon, ns = ...
local addonLabel = addon;
local C, L, I = ns.LC.color, ns.L, ns.I;
local migrateAll = true;

local dbDefaults,db = {
	profile = {
		GeneralOptions = {
			suffixColour = true,
			tooltipScale = false,
			showHints = true,
			iconset = "NONE",
			iconcolor = {1,1,1,1},
			goldColor = false,
			usePrefix = false,
			maxTooltipHeight = 60,
			scm = false,
			ttModifierKey1 = "NONE",
			ttModifierKey2 = "NONE",
			goldHide = "0",
			goldHideLowerZeros = false,
			separateThousands = true,
			showAddOnLoaded = true
		}
	}
};

ns.showCharsFrom_Values = {
	["1"] = ns.realm,
	["2"] = L["Connected realms"],
	["3"] = L["Same battlegroup"],
	["4"] = L["All realms"]
}

local nsProfileMT = {
	__newindex = function(t,k,v)
		local s = rawget(t,"section");
		if s and db and db.profile[s] then
			db.profile[s][k] = v;
		end
	end,
	__index = function(t,k)
		local s = rawget(t,"section");
		if s and db and db.profile[s] then
			local v = db.profile[s][k];
			if v~=nil then
				return v;
			end
		end
	end
};

ns.profile = {GeneralOptions=setmetatable({section="GeneralOptions"},nsProfileMT)};

-- some values tables and functions
local ttModifierValues = {NONE = L["ModKeyDefault"]};
for i,v in pairs(ns.tooltipModifiers) do ttModifierValues[i] = L["ModKey"..v.l]; end

local function calcDataSize(info,obj)
	if info then
		local key = info[#info];
		return "~"..ns.FormatLargeNumber(true,calcDataSize(nil,Broker_Everything_CharacterDB[key])).."B";
	end
	local obj_t = type(obj);
	if obj_t=="table" then
		local sum = 0;
		for k,v in pairs(obj) do
			if type(k)=="string" then
				sum = sum + 40 + strlen(k);
			else
				sum = sum + 16;
			end
			sum = sum + calcDataSize(nil,v);
		end
		return sum + 40;
	elseif obj_t=="boolean" then
		return 2;
	elseif obj_t=="number" then
		return (floor(obj/2147483647)+1)*8;
	end
	return strlen(tostring(objStr));
end

local function getIconSets()
	local t = {NONE=NONE}
	local l = ns.LSM:List((addon.."_Iconsets"):lower())
	if type(l)=="table" then
		for i,v in pairs(l) do
			t[v] = v
		end
	end
	return t
end

local function noReload()
	return false;
end

-- option set/get function
local function opt(info,value,...)
	if not db then return end
	-- section = GeneralOptions or module names
	local key,section,isModEnable=info[#info],info[#info-2],(info[#info-1]=="modEnable");
	if value~=nil then
		if isModEnable then
			db.profile[key].enabled = value;
			if value then
				-- init module
				ns.moduleInit(key);
			end
		elseif key=="minimap" then
			db.profile[section][key].hide = not value;
			ns.toggleMinimapButton(section);
		else
			if ... then value={value,...}; end
			db.profile[section][key]=value;
			if section=="GeneralOptions" then
				for modName,mod in pairs(ns.modules)do
					if mod.OnEvent then
						mod:OnEvent("BE_UPDATE_CFG",key);
					end
				end
			else
				if ns.modules[section].OnEvent then
					ns.modules[section]:OnEvent("BE_UPDATE_CFG",key);
				end
			end
		end
	end
	if isModEnable then
		return (db and key and db.profile and db.profile[key] and db.profile[key].enabled);
	elseif key=="minimap" then
		return not db.profile[section][key].hide;
	else
		if type(db.profile[section][key])=="table" then
			return unpack(db.profile[section][key]);
		end
		return db.profile[section][key];
	end
end

ns.option=opt; -- used in shared.lua (EasyMenu wrapper)

local options = {
	type = "group",
	name = addon,
	get=opt, set=opt,
	childGroups = "tab",
	args = {
		reloadinfo = {
			type = "group", order=1, inline = true,
			name = "",
			args = {
				spacer = { type="description", order=1, name=" ", width="half"},
				reload = { type="execute", order=2, name=L["ReloadUI"], func=ReloadUI },
				info = { type="description", order=3, name=C("orange",L["ReloadUIRequired"]), fontSize="medium", width="double", hidden=noReload},
			},
			hidden = true
		},
		GeneralOptions = {
			type = "group", order = 1,
			name = L["General"],
			args = {
				misc = {
					type = "group", order = 1, inline = true,
					name = C("ff00aaff",L["Misc"]),
					args = {
						showAddOnLoaded = { type="toggle",order=1,name=L["AddOnLoaded"],desc=L["AddOnLoadedDesc"] },
						suffixColour    = { type="toggle",order=2,name=L["SuffixColor"],desc=L["SuffixColorDesc"] },
						usePrefix       = { type="toggle",order=3,name=L["Prefix"],desc=L["PrefixDesc"] }
					}
				},
				gold = {
					type = "group", order = 2, inline = true,
					name = C("ff00aaff",MONEY),
					args = {
						goldColor          = {type="toggle",order=1,name=L["GoldColor"],desc=L["GoldColorDesc"]},
						separateThousands  = {type="toggle",order=2,name=L["DigitGroup"],desc=L["DigitGroupDesc"]},
						goldHideLowerZeros = {type="toggle",order=3,name=L["HideZeros"],desc=L["HideZerosDesc"]},
						goldHide           = {type="select",order=4,name=L["HideMoney"],desc=L["HideMoneyDesc"],
							values={
								["0"]=NONE,
								["1"]=L["Copper"],
								["2"]=L["Copper & silver"]
							}
						}
					}
				},
				tooltip = {
					type = "group", order = 3, inline = true,
					name = C("ff00aaff",L["Tooltip"]),
					args = {
						scm              = {type="toggle",order=1,name=L["SCM"],desc=L["SCMDesc"]},
						showHints        = {type="toggle",order=2,name=L["TTHints"],desc=L["TTHintsDesc"]},
						maxTooltipHeight = {type="range", order=3,name=L["TTMaxHeight"],desc=L["TTMaxHeightDesc"],min=10, max=90},
						ttModifierKey1   = {type="select",order=4,name=L["TTShowMod"],desc=L["TTShowModDesc"],values=ttModifierValues,width="double"},
						ttModifierKey2   = {type="select",order=5,name=L["TTMouse"],desc=L["TTMouseDesc"],values=ttModifierValues,width="double"},
					}
				},
				icons = {
					type = "group", order = 4, inline = true,
					name = C("ff00aaff",L["Icons"]),
					args = {
						iconcolor = {type="color", order=1,name=L["IconColor"],desc=L["IconColorDesc"]},
						iconset   = {type="select",order=2,name=L["IconSets"],desc=L["IconSetsDesc"],values=getIconSets(),width="double"},
						iconsetinfo = {
							type = "description", order = 3, fontSize = "medium",
							name = C("dkyellow",L["IconSetsInfo"])
						},
						iconsetlink = {
							type = "input", order = 4, width = "full",
							name = "",
							get = function() return "http://www.wowinterface.com/downloads/info22790.html"; end,
							set = function() end
						}
					}
				},
			}
		},
		modEnable = {
			type = "group", order = 2,
			name = L["ModsToggle"],
			desc = L["ModsToggleDesc"],
			childGroups = "tab",
			args = {
			}
		},
		modOptions = { -- dummy group
			type = "group", order = 3,
			name = L["Modules"],
			desc = L["ModulesDesc"],
			childGroups="tree",
			args = {},
		},
		chars = {
			type = "group", order = 4, --fontSize="normal",
			name = L["CharData"],
			desc = L["CharDataDesc"],
			childGroups="tab",
			args = {
				infoheader = { type = "description",   order=1, name=C("dkyellow",L["CharDataHeader"]), fontSize="medium" },
				info1_2 = {
					type = "description", order= 2,
					name =  C("ltgreen",L["CharData1"]) .. "\n" .. L["CharData1Desc"].. "\n\n" ..
							C("ltgreen",L["CharData2"]) .. "\n" .. L["CharData2Desc"] .."\n "
				},
				info3 = { type="description", order=6, name=C("ltgreen",L["CharData3"]), width="normal"},
				delete = {
					type = "execute", order=7, width="double",
					name = L["CharDataDelAll"], desc = L["CharDataDelAllDesc"]
				},
				list = {
					type = "group", order=8,
					name = L["CharDataList"],
					childGroups="tab",
					args = {
					}
				}
			}
		}
		-- profiles = {}, -- created by AceDBOptions
	}
}

ns.sharedOptions = {
	shortNumbers    = { type="toggle", name=L["ShortNum"], desc=L["ShortNumDesc"]},
	showAllFactions = { type="toggle", name=L["AllFactions"], desc=L["AllFactionsDesc"]},
	showRealmNames  = { type="toggle", name=L["RealmNames"], desc=L["RealmNamesDesc"]},
	showCharsFrom   = { type="select", name=L["CharsFrom"], desc=L["CharsFromDesc"],
		values=ns.showCharsFrom_Values,
	}
}

local sharedDefaults = {
	shortNumbers = true,
	showAllFactions = true,
	showRealmNames = true,
	showCharsFrom = "2",
	minimap = {hide=false}
}

local coords=nil;
local function Icon(info)
	local key=info[#info];
	if key=="modOptions" then return end
	local icon = I[key..(ns.modules[key].icon_suffix or "")];
	coords = icon.coords or {.1,.9,.1,.9};
	return icon.iconfile;
end

function ns.getModOptionTable(modName)
	if modName and options.args.modOptions.args[modName] then
		return options.args.modOptions.args[modName].args;
	end
	return {};
end

local function IconCoords(info)
	if info[#info]=="modOptions" then return end
	return coords;
end

local function optionWalker(modName,group,lst)
	for k, v in pairs(lst)do
		local tV = type(v);
		if tV=="number" or tV=="boolean" then
			if ns.sharedOptions[k] then
				lst[k] = ns.sharedOptions[k];
				if tV=="number" then
					lst[k].order = v;
				end
				dbDefaults.profile[modName][k] = sharedDefaults[k];
			else
				lst[k]=nil;
			end
		elseif tV=="table" then
			if v.type=="separator" then
				v.type = "description";
				v.name = " ";
			end
			if v.type=="slider" or v.type=="desc" then
				lst[k]=nil;
			end
			if (v.default or v.inMenuInvisible or v.text or v.isSubMenu or v.alpha or v.tooltip or v.label or v.format or v.rep or v.minText or v.maxText)~=nil then
				lst[k]=nil;
			end
		end
	end
	if group=="broker" then
		lst.minimap = {
			type = "toggle", order = 0,
			name = L["Minimap"], desc=L["MinimapDesc"]
		}
	end
end

function ns.Options_AddModuleDefaults(modName)
	local mod = ns.modules[modName];
	if mod then
		ns.profile[modName] = setmetatable({section=modName},nsProfileMT);
		-- normal defaults
		dbDefaults.profile[modName] = mod.config_defaults or {enabled=false};

		-- add shared option defaults
		if mod.options then
			for _,group in pairs(mod.options())do
				for key,value in pairs(group)do
					if sharedDefaults[key]~=nil and dbDefaults.profile[modName][key]==nil then
						dbDefaults.profile[modName][key] = sharedDefaults[key];
					end
				end
			end
		end
	end
end

local function ModName(info)
	local key=info[#info];
	if not ns.profile[key].enabled then
		return C("gray",L[key]);
	end
	return L[key];
end

local function ModDesc(info)
	local key=info[#info];
	if not ns.profile[key].enabled then
		return C("red","("..ADDON_DISABLED..")").."\n"..C("gray",L["ModDesc-"..key]);
	end
	return L["ModDesc-"..key];
end

function ns.Options_AddModuleOptions(modName)
	-- add toggle to ModToggleTab
	options.args.modEnable.args[modName] = {type="toggle",name=L[modName],desc=L["ModDesc-"..modName]};

	-- add own tree entry per module
	if ns.modules[modName].options then
		options.args.modOptions.args[modName] = {
			type = "group",
			name = ModName, desc = ModDesc,
			icon = Icon, iconCoords = IconCoords, -- currently ace ignore IconCoords
			args = {
			}
		}
		local modOptions = ns.modules[modName].options();

		if dbDefaults.profile[modName]==nil then
			dbDefaults.profile[modName]={}; -- should never be nil... :D
		end

		ns.ClickOpts.createOptions(modName,modOptions);

		local hasBrokerOpts = false;
		for k in pairs(modOptions)do
			if k:find("^broker") then
				hasBrokerOpts = true;
				break;
			end
		end
		if not hasBrokerOpts then
			modOptions.broker = {};
		end
		for k, v in pairs(modOptions)do
			local name, order = v.name, v.order;
			v.name,v.order = nil,nil;
			if k:find("^broker") then
				name = name or L["Broker"];
				order = order or 1;
			elseif k:find("^tooltip") then
				name = name or L["Tooltip"];
				order = order or 2;
			elseif k:find("^misc") then
				name = name or L["Misc"];
				order = order or 98;
			elseif k:find("^ClickOpts") then
				name = name or L["ClickOptions"];
				order = 99;
			end
			optionWalker(modName,k,v);
			options.args.modOptions.args[modName].args[k] = {
				type="group", name=C("ff00aaff",name), order=order, inline=true, args=v
			}
		end

	end
end

local function buildCharDataOptions()
	wipe(options.args.chars.args.list.args);
	local lst = options.args.chars.args.list.args;
	-- Broker_Everything_CharacterDB
	-- Broker_Everything_CharacterDB.order
	for order,name_realm in ipairs(Broker_Everything_CharacterDB.order)do
		if Broker_Everything_CharacterDB[name_realm] then
			local charName, realm = strsplit("%-",name_realm,2);
			local label = C(Broker_Everything_CharacterDB[name_realm].class,charName).."\n"..C("gray",realm);
			lst[name_realm] = {
				type = "group", order = order, inline=true,
				name = "",
				args = {
					label = {
						type = "description", order=1, width="normal", fontSize = "medium",
						name = label,
					},
					[name_realm] = {
						type = "description", order = 2, width = "half",
						name = calcDataSize,
					},
					up   = {type="execute", order=3, width="half", name=L["Up"], desc=label, disabled=(order==1) },
					down = {type="execute", order=4, width="half", name=L["Down"], desc=label, disabled=(order==#Broker_Everything_CharacterDB.order) },
					del  = {type="execute", order=5, width="half", name=DELETE, desc=label, disabled=(name_realm==ns.player.name_realm) },
				}
			}
		end
	end
end

function options.args.chars.func(info,button,a,b) -- function for buttons 'Up', 'Down' and 'Delete' for single character and 'Delete all'
	local key,char = info[#info],info[#info-1];
	if key=="up" or key=="down" then
		local cur
		for i,v in ipairs(Broker_Everything_CharacterDB.order)do
			if char==v then
				cur = i;
				break;
			end
		end
		if key=="up" then
			Broker_Everything_CharacterDB.order[cur],Broker_Everything_CharacterDB.order[cur-1] = Broker_Everything_CharacterDB.order[cur-1],Broker_Everything_CharacterDB.order[cur];
		else -- down
			Broker_Everything_CharacterDB.order[cur],Broker_Everything_CharacterDB.order[cur+1] = Broker_Everything_CharacterDB.order[cur+1],Broker_Everything_CharacterDB.order[cur];
		end
		buildCharDataOptions();
	elseif key=="del" then -- delete single character
		Broker_Everything_CharacterDB[char] = nil;
		local place
		for i,v in ipairs(Broker_Everything_CharacterDB.order)do
			if char==v then
				tremove(Broker_Everything_CharacterDB.order,i);
				break;
			end
		end
		buildCharDataOptions();
	elseif key=="delete" then -- delete all
		Broker_Everything_CharacterDB = {};
		ReloadUI();
	end
end

function ns.RegisterOptions()
	if Broker_Everything_AceDB==nil then
		Broker_Everything_AceDB = {};
	end

	-- db migration to ace
	if Broker_Everything_AceDB.profileKeys==nil and Broker_Everything_ProfileDB.use_profile~=nil then
		-- migrate profile keys to ace
		Broker_Everything_AceDB.profileKeys = {};
		for char_realm, profileName in pairs(Broker_Everything_ProfileDB.use_profile)do
			if profileName==DEFAULT then
				profileName="Default";
			end
			local charName,realmName = strsplit("-",char_realm,2); -- aceDB has whitespaces around the dash between char and realm names. split and rejoin
			if realmName then
				Broker_Everything_AceDB.profileKeys[charName.." - "..realmName] = profileName;
			end
		end
	end

	if Broker_Everything_AceDB.profiles==nil then
		-- migrate profiles to ace
		local ClickOptPrefixOld = "clickOptions::";
		Broker_Everything_AceDB.profiles = {};
		if Broker_Everything_ProfileDB.profiles then
			for profileName,profileData in pairs(Broker_Everything_ProfileDB.profiles)do
				if type(profileData)=="table" then -- ignore invalid profiles
					local data = CopyTable(profileData); -- clone data for secure fallback option to old version

					if DEFAULT~="Default" and profileName==DEFAULT and Broker_Everything_ProfileDB.Default==nil then
						profileName="Default";
					end

					for modName,modData in pairs(data) do
						if modName and type(modData)=="table" then
							-- migrate showAllRealms
							if modData.showAllRealms==true then
								modData.showCharsFrom = "4";
								modData.showAllRealms = nil;
							end
							-- migrate clickOptions Prefix
							for k,v in pairs(modData)do
								if k:find(ClickOptPrefixOld) then
									local K = k:gsub(ClickOptPrefixOld,ns.ClickOpts.prefix);
									modData[K] = modData[k];
									modData[k] = nil;
								end
							end
						end
					end

					-- migrate some option entries from shared_module
					local modName="GPS / Location / ZoneText";
					if data[modName] then
						for key,value in pairs(data[modName])do
							if data.GPS==nil then data.GPS={} end
							if data.Location==nil then data.Location={} end
							if data.ZoneText==nil then data.ZoneText={} end
							data.GPS[key]=value;
							data.Location[key]=value;
							data.ZoneText[key]=value;
						end
						data[modName]=nil;
					end
					Broker_Everything_AceDB.profiles[profileName]=data;
				end
			end
		end
	end

	local AceDBfixCurrent = 1;
	if not ns.data.AceDBfix then
		ns.data.AceDBfix = 0;
	end

	if ns.data.AceDBfix<AceDBfixCurrent and type(Broker_Everything_AceDB.profiles)=="table" then
		for pName,pData in pairs(Broker_Everything_AceDB.profiles)do
			if type(pData)=="table" then
				for mName,mData in pairs(pData)do
					if type(mData)=="table" then
						for oKey,oValue in pairs(mData)do
							if ns.data.AceDBfix<1 and oKey=="showCharsFrom" and type(oValue)=="number" then
								mData[oKey] = tostring(oValue);
							end
						end
					end
				end
			end
		end
		ns.data.AceDBfix=AceDBfixCurrent;
	end

	buildCharDataOptions();

	db = LibStub("AceDB-3.0"):New("Broker_Everything_AceDB",dbDefaults,true);

	options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(db);
	options.args.profiles.order=-1;

	LibStub("AceConfig-3.0"):RegisterOptionsTable(addonLabel, options);
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonLabel);
end

function ns.ToggleBlizzOptionPanel()
	InterfaceOptionsFrame_OpenToCategory(addon);
	InterfaceOptionsFrame_OpenToCategory(addon);
end
