local AddonName, Private = ...
WeakAuras = {}
WeakAuras.L = {}
WeakAuras.frames = {}

WeakAuras.normalWidth = 1.3
WeakAuras.halfWidth = WeakAuras.normalWidth / 2
WeakAuras.doubleWidth = WeakAuras.normalWidth * 2

local versionStringFromToc = GetAddOnMetadata("WeakAuras", "Version")
local versionString = "3.1.2"
local buildTime = "20201122204637"
local isDevVersion = false

--[==[@debug@
if versionStringFromToc == "3.1.2" then
  versionStringFromToc = "Dev"
  buildTime = "Dev"
  isDevVersion = true
end
--@end-debug@]==]

local intendedWoWProject = WOW_PROJECT_MAINLINE
--[===[@non-retail@
intendedWoWProject = WOW_PROJECT_CLASSIC
--@end-non-retail@]===]

WeakAuras.versionString = versionStringFromToc
WeakAuras.buildTime = buildTime
WeakAuras.newFeatureString = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0|t"
WeakAuras.BuildInfo = select(4, GetBuildInfo())

function WeakAuras.IsClassic()
  return WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
end

function WeakAuras.IsCorrectVersion()
  return isDevVersion or intendedWoWProject == WOW_PROJECT_ID
end

WeakAuras.prettyPrint = function(msg)
  print("|cff9900ffWeakAuras:|r " .. msg)
end

Private.wrongTargetMessage = "This version of WeakAuras was packaged for World of Warcraft " ..
                              (intendedWoWProject == WOW_PROJECT_MAINLINE and "Retail" or "Classic") ..
                              ". Please install the " .. (WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and "Retail" or "Classic") ..
                              " version instead.\nIf you are using the CurseForge Client, then " ..
                              " contact CurseForge support for further assistance and reinstall WeakAuras manually."

if not WeakAuras.IsCorrectVersion() then
  C_Timer.After(1, function() WeakAuras.prettyPrint(Private.wrongTargetMessage) end)
end

-- Force enable WeakAurasCompanion and Archive because some addon managers interfere with it
EnableAddOn("WeakAurasCompanion")
EnableAddOn("WeakAurasArchive")

-- These function stubs are defined here to reduce the number of errors that occur if WeakAuras.lua fails to compile
function WeakAuras.RegisterRegionType()
end

function WeakAuras.RegisterRegionOptions()
end

function Private.StartProfileSystem()
end

function Private.StartProfileAura()
end

function Private.StopProfileSystem()
end

function Private.StopProfileAura()
end

function Private.StartProfileUID()
end

function Private.StopProfileUID()
end

-- If WeakAuras shuts down due to being installed on the wrong target, keep the bindings from erroring
function WeakAuras.StartProfile()
end

function WeakAuras.StopProfile()
end

function WeakAuras.PrintProfile()
end

function WeakAuras.CountWagoUpdates()
  -- XXX this is to work around the Companion app trying to use our stuff!
  return 0
end
