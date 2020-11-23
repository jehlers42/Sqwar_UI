--------------------------------------------------------------------------------
-- Overlay UI Parent - frame that owns the configuration UI
--------------------------------------------------------------------------------

local _, Addon = ...
local ParentAddon = Addon:GetParent()

local function GetMultiple(value, factor)
    return _G.Round(value / factor) * factor
end

local BACKGROUND_COLOR = _G.CreateColor(0, 0, 0, 0.3)
local GRID_COLOR = _G.CreateColor(1, 1, 1, 0.1)
local GRID_HIGHLIGHT_COLOR = _G.CreateColor(0.6, 0.3, 0.68, 0.5)
local GRID_THICKNESS = 1

local OverlayUI = ParentAddon:NewModule('OverlayUI', 'AceEvent-3.0')

--------------------------------------------------------------------------------
-- Events
--------------------------------------------------------------------------------

function OverlayUI:OnInitialize()
    self.frame = _G.CreateFrame('Frame', nil, _G.UIParent)

    self.frame:SetFrameStrata('BACKGROUND')
    self.frame:EnableMouse(false)
    self.frame:SetAllPoints(self.frame:GetParent())
    self.frame:Hide()

    -- the background to use when showing the overlay
    local bg = self.frame:CreateTexture(nil, "BACKGROUND")

    bg:SetColorTexture(BACKGROUND_COLOR:GetRGBA())
    bg:SetAllPoints(self.frame)

    self.bg = bg

    -- a fade in for when showing
    local fadeInSequence = self.frame:CreateAnimationGroup()

    local fadeIn = fadeInSequence:CreateAnimation('Alpha')

    fadeIn:SetFromAlpha(0)
    fadeIn:SetToAlpha(1)
    fadeIn:SetSmoothing('IN')
    fadeIn:SetDuration(0.2)

    self.fadeInSequence = fadeInSequence

    -- add a fade effect when hiding
    local fadeOutSequence = self.frame:CreateAnimationGroup()

    fadeOutSequence:SetScript('OnFinished', function() self:OnFadeOutFinished() end)

    local fadeOut = fadeOutSequence:CreateAnimation('Alpha')

    fadeOut:SetFromAlpha(1)
    fadeOut:SetToAlpha(0)
    fadeOut:SetSmoothing('OUT')
    fadeOut:SetDuration(0.2)

    self.fadeOutSequence = fadeOutSequence

    self.frame:SetScript("OnShow", function() self:OnShow() end)
    self.frame:SetScript("OnHide", function() self:OnHide() end)
    self.frame:SetScript("OnSizeChanged", function() self:OnSizeChanged() end)

    Addon.HelpDialog:OnLoad(self.frame)
end

function OverlayUI:OnEnable()
    self:RegisterEvent('PLAYER_REGEN_ENABLED')
    self:RegisterEvent('PLAYER_REGEN_DISABLED')

    ParentAddon.RegisterCallback(self, 'ALIGNMENT_GRID_ENABLED')
    ParentAddon.RegisterCallback(self, 'ALIGNMENT_GRID_SIZE_CHANGED')
    ParentAddon.RegisterCallback(self, 'CONFIG_MODE_ENABLED')
    ParentAddon.RegisterCallback(self, 'CONFIG_MODE_DISABLED')

    -- self:UpdateGrid()
    self:SetVisible(not (ParentAddon:Locked() or _G.InCombatLockdown()))
end

function OverlayUI:OnShow()
    self:UpdateGrid()
    self:ShowDragFrames()
end

function OverlayUI:OnHide()
    self:HideDragFrames()
end

function OverlayUI:OnSizeChanged()
    if ParentAddon:GetAlignmentGridEnabled() then
        self:DrawGrid()
    end
end

function OverlayUI:OnFadeOutFinished()
    self.frame:Hide()
    self:HideDragFrames()
end

function OverlayUI:CONFIG_MODE_ENABLED()
    self:SetVisible(not _G.InCombatLockdown())
end

function OverlayUI:CONFIG_MODE_DISABLED()
    self:SetVisible(false)
end

function OverlayUI:PLAYER_REGEN_ENABLED()
    self:SetVisible(not ParentAddon:Locked())
end

function OverlayUI:PLAYER_REGEN_DISABLED()
    self:SetVisible(false)
end

function OverlayUI:ALIGNMENT_GRID_ENABLED()
    self:UpdateGrid()
end

