---------------------------------------------------------------------------------
--                               Raid Fonction                                 --
---------------------------------------------------------------------------------


for index, raid in pairs(raids) do
  raidCount = raidCount + 1
  if raidCount >= maxRaids then
      break
  end

  local clickableFrame = CreateFrame("Button", "ClickableRaidFrame" .. index, raidContentFrame)
  clickableFrame:SetHeight(30)
  clickableFrame:SetWidth(raidContentFrame:GetWidth() + 20)
  clickableFrame:SetPoint("TOPLEFT", raidContentFrame, "TOPLEFT", 0, -(30 * (index - 1)))

  -- Ajouter le clickableFrame dans la table globale pour pouvoir le manipuler ensuite
  table.insert(raidClickableFrames, clickableFrame)

  local raidAbrev = raid.abrev
  local raidName = raid.nom

  local checkbox = CreateFrame("CheckButton", "RaidCheckbox" .. index, clickableFrame, "UICheckButtonTemplate")
  checkbox:SetWidth(20)
  checkbox:SetHeight(20)
  checkbox:SetPoint("LEFT", clickableFrame, "LEFT", 0, 0)

  local label = clickableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
  label:SetText(raidName)

  raidCheckButtons[raidAbrev] = checkbox

  local function UpdateBackdrop()
    if checkbox:GetChecked() then
      clickableFrame:SetBackdrop({
          bgFile = "Interface\\Buttons\\WHITE8X8",
          insets = {left = 1, right = 1, top = 1, bottom = 1},
      })
      clickableFrame:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
    else
      clickableFrame:SetBackdrop(nil)
    end
  end

  checkbox:SetScript("OnClick", function()
    if checkbox:GetChecked() then
        rightPanel:Show()
        showArrowBtn:Hide()
        editBox:Show()
        sliderframe:Show()
        dashText:Show()
        toggleButton:Show()
        msgFrameDj:Show()
        UpdateChannelsFramePosition()
        swapChannelFrame()
      -- Décocher toutes les autres cases et enlever leur backdrop
      for _, otherCheckbox in pairs(raidCheckButtons) do
        if otherCheckbox ~= checkbox then
          otherCheckbox:SetChecked(false)
          otherCheckbox:GetParent():SetBackdrop(nil)
        end
      end
      selectedRaids = {raidAbrev}
    else
      selectedRaids = {}
      sliderSizeFrame:Hide()
        
    end
    UpdateBackdrop()
    updateMsgFrameCombined()
  end)

  clickableFrame:SetScript("OnClick", function()
    checkbox:SetChecked(not checkbox:GetChecked())
    checkbox:GetScript("OnClick")()
  end)

  clickableFrame:SetScript("OnEnter", function()
    clickableFrame:SetBackdrop({
      bgFile = "Interface\\Buttons\\WHITE8X8",
      insets = {left = 1, right = 1, top = 1, bottom = 1},
    })
    clickableFrame:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
  end)

  clickableFrame:SetScript("OnLeave", function()
    if not checkbox:GetChecked() then
      clickableFrame:SetBackdrop(nil)
    else
      UpdateBackdrop()
    end
  end)
end
