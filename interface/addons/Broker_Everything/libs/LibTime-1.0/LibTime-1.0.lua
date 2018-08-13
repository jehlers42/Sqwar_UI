
--[[
Name: LibTime-1.0
Revision: $Revision: 4 $
Author: Hizuro (hizuro@gmx.net)
Description: A little library around date, time and GetGameTime and more...
Dependencies: LibStub
License: GPL v3
]]

local MAJOR, MINOR = "LibTime-1.0", 4;
local lib = LibStub:NewLibrary(MAJOR, MINOR);

if not lib then return; end

local GetGameTime, date, time = GetGameTime, date, time;
local hms,hm = "%02d:%02d:%02d","%02d:%02d";
local realmTime,minute = false,nil;
local playedTimeout, playedHide = 12, false;
local playedTotal, playedLevel, playedSession = 0, 0, false;
local suppressAllPlayedMsgs = false;
local orig_ChatFrame_DisplayTimePlayed = ChatFrame_DisplayTimePlayed;
local events = {};

lib.countryLocalizedNames = {}; -- filled by localizations_(.*).lua *** this table is temporary and will be nil after VARIABLES_LOADED ***

local countryNames = {
	"Afghanistan","Alaska","Arabian","Argentina","Armenia","Australian Central","Australian Eastern","Australian Western","Azerbaijan","Azores","Bangladesh",
	"Bhutan","Bolivia","Brazil","Brunei","Cape Verde","Central Africa","Central Brazilian","Central European","Central Greenland","Central Indonesian",
	"US Central Standart Time (CST)","Chamorro","Chile","China","Christmas Island","Chuuk","Cocos Islands","Colombia","Cook Islands","East Africa",
	"East Greenland","East Timor","Eastern European","Eastern Indonesian","Eastern Kazakhstan","Eastern","Ecuador","Falkland Island","Fernando de Noronha",
	"Fiji","French Guiana","Galapagos","Georgia","Gilbert Island","Greenwich Mean","Gulf","Guyana","Hawaii","Hovd","Indian","Indochina","Iran","Irkutsk",
	"Israel","Japan","Kaliningrad","Korea","Krasnoyarsk","Kyrgyzstan","Magadan","Malaysia","Maldives","Marshall Islands","Mauritius","Moscow","Mountain",
	"Myanmar","Nauru","Nepal","New Caledonia","New Zealand","Newfoundland","Niue","Norfolk","Omsk","Pacific","Pakistan","Palau","Papua New Guinea","Paraguay",
	"Peru","Philippine","Pierre & Miquelon","Ponape","Reunion","Seychelles","Singapore","Solomon Islands","South Africa","Sri Lanka","Suriname","Tahiti",
	"Tajikistan","Tokelau","Tonga","Turkmenistan","Tuvalu","Ulaanbaatar","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vladivostok","Wallis & Futuna",
	"West Africa","West Samoa","Western European","Western Indonesian","Western Kazakhstan","Yakutsk","Yap","Yekaterinburg","Germany"
};

local countryTimeShift = { -- index matching with countryNames
	4.5,-9,3,-3,4,9.5,10,8,4,-1,6,6,-4,-3,8,-1,2,-4,1,-3,8,-6,10,-4,8,7,10,6.5,-5,-10,3,-1,9,2,9,6,-5,-5,-4,-2,12,-3,-6,4,12,0,4,-4,-10,7,5.5,7,3.5,9,2,9,3,9,8,
	5,12,8,5,12,4,4,-7,6.5,12,5.75,11,12,-3.5,-11,11.5,7,-8,5,9,10,-4,-5,8,-3,11,4,4,8,11,2,5.5,-3,-10,5,13,13,5,12,8,-3,5,11,-4.5,11,12,1,13,0,7,5,10,10,6,1
};

local countryDST = { -- index matching with countryNames
	false,true, false,false,true, true, true, false,true, true, false,false,false,false,false,false,false,true, true, true, false,true, false,true, false,false,
	false,false,false,false,false,true, false,true, false,false,true, false,false,false,true, false,false,false,false,true, false,false,true, false,false,false,
	true, false,true, false,false,false,false,false,false,false,false,false,false,false,true, false,false,false,false,true, true, false,false,false,true, false,
	false,false,true, false,false,true, false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true, false,false,false,false,
	false,true, true, true, false,false,false,false,false,true
}


--[[ internal event and update functions ]]--

local function filterTimePlayed(self,...)
	if suppressAllPlayedMsgs and playedSession and time()-playedSession<=suppressAllPlayedMsgs then
		return;
	end
	if playedHide then -- only filter own message
		playedHide=false;
		if not suppressAllPlayedMsgs then
			ChatFrame_DisplayTimePlayed = orig_ChatFrame_DisplayTimePlayed;
		end
		return;
	end
	return orig_ChatFrame_DisplayTimePlayed(self,...);
end

local function playedTimeoutFunc()
	if not playedTimeout then
		return;
	end
	playedHide = true;
	RequestTimePlayed();
end

local function realmTimeSyncTickerFunc()
	local hours, minutes, seconds = GetGameTime();
	if minute~=minutes then
		minute = nil;
		local t = date("*t");
		t.hour,t.min,t.sec = hours,minutes,0;
		realmTime = time() - time(t);
		realmTimeSyncTicker:Cancel();
	end
end

