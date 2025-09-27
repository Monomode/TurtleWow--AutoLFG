---------------------------------------------------------------------------------
--                            Role Fonction                                    --
---------------------------------------------------------------------------------


iconWidth = roleframe:GetWidth() / 3 * 0.7
iconHeight = roleframe:GetHeight() * 0.7
iconSpacing = 20
totalIconsWidth = 3 * iconWidth + 2 * iconSpacing
offsetX = (roleframe:GetWidth() - totalIconsWidth) / 2
offsetY = (roleframe:GetHeight() - iconHeight) / 2  -- Centrer verticalement

-- Créer l'icône Tank
tankIcon = CreateFrame("Button", nil, roleframe)
tankIcon:SetWidth(iconWidth)
tankIcon:SetHeight(iconHeight)
tankIcon:SetPoint("TOPLEFT", roleframe, "TOPLEFT", offsetX, -offsetY)

tankIcon.texture = tankIcon:CreateTexture(nil, "BACKGROUND")
tankIcon.texture:SetAllPoints(tankIcon)
tankIcon.texture:SetTexture("Interface\\AddOns\\AutoLFM\\icon\\tank.png")

tankIcon.selected = false
tankIcon:SetScript("OnClick", function()
  -- Inverser l'état de sélection
  if tankIcon.selected then
      -- Désélectionner
      tankIcon.selected = false
      tankIcon:SetBackdrop(nil)  -- Retirer les bordures
      tankIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
      -- Ajouter une ombre pour la désélection
      tankIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
          edgeSize = 16,
      })
      -- Supprimer le rôle Tank de la table selectedRoles
      for i, role in ipairs(selectedRoles) do
          if role == "Tank" then
              table.remove(selectedRoles, i)
              break
          end
      end
  else
      -- Sélectionner
      tankIcon.selected = true
      -- Appliquer une bordure plus lumineuse et épaisse
      tankIcon:SetBackdrop({
          edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
          edgeSize = 16,
          insets = { left = 4, right = 4, top = 4, bottom = 4 },
      })
      -- Bordure jaune plus lumineuse
      tankIcon:SetBackdropBorderColor(1, 1, 0, 1)

      -- Appliquer un effet de glow (halo lumineux)
      tankIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\glow-border.tga",  -- Texture personnalisée pour glow
          edgeSize = 32,
      })
      tankIcon:SetBackdropBorderColor(0, 1, 0, 1)  -- Bordure néon verte pour l'effet lumineux

      tankIcon.texture:SetAlpha(1)  -- Rendre l'icône entièrement opaque
      -- Ajouter le rôle Tank à la table selectedRoles
      table.insert(selectedRoles, "Tank")
  end
  updateMsgFrameCombined()  -- Mettre à jour le message dans msgFrame
end)

-- Créer l'icône DPS
dpsIcon = CreateFrame("Button", nil, roleframe)
dpsIcon:SetWidth(iconWidth)
dpsIcon:SetHeight(iconHeight)
dpsIcon:SetPoint("TOPLEFT", tankIcon, "TOPRIGHT", iconSpacing, 0)

dpsIcon.texture = dpsIcon:CreateTexture(nil, "BACKGROUND")
dpsIcon.texture:SetAllPoints(dpsIcon)
dpsIcon.texture:SetTexture("Interface\\AddOns\\AutoLFM\\icon\\dps.png")

dpsIcon.selected = false
dpsIcon:SetScript("OnClick", function()
  -- Inverser l'état de sélection
  if dpsIcon.selected then
      -- Désélectionner
      dpsIcon.selected = false
      dpsIcon:SetBackdrop(nil)  -- Retirer les bordures
      dpsIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
      -- Ajouter une ombre pour la désélection
      dpsIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
          edgeSize = 16,
      })
      -- Supprimer le rôle DPS de la table selectedRoles
      for i, role in ipairs(selectedRoles) do
          if role == "DPS" then
              table.remove(selectedRoles, i)
              break
          end
      end
  else
      -- Sélectionner
      dpsIcon.selected = true
      -- Appliquer une bordure plus lumineuse et épaisse
      dpsIcon:SetBackdrop({
          edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
          edgeSize = 16,
          insets = { left = 4, right = 4, top = 4, bottom = 4 },
      })
      -- Bordure jaune plus lumineuse
      dpsIcon:SetBackdropBorderColor(1, 1, 0, 1)

      -- Appliquer un effet de glow (halo lumineux)
      dpsIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\glow-border.tga",  -- Texture personnalisée pour glow
          edgeSize = 32,
      })
      dpsIcon:SetBackdropBorderColor(0, 1, 0, 1)  -- Bordure néon verte pour l'effet lumineux

      dpsIcon.texture:SetAlpha(1)  -- Rendre l'icône entièrement opaque
      -- Ajouter le rôle DPS à la table selectedRoles
      table.insert(selectedRoles, "DPS")
  end
  updateMsgFrameCombined()  -- Mettre à jour le message dans msgFrame