function OverlayUI:ALIGNMENT_GRID_SIZE_CHANGED()
    if ParentAddon:GetAlignmentGridEnabled() then
        self:DrawGrid()
    end
end

function OverlayUI:OnVisibilityChanged(visible)
    if visible then
        self.frame:Show()
        self:FadeIn()
    else
        self:FadeOut()
    end
end

--------------------------------------------------------------------------------
-- Properties
--------------------------------------------------------------------------------

function OverlayUI:SetVisible(visible)
    if self.visible ~= visible then
        self:OnVisibilityChanged(visible)
    end
end

function OverlayUI:GetFrame()
    return self.frame
end

--------------------------------------------------------------------------------
-- Actions
--------------------------------------------------------------------------------

function OverlayUI:FadeIn()
    if self.fadeOutSequence:IsPlaying() then
        self.fadeOutSequence:Stop()
    end

    if not self.fadeInSequence:IsPlaying() then
        self.fadeInSequence:Play()
    end
end

function OverlayUI:FadeOut()
    if self.fadeInSequence:IsPlaying() then
        self.fadeInSequence:Stop()
    end

    if not self.fadeOutSequence:IsPlaying() then
        self.fadeOutSequence:Play()
    end
end

function OverlayUI:UpdateGrid()
    if ParentAddon:GetAlignmentGridEnabled() then
        self:DrawGrid()
    else
        self:ClearGrid()
    end
end

-- this is derived from Ben Walker's Alignment Grid addon
function OverlayUI:DrawGrid()
    self:ClearGrid()

    local gridSize = ParentAddon:GetAlignmentGridSize()
    local width, height = self.frame:GetSize()
    local aspectRatio = width / height
    local verticalLines = gridSize
    -- convert to an even number, so that we can highlight the middle point
    local horizontalLines = GetMultiple(gridSize / aspectRatio, 2)
    local xOffset = width / verticalLines
    local yOffset = height / horizontalLines

    for i = 0, verticalLines do
        local line = self:AcquireGridLine()

        line:SetThickness(GRID_THICKNESS)

        if i == (verticalLines / 2) then
            line:SetColorTexture(GRID_HIGHLIGHT_COLOR:GetRGBA())
        else
            line:SetColorTexture(GRID_COLOR:GetRGBA())
        end

        line:SetStartPoint("TOPLEFT", xOffset * i, 0)
        line:SetEndPoint("BOTTOMLEFT", xOffset * i, 0)
    end

    for i = 0, horizontalLines do
        local line = self:AcquireGridLine()

        line:SetThickness(GRID_THICKNESS)

        if i == (horizontalLines / 2) then
            line:SetColorTexture(GRID_HIGHLIGHT_COLOR:GetRGBA())
        else
            line:SetColorTexture(GRID_COLOR:GetRGBA())
        end

        line:SetStartPoint("BOTTOMLEFT", 0, yOffset * i)
        line:SetEndPoint("BOTTOMRIGHT", 0, yOffset * i)
    end
end

function OverlayUI:ClearGrid()
    local activeLines = self.activeGridLines

    if activeLines then
        for i = #activeLines, 1, -1 do
            self:ReleaseGridLine(activeLines[i])
            activeLines[i] = nil
        end
    end
end

function OverlayUI:AcquireGridLine()
    local inactiveLines = self.inactiveGridLines

    -- restore
    local line = inactiveLines and inactiveLines[#inactiveLines]
    if line then
        inactiveLines[#inactiveLines] = nil
    else
        line = self.frame:CreateLine(nil, 'BACKGROUND')
    end

    -- add
    local activeLines = self.activeGridLines
    if activeLines then
        activeLines[#activeLines+1] = line
    else
        self.activeGridLines = { line }
    end

    line:Show()
    return line
end

function OverlayUI:ReleaseGridLine(line)
    line:Hide()

    local inactiveLines = self.inactiveGridLines
    if inactiveLines then
        inactiveLines[#inactiveLines+1] = line
    else
        self.inactiveGridLines = { line }
    end
end

function OverlayUI:ShowDragFrames()
    for _, frame in ParentAddon.Frame:GetAll() do
        Addon.FrameOverlay:New(self.frame, frame)
    end
end

function OverlayUI:HideDragFrames()
    Addon.FrameOverlay:FreeAll()
end

--------------------------------------------------------------------------------
-- exports
--------------------------------------------------------------------------------

Addon.OverlayUI = OverlayUI