function events.VARIABLES_LOADED()
	for index,name in ipairs(countryNames) do
		if lib.countryLocalizedNames[name] then
			countryNames[index] = lib.countryLocalizedNames[name];
		end
	end
	lib.countryLocalizedNames = nil; -- one table with names is enough ;)
	UIParent:RegisterEvent("TIME_PLAYED_MSG");
end

function events.PLAYER_LOGIN()
	local hours, minutes, seconds = GetGameTime();
	playedSession = time();
	if tonumber(seconds) then
		-- YEAH! Surprise! GetGameTime returns time "with seconds"... [maybe in future? ^_^]
		realmTimeSyncTickerFunc = nil;
		lib.GetGameTime = GetGameTime;
	else
		minute = minutes;
		realmTimeSyncTicker = C_Timer.NewTicker(0.5,realmTimeSyncTickerFunc);
	end
	if (issecurevariable("ChatFrame_DisplayTimePlayed")) then
		-- only replace if original from blizzard
		ChatFrame_DisplayTimePlayed = filterTimePlayed;
	end
	C_Timer.After(playedTimeout,playedTimeoutFunc);
end

function events.TIME_PLAYED_MSG(...)
	playedTimeout, playedTotal, playedLevel = false, ...;
end

UIParent:HookScript("OnEvent",function(self,event,...)
	if events[event] then
		events[event](...);
		events[event]=nil;
	end
end);


--[[ library functions ]]--

--- GetGameTime
-- @return hours, minutes, seconds, boolSecondsSynced
function lib.GetGameTime(inSeconds)
	if realmTime then
		local t = time()-realmTime;
		if inSeconds==true then
			return t,(minute==nil);
		end
		local t = {strsplit(":",date("%H:%M:%S",t))};
		return tonumber(t[1]),tonumber(t[2]),tonumber(t[3]),(minute==nil);
	end
	if inSeconds==true then
		return time();
	end
	return lib.GetLocalTime();
end


--- GetLocalTime
-- @return hours, minutes, seconds
function lib.GetLocalTime()
	local t = {strsplit(":",date("%H:%M:%S"))};
	return tonumber(t[1]),tonumber(t[2]),tonumber(t[3]);
end


--- GetUTCTime
-- @param inSeconds [bool]
-- @return hours, minutes, seconds
function lib.GetUTCTime(inSeconds)
	if inSeconds==true then
		return time(date("!*t"));
	end
	local t = {strsplit(":",date("!%H:%M:%S"))};
	return tonumber(t[1]),tonumber(t[2]),tonumber(t[3]);
end


--- GetCountryTime
-- @param country [string|number]
-- @param inSeconds [bool]
-- @return hour, minute, second, country name
function lib.GetCountryTime(countryId,inSeconds)
	assert(countryId and countryDST[countryId] and countryTimeShift[countryId], "usage: <LibTime-1.0>.GetCountryTime(<iCountryId>[,<bInSeconds>])");
	local dst,timeshift = countryDST[countryId],countryTimeShift[countryId];
	local t = lib.GetUTCTime(true);
	local l = date("*t");
	if (l.isdst==true and dst==0) then
		t = t - 3600;
	elseif (l.isdst==false and dst==1) then
		t = t + 3600;
	end
	t = t+(3600*timeshift);
	if inSeconds==true then
		return t, countryNames[countryId];
	end
	local H,M,S = date("%H:%M:%S",t);
	return tonumber(H), tonumber(M), tonumber(S), countryNames[countryId];
end


--- ListCountries - plain list of countries. table index corresponding with neccessary countryId in other functions of this library
-- @return [table]
function lib.iterateCountryList()
	return ipairs(countryNames);
end


--- GetPlayedTime
-- @return playedTotal, playedLevel, playedSession
function lib.GetPlayedTime()
	local session = time()-playedSession;
	if (playedTotal) then
		return playedTotal+session, playedLevel+session, session;
	end
	return 0, 0, session;
end


--- GetTimeString
-- @param name of time   <GameTime|LocalTime|UTCTime|CountryTime>
-- @param 24hours        [boolean] - optional, default = true
-- @param displaySeconds [boolean] - optional, default = false
-- @param countryId      [number]  - only for use with GetCountryTime
function lib.GetTimeString(name,b24hours,displaySeconds,countryId)
	assert(lib["Get"..name],"Usage: <LibTime-1.0>.GetTimeString(<GameTime|LocalTime|UTCTime|CountryTime>[,<b24hours>[,<bDisplaySeconds>[,<iCountryId>]]])");
	local h,m,s,synced = lib["Get"..name](countryId);
	local suffix = "";
	if (b24hours~=true) then
		h,suffix = tonumber(h), " AM";
		if h >= 12 then
			h,suffix = h-12," PM";
		end
	end
	if (displaySeconds==true) then
		if name=="GameTime" and not synced then
			suffix = ":−−"..suffix;
		else
			return hms:format(h,m,s)..suffix;
		end
	end
	return hm:format(h,m)..suffix;
end


--- SuppressAllPlayedForSeconds
-- @param seconds [number] - time in seconds from login to suppress all played time messages
function lib.SuppressAllPlayedForSeconds(seconds)
	if (type(seconds)=="number") then
		suppressAllPlayedMsgs = seconds;
		local since = time()-(playedSession or 0);
		if since<seconds then
			C_Timer.After(seconds-since+15,function()
				ChatFrame_DisplayTimePlayed = orig_ChatFrame_DisplayTimePlayed;
			end);
		end
	end
end