end)

-- Créer l'icône Heal
healIcon = CreateFrame("Button", nil, roleframe)
healIcon:SetWidth(iconWidth)
healIcon:SetHeight(iconHeight)
healIcon:SetPoint("TOPLEFT", dpsIcon, "TOPRIGHT", iconSpacing, 0)

healIcon.texture = healIcon:CreateTexture(nil, "BACKGROUND")
healIcon.texture:SetAllPoints(healIcon)
healIcon.texture:SetTexture("Interface\\AddOns\\AutoLFM\\icon\\heal.png")

healIcon.selected = false
healIcon:SetScript("OnClick", function()
  -- Inverser l'état de sélection
  if healIcon.selected then
      -- Désélectionner
      healIcon.selected = false
      healIcon:SetBackdrop(nil)  -- Retirer les bordures
      healIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
      -- Ajouter une ombre pour la désélection
      healIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
          edgeSize = 16,
      })
      -- Supprimer le rôle Heal de la table selectedRoles
      for i, role in ipairs(selectedRoles) do
          if role == "Heal" then
              table.remove(selectedRoles, i)
              break
          end
      end
  else
      -- Sélectionner
      healIcon.selected = true
      -- Appliquer une bordure plus lumineuse et épaisse
      healIcon:SetBackdrop({
          edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
          edgeSize = 16,
          insets = { left = 4, right = 4, top = 4, bottom = 4 },
      })
      -- Bordure jaune plus lumineuse
      healIcon:SetBackdropBorderColor(1, 1, 0, 1)

      -- Appliquer un effet de glow (halo lumineux)
      healIcon:SetBackdrop({
          edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\glow-border.tga",
          edgeSize = 32,
      })
      healIcon:SetBackdropBorderColor(0, 1, 0, 1)  -- Bordure néon verte pour l'effet lumineux

      healIcon.texture:SetAlpha(1)  -- Rendre l'icône entièrement opaque
      -- Ajouter le rôle Heal à la table selectedRoles
      table.insert(selectedRoles, "Heal")
  end
  updateMsgFrameCombined()  -- Mettre à jour le message dans msgFrame
end)

-- Appliquer un effet de fade (transparence) initialement lorsque non sélectionnée
dpsIcon.texture:SetAlpha(0.5)  -- Applique un fade initial pour DPS
healIcon.texture:SetAlpha(0.5)  -- Applique un fade initial pour Heal
tankIcon.texture:SetAlpha(0.5)  -- Applique un fade initial lorsque non sélectionnée

-- Fonction pour gérer l'effet de survol
function OnEnterEffect(icon)
  -- Changer la transparence de l'icône survolée pour la rendre plus visible
  icon.texture:SetAlpha(1)  -- L'icône devient pleinement opaque
  -- Appliquer une bordure lumineuse (par exemple, une bordure bleue claire)
  icon:SetBackdrop({
      edgeSize = 16,
      insets = { left = 4, right = 4, top = 4, bottom = 4 },
  })
  icon:SetBackdropBorderColor(0, 0, 1, 1)  -- Bordure bleue pour l'effet de survol
end

-- Fonction pour réinitialiser l'effet de survol
function OnLeaveEffect(icon)
  -- Réinitialiser la transparence de l'icône
  if not icon.selected then
      icon.texture:SetAlpha(0.5)  -- Appliquer un fade si l'icône n'est pas sélectionnée
  end
  -- Réinitialiser la bordure de l'icône
  icon:SetBackdrop(nil)
end

-- Ajouter les effets de survol pour chaque icône

tankIcon:SetScript("OnEnter", function() OnEnterEffect(tankIcon) end)
tankIcon:SetScript("OnLeave", function() OnLeaveEffect(tankIcon) end)

dpsIcon:SetScript("OnEnter", function() OnEnterEffect(dpsIcon) end)
dpsIcon:SetScript("OnLeave", function() OnLeaveEffect(dpsIcon) end)

healIcon:SetScript("OnEnter", function() OnEnterEffect(healIcon) end)
healIcon:SetScript("OnLeave", function() OnLeaveEffect(healIcon) end)

