--
--
--
--
--
--

--------------------------- Variables ---------------------------


local selectedDungeons = {} -- Table to store selected dungeons
local selectedRaids = {} -- Table to store selected raids
local selectedRoles = {} -- Table to store selected roles
local userInputMessage = "" -- Variable to store user input message
local combinedMessage = "" -- String to store the combined message


--------------------------- Variables Donjons ---------------------------


local donjons = {
  { nom = "Ragefire Chasm", abrev = "RFC", size = 5, lvl = "13-18", lvl_min = 13, lvl_max = 18 },
  { nom = "The Deadmines", abrev = "DM", size = 5, lvl = "17-24", lvl_min = 17, lvl_max = 24 },
  { nom = "Wailing Caverns", abrev = "WC", size = 5, lvl = "17-24", lvl_min = 17, lvl_max = 24 },
  { nom = "The Stockade", abrev = "Stockade", size = 5, lvl = "22-30", lvl_min = 22, lvl_max = 30 },
  { nom = "Shadowfang Keep", abrev = "SFK", size = 5, lvl = "22-30", lvl_min = 22, lvl_max = 30 },
  { nom = "Blackfathom Deeps", abrev = "BFD", size = 5, lvl = "23-32", lvl_min = 23, lvl_max = 32 },
  { nom = "Scarlet Monastery Graveyard", abrev = "SM Grav", size = 5, lvl = "27-36", lvl_min = 27, lvl_max = 36 },
  { nom = "Scarlet Monastery Library", abrev = "SM Lib", size = 5, lvl = "28-39", lvl_min = 28, lvl_max = 39 },
  { nom = "Gnomeregan", abrev = "Gnomeregan", size = 5, lvl = "29-38", lvl_min = 29, lvl_max = 38 },
  { nom = "Razorfen Kraul", abrev = "RFK", size = 5, lvl = "29-38", lvl_min = 29, lvl_max = 38 },
  { nom = "The Crescent Grove", abrev = "Crescent", size = 5, lvl = "32-38", lvl_min = 32, lvl_max = 38 },
  { nom = "Scarlet Monastery Armory", abrev = "SM Armo", size = 5, lvl = "32-41", lvl_min = 32, lvl_max = 41 },
  { nom = "Scarlet Monastery Cathedral", abrev = "SM Cath", size = 5, lvl = "35-45", lvl_min = 35, lvl_max = 45 },
  { nom = "Razorfen Downs", abrev = "RFD", size = 5, lvl = "36-46", lvl_min = 36, lvl_max = 46 },
  { nom = "Uldaman", abrev = "Ulda", size = 5, lvl = "40-51", lvl_min = 40, lvl_max = 51 },
  { nom = "Gilneas City", abrev = "Gilneas", size = 5, lvl = "42-50", lvl_min = 42, lvl_max = 50 },
  { nom = "Zul'Farrak", abrev = "ZF", size = 5, lvl = "44-54", lvl_min = 44, lvl_max = 54 },
  { nom = "Maraudon Purple", abrev = "Maraudon Purple", size = 5, lvl = "45-55", lvl_min = 45, lvl_max = 55 },
  { nom = "Maraudon Orange", abrev = "Maraudon Orange", size = 5, lvl = "47-55", lvl_min = 47, lvl_max = 55 },
  { nom = "Maraudon Princess", abrev = "Maraudon Princess", size = 5, lvl = "47-55", lvl_min = 47, lvl_max = 55 },
  { nom = "The Sunken Temple", abrev = "ST", size = 5, lvl = "50-60", lvl_min = 50, lvl_max = 60 },
  { nom = "Halteforge Quarry", abrev = "HQ", size = 5, lvl = "50-60", lvl_min = 50, lvl_max = 60 },
  { nom = "Blackrock Depths Arena", abrev = "BRD Arena", size = 5, lvl = "52-60", lvl_min = 52, lvl_max = 60 },
  { nom = "Blackrock Depths", abrev = "BRD", size = 5, lvl = "52-60", lvl_min = 52, lvl_max = 60 },
  { nom = "Blackrock Depths Emperor", abrev = "BRD Emperor", size = 5, lvl = "52-60", lvl_min = 54, lvl_max = 60 },
  { nom = "Lower Blackrock Spire", abrev = "LBRS", size = 5, lvl = "55-60", lvl_min = 55, lvl_max = 60 },
  { nom = "Dire Maul Tribute", abrev = "DM Tribute", size = 5, lvl = "57-60", lvl_min = 57, lvl_max = 60 },
  { nom = "Dire Maul West", abrev = "DM W", size = 5, lvl = "57-60", lvl_min = 57, lvl_max = 60 },
  { nom = "Dire Maul North", abrev = "DM N", size = 5, lvl = "57-60", lvl_min = 57, lvl_max = 60 },
  { nom = "Scholomance 5", abrev = "Scholo 5", size = 5, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Scholomance 10", abrev = "Scholo 10", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Stratholme Live 5", abrev = "Strat Live 5", size = 5, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Stratholme Live 10", abrev = "Strat Live 10", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Karazhan Crypt", abrev = "Kara Crypt", size = 5, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Stratholme UD 5", abrev = "Strat UD 5", size = 5, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Stratholme UD 10", abrev = "Strat UD 10", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
  { nom = "Caverns of Time. Black Morass", abrev = "BT", size = 5, lvl = "60", lvl_min = 60, lvl_max = 60 },
  { nom = "Stormwind Vault", abrev = "SWV", size = 5, lvl = "60", lvl_min = 60, lvl_max = 60 },
  { nom = "Upper Blackrock Spire", abrev = "UBRS", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
}


--------------------------- Variables Raids ---------------------------


local raids = {
  { nom = "Zul'Gurub", abrev = "ZG", size_min = 12, size_max = 20},
  { nom = "Ruins of Ahn'Qiraj", abrev = "AQ20", size_min = 12, size_max = 20},
  { nom = "Molten Core", abrev = "MC", size_min = 20, size_max = 40},
  { nom = "Onyxia's Lair", abrev = "Ony", size_min = 20, size_max = 40},
  { nom = "Lower Karazhan Halls", abrev = "Kara10", size_min = 10, size_max = 10},
  { nom = "Blackwing Lair", abrev = "BWL", size_min = 20, size_max = 40},
  { nom = "Emerald Sanctum", abrev = "ES", size_min = 30, size_max = 40},
  { nom = "Temple of Ahn'Qiraj", abrev = "AQ40", size_min = 20, size_max = 40},
  { nom = "Naxxramas", abrev = "Naxx", size_min = 30, size_max = 40},
}


--------------------------- Variables Roles ---------------------------


local roles = {
  "Tank",
  "Healer",
  "DPS"
}


--------------------------- Log Message ---------------------------


local msglog = CreateFrame("Frame")
msglog:RegisterEvent("PLAYER_ENTERING_WORLD")

local function OnPlayerEnteringWorld(self, event)
--   local seg1 = "|cffffffff ---- Refonte de l'addon ---- "
  local seg2 = "|cffffffff <"
  local seg3 = "|cffffff00 Auto "
  local seg4 = "|cff0070DDL"
  local seg5 = "|cffffffffF"
  local seg6 = "|cffff0000M "
  local seg7 = "|cffffffff>"
  local seg8 = " "
  local seg9 = "|cff00FF00 Loaded successfully !"
  local seg10 = "|cffffff00   More information with  : "
  local seg11 = "|cff00FFFF  /lfm help"


  -- Combine the segments and display the message
--   DEFAULT_CHAT_FRAME:AddMessage(seg1)
  DEFAULT_CHAT_FRAME:AddMessage(seg2 .. seg3 .. seg4 .. seg5 .. seg6 .. seg7 .. seg8 .. seg9)
  DEFAULT_CHAT_FRAME:AddMessage(seg10 .. seg11)

  DisplayDungeonsByColor()

  -- Unregister PLAYER_LOGIN event to avoid repeated execution
  msglog:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

msglog:SetScript("OnEvent", OnPlayerEnteringWorld)



--------------------------- Canaux World & LFG ---------------------------


-- Table des canaux à rechercher
local channelsToFind = {"WORLD", "LookingForGroup"}
-- Table pour stocker les canaux trouvés
local foundChannels = {}

-- Fonction pour envoyer un message dans les canaux trouvés
local function sendMessageToChannels(message)
    for _, channel in ipairs(channelsToFind) do
        -- Recherche l'ID du canal en utilisant "/join" pour s'assurer qu'il est ouvert
        local channelId = GetChannelName(channel)
        if channelId and channelId > 0 then
            SendChatMessage(message, "CHANNEL", nil, channelId)
            -- DEFAULT_CHAT_FRAME:AddMessage(message, 0, 1, 1) -- Test Message
        end
    end
end


--------------------------- Fonctions ---------------------------


-- Créer strsplit
function strsplit(delim, text)
  local result = {}
  local start = 1
  local i = 1

  while true do
      -- Recherche de l'emplacement du prochain délimiteur
      local s, e = string.find(text, delim, start)

      if not s then  -- Si aucun délimiteur n'est trouvé, on arrête
          result[i] = string.sub(text, start)
          break
      end

      -- Ajouter le segment trouvé dans le tableau
      result[i] = string.sub(text, start, s - 1)
      i = i + 1

      -- Mettre à jour le point de départ pour la prochaine recherche
      start = e + 1
  end

  return result
end

-- Fonction pour vérifier si un élément est présent dans la table
local function tableContains(table, element)
    return table[element] ~= nil  -- Vérification optimisée
end

function tableContains(table, value)
  for _, v in pairs(table) do
      if v == value then
          return true
      end
  end
  return false
end


--------------------------- Cadre Principal AutoLFM ---------------------------


-- Création du cadre
local AutoLFM = CreateFrame("Frame", "AutoLFM", UIParent)
AutoLFM:SetWidth(600)
AutoLFM:SetHeight(400)
AutoLFM:SetPoint("CENTER", UIParent, "CENTER")
AutoLFM:SetMovable(true)
AutoLFM:EnableMouse(true)
AutoLFM:RegisterForDrag("LeftButton")

-- Ajouter le fond
AutoLFM:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 10, right = 10, top = 10, bottom = 10 },
})

-- Créer un titre du cadre
local title = CreateFrame("Frame", nil, AutoLFM)
title:SetPoint("BOTTOM", AutoLFM, "TOP", 0, -8)
title:SetWidth(200)
title:SetHeight(50)
title:SetMovable(true)
title:EnableMouse(true)
title:RegisterForDrag("LeftButton")

title:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 10, right = 10, top = 10, bottom = 10 },
})


--------------------------- Titre segmenté LFM ---------------------------


local titleSegments = {}
local part1 = title:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
part1:SetText("|cff0070DDL|r")
part1:SetFont("Fonts\\SKURRI.TTF", 24, "OUTLINE")
table.insert(titleSegments, part1)

local part2 = title:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
part2:SetText("F")
part2:SetFont("Fonts\\SKURRI.TTF", 24, "OUTLINE")
part2:SetTextColor(1, 1, 1)
part2:SetPoint("LEFT", part1, "RIGHT", 5, 0)
table.insert(titleSegments, part2)

local part3 = title:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
part3:SetText("|cffff0000M|r")
part3:SetFont("Fonts\\SKURRI.TTF", 24, "OUTLINE")
part3:SetPoint("LEFT", part2, "RIGHT", 5, 0)
table.insert(titleSegments, part3)

-- Calculer la largeur totale du texte
local totalWidth = 0
for _, segment in ipairs(titleSegments) do
    totalWidth = totalWidth + segment:GetStringWidth()
end

local currentX = -totalWidth / 2
for _, segment in ipairs(titleSegments) do
    segment:SetPoint("CENTER", title, "CENTER", currentX, 0)
    currentX = currentX + segment:GetStringWidth()
end


--------------------------- Bouton X ---------------------------


-- --- Création du bouton rond "X" en haut à droite de la frame principale ---
local closeButton = CreateFrame("Button", nil, AutoLFM)
closeButton:SetWidth(30)
closeButton:SetHeight(30)
closeButton:SetPoint("TOPRIGHT", AutoLFM, "TOPRIGHT", 8, 8)

-- Appliquer une forme ronde au bouton avec une bordure
closeButton:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})

-- Ajouter un texte (un "X") à l'intérieur du bouton
local closeIcon = closeButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
closeIcon:SetText("X")
closeIcon:SetPoint("CENTER", closeButton, "CENTER", 0, 0)
closeIcon:SetTextColor(1, 1, 1)

-- Ajouter un script pour masquer la frame quand le bouton est cliqué
closeButton:SetScript("OnClick", function()
    AutoLFM:Hide()
end)

-- Option pour ajouter un effet de survol :
closeButton:SetScript("OnEnter", function(self)
    this:SetBackdropBorderColor(1, 0, 0, 1)
    closeIcon:SetTextColor(1, 0, 0)
end)

closeButton:SetScript("OnLeave", function(self)
  this:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  })
  closeIcon:SetTextColor(1, 1, 1)
end)


--------------------- Minimap Buton ---------------------


-- Création du bouton de la mini-carte
local AutoLFMMinimapBtn = CreateFrame("Button", "AutoLFMMinimapButton", Minimap)
AutoLFMMinimapBtn:SetFrameStrata("MEDIUM")  -- Ajuster la strate du cadre pour qu'il soit au-dessus de la mini-carte
AutoLFMMinimapBtn:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")  -- Ajouter un effet de survol

AutoLFMMinimapBtn:SetNormalTexture("Interface\\AddOns\\AutoLFM\\icon\\ring.png")  -- Icône de l'addon
AutoLFMMinimapBtn:GetNormalTexture():SetTexCoord(0.0, 1.0, 0.0, 1.0)
AutoLFMMinimapBtn:SetPushedTexture("Interface\\AddOns\\AutoLFM\\icon\\fermer.png")  -- Ajouter un effet de clic

-- Positionner le bouton par rapport à la mini-carte
AutoLFMMinimapBtn:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -10, -10)  -- Ajuste la position selon tes besoins


-- Ajouter un effet lors du survol de la souris
AutoLFMMinimapBtn:SetScript("OnEnter", function()

    -- Afficher le tooltip
    GameTooltip:SetOwner(AutoLFMMinimapBtn, "ANCHOR_RIGHT")
    local seg4 = "|cff0070DDL"
    local seg5 = "|cffffffffF"
    local seg6 = "|cffff0000M "
    GameTooltip:SetText("Auto" .. seg4 .. seg5 .. seg6)
    GameTooltip:AddLine("Click to toggle AutoLFM interface.", 1, 1, 1)
    GameTooltip:AddLine("Ctrl + Click for move.", 1, 1, 1)
    GameTooltip:Show()
end)

-- Réinitialiser la couleur et l'effet lors de la sortie de la souris
AutoLFMMinimapBtn:SetScript("OnLeave", function()
    -- Réinitialiser la couleur de l'icône (retour à la couleur normale)
    AutoLFMMinimapBtn:GetNormalTexture():SetVertexColor(1, 1, 1)  -- Retour à la couleur d'origine (blanc)

    -- Cacher le tooltip
    GameTooltip:Hide()
end)

-- Clic gauche pour ouvrir/fermer l'interface
AutoLFMMinimapBtn:SetScript("OnClick", function()
    -- Vérifier si la touche Ctrl est enfoncée
    if IsControlKeyDown() then
        return
    end

    -- Si Ctrl n'est pas enfoncé, gérer l'ouverture/fermeture de l'interface
    if AutoLFM:IsShown() then
        AutoLFM:Hide()
    else
        AutoLFM:Show()
    end
end)


----------------- Drag and Drop -----------------


-- Fonction pour démarrer le mouvement de la frame et du titre
local function StartMovingFrame(self)
  if AutoLFM:IsShown() then
      AutoLFM:StartMoving()
      title:StartMoving()
  end
end

-- Fonction pour arrêter le mouvement de la frame et du titre
local function StopMovingFrame(self)
  if AutoLFM:IsShown() then
      AutoLFM:StopMovingOrSizing()
      title:StopMovingOrSizing()
  end
end

-- Fonction pour arrêter le mouvement de la frame et du titre quand ils sont cachés
local function StopMovingOnHide(self)
  AutoLFM:StopMovingOrSizing()
  title:StopMovingOrSizing()
end

-- Détecter les événements de déplacement sur la frame principale
AutoLFM:SetScript("OnMouseDown", StartMovingFrame)
AutoLFM:SetScript("OnMouseUp", StopMovingFrame)
AutoLFM:SetScript("OnHide", StopMovingOnHide)

-- Détecter les événements de déplacement sur le titre
title:SetScript("OnMouseDown", StartMovingFrame)
title:SetScript("OnMouseUp", StopMovingFrame)
title:SetScript("OnHide", StopMovingOnHide)

-- Rendre le bouton déplacable avec Ctrl + Clic gauche
AutoLFMMinimapBtn:SetMovable(true)
AutoLFMMinimapBtn:EnableMouse(true)
AutoLFMMinimapBtn:RegisterForDrag("LeftButton")

AutoLFMMinimapBtn:SetScript("OnMouseDown", function(self, button)
    -- Vérifier si Ctrl est maintenu lors du clic
    if IsControlKeyDown() then
        AutoLFMMinimapBtn:StartMoving()
    end
end)

AutoLFMMinimapBtn:SetScript("OnMouseUp", function(self, button)
    -- Arrêter le déplacement du bouton
    AutoLFMMinimapBtn:StopMovingOrSizing()
end)


--------------------------- Frames ---------------------------


--------------------------- Donjons ---------------------------


-- Initialisation des variables
local donjonCount = 0
local maxDonjons = 100

for _, donjon in pairs(donjons) do
  if donjonCount >= maxDonjons then
      break
  end
  donjonCount = donjonCount + 1
end

-- Créer cadre djframe
local djframe = CreateFrame("Frame", nil, AutoLFM)
djframe:SetWidth(265)
djframe:SetHeight(380)
djframe:SetPoint("TOPLEFT", AutoLFM, "TOPLEFT", 10, -10)
djframe:SetBackdrop({
    edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
})

local djScrollFrame = CreateFrame("ScrollFrame", "AutoLFM_ScrollFrame_Dungeons", djframe, "UIPanelScrollFrameTemplate")
djScrollFrame:SetPoint("TOPLEFT", djframe, "TOPLEFT", 10, -40)
djScrollFrame:SetWidth(265)
djScrollFrame:SetHeight(330)

-- Créer le contenu du ScrollFrame pour les donjons
local contentFrame = CreateFrame("Frame", nil, djScrollFrame)
contentFrame:SetWidth(250)
contentFrame:SetHeight(donjonCount * 30)  -- Hauteur dynamique basée sur le nombre de donjons
djScrollFrame:SetScrollChild(contentFrame)


--------------------------- Raids ---------------------------


-- Créer cadre raidFrame
local raidFrame = CreateFrame("Frame", nil, AutoLFM)
raidFrame:SetWidth(240)
raidFrame:SetHeight(380)
raidFrame:SetPoint("TOPLEFT", AutoLFM, "TOPLEFT", 10, -10)
raidFrame:SetBackdrop({
    edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
})


--------------------------- Init Donjons & Raids ---------------------------


contentFrame:Show()
djframe:Show()
djScrollFrame:Show()
raidFrame:Hide()


--------------------------- Roles ---------------------------


-- Créer cadre roleframe
local roleframe = CreateFrame("Frame", nil, AutoLFM)
roleframe:SetBackdrop({
    bgFile = nil,
    -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
    edgeSize = 16,
    insets = { left = 4, right = 2, top = 4, bottom = 4 }, -- Marge de 4 pixels
})
roleframe:SetBackdropColor(1, 1, 1, 0.3)
roleframe:SetBackdropBorderColor(1, 1, 1, 1)

-- Positionner le roleframe
roleframe:SetWidth(AutoLFM:GetWidth() * 0.4)
roleframe:SetHeight(AutoLFM:GetHeight() * 0.2) --
roleframe:SetPoint("TOPRIGHT", AutoLFM, "TOPRIGHT", -30, -40)

-- Réduction de la taille des icônes de 20 % au total
local iconWidth = roleframe:GetWidth() / 3 * 0.7
local iconHeight = roleframe:GetHeight() * 0.7

-- Espacement entre les icônes (en pixels) : augmenter l'espacement à 20 pixels
local iconSpacing = 20

-- Ajouter un texte au-dessus des icônes
local selectRoleText = roleframe:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
selectRoleText:SetText("Choose the role(s) you need ")
selectRoleText:SetPoint("BOTTOM", roleframe, "TOP", 0, 5)
selectRoleText:SetJustifyH("CENTER")
selectRoleText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")


--------------------------- msgFrame ---------------------------


local msgFrame = CreateFrame("Frame", nil, AutoLFM)

-- Positionner le cadre msgFrame juste en dessous de roleframe
msgFrame:SetWidth(roleframe:GetWidth())
msgFrame:SetHeight(roleframe:GetHeight() + 20)
msgFrame:SetPoint("TOPRIGHT", roleframe, "BOTTOMRIGHT", 0, -5)


--------------------------- Message Frame Donjons ---------------------------


local msgFrameDj = CreateFrame("Frame", nil, AutoLFM)
msgFrameDj:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  edgeSize = 16,
  insets = { left = 5, right = 5, top = 5, bottom = 5 },
})

-- Positionner le cadre msgFrameDj juste en dessous de roleframe
msgFrameDj:SetWidth(roleframe:GetWidth())
msgFrameDj:SetHeight(roleframe:GetHeight() + 20)
msgFrameDj:SetPoint("TOPRIGHT", roleframe, "BOTTOMRIGHT", 0, 0)


-- Créer un FontString dans msgFrameDj pour afficher le message
local msgTextDj = msgFrameDj:CreateFontString(nil, "OVERLAY", "GameFontNormal")
msgTextDj:SetPoint("CENTER", msgFrameDj, "CENTER")
msgTextDj:SetTextColor(1, 1, 1)
msgTextDj:SetJustifyH("CENTER")
msgTextDj:SetJustifyV("CENTER")
msgTextDj:SetWidth(msgFrameDj:GetWidth())


--------------------------- Message Frame Raids ---------------------------


local msgFrameRaids = CreateFrame("Frame", nil, AutoLFM)
msgFrameRaids:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  edgeSize = 16,
  insets = { left = 5, right = 5, top = 5, bottom = 5 },
})

-- Positionner le cadre msgFrameRaids juste en dessous de roleframe
msgFrameRaids:SetWidth(roleframe:GetWidth())
msgFrameRaids:SetHeight(roleframe:GetHeight() + 20)
msgFrameRaids:SetPoint("TOPRIGHT", roleframe, "BOTTOMRIGHT", 0, 0)

msgFrameRaids:Hide()

-- Créer un FontString dans msgFrame pour afficher le message
local msgTextRaids = msgFrameRaids:CreateFontString(nil, "OVERLAY", "GameFontNormal")
msgTextRaids:SetPoint("CENTER", msgFrameRaids, "CENTER")
msgTextRaids:SetTextColor(1, 1, 1)
msgTextRaids:SetJustifyH("CENTER")
msgTextRaids:SetJustifyV("CENTER")
msgTextRaids:SetWidth(msgFrameRaids:GetWidth())


--------------------------- EditBox ---------------------------


-- Créer une zone de saisie de texte en bas de msgFrame
local editBox = CreateFrame("EditBox", "MonAddonEditBox", msgFrame)
editBox:SetPoint("BOTTOM", msgFrame, "BOTTOM", 0, -60)  -- Positionner en bas, avec un écart de 10 pixels du bas du cadre

-- Définir les propriétés de la zone de texte sans spécifier la taille
editBox:SetAutoFocus(false)  -- Empêcher le focus automatique
editBox:SetFont("Fonts\\FRIZQT__.TTF", 16)  -- Police de texte normale
editBox:SetMaxLetters(150)  -- Limiter le nombre de caractères
editBox:SetText("")  -- Texte initial (vide)
editBox:SetTextInsets(10, 10, 10, 10)  -- Marge interne de 10 pixels

-- Adapter la largeur de la zone de texte à la largeur de msgFrame moins une marge (pour éviter que le texte soit collé aux bords)
editBox:SetWidth(msgFrame:GetWidth() - 30)  -- Largeur légèrement réduite par rapport à msgFrame

-- Définir une hauteur fixe pour la zone de saisie (sans SetSize)
editBox:SetHeight(30)  -- Hauteur fixe de la zone de saisie



-- Fonction pour gérer l'appui sur "Entrée"
editBox:SetScript("OnEnterPressed", function(self)
  this:ClearFocus()  -- Retirer le focus de la zone de texte
end)

editBox:SetScript("OnEscapePressed", function(self)
  this:ClearFocus()  -- Retirer le focus de la zone de texte
end)

-- Créer un texte pour afficher un tiret centré au-dessus de la zone de saisie
local dashText = msgFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
dashText:SetPoint("BOTTOM", editBox, "TOP", 0, 8)  -- Placer au-dessus de editBox avec un écart de 5 pixels
dashText:SetText("Add details (optional)")  -- Le texte du tiret

-- Personnaliser l'apparence du tiret (par exemple, couleur et taille de police)
dashText:SetFontObject(GameFontNormal)  -- Utiliser la police de texte normale
dashText:SetTextColor(1, 1, 1, 1)  -- Couleur blanche pour le tiret


-- Optionnel : ajouter un fond à la zone de saisie pour la rendre plus visible
editBox:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  edgeSize = 12,
  insets = { left = 5, right = 5, top = 5, bottom = 5 },
})
editBox:SetTextColor(1, 1, 1)  -- Couleur du texte blanc


--------------------------- Slider ---------------------------

--------------------------- Interval ---------------------------

-- Créer cadre sliderframe
local sliderframe = CreateFrame("Frame", nil, AutoLFM)
sliderframe:SetBackdrop({
    bgFile = nil,
    -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
    edgeSize = 16,  -- Taille de la bordure
    insets = { left = 4, right = 2, top = 4, bottom = 4 },
})
sliderframe:SetBackdropColor(1, 1, 1, 0.3)
sliderframe:SetBackdropBorderColor(1, 1, 1, 1)

-- Positionner le nouveau cadre juste en dessous de roleframe
sliderframe:SetWidth(roleframe:GetWidth())
sliderframe:SetHeight(roleframe:GetHeight() + 50)
sliderframe:SetPoint("TOPRIGHT", msgFrame, "BOTTOMRIGHT", 0, -40)

-- Créer la barre de glissement (Slider)
local slider = CreateFrame("Slider", nil, sliderframe, "OptionsSliderTemplate")
slider:SetWidth(200)
slider:SetHeight(20)
slider:SetPoint("CENTER", sliderframe, "CENTER", 0, 0)
slider:SetMinMaxValues(40, 120)
slider:SetValue(80)
slider:SetValueStep(10)



--------------------------- Msg Dynamique ---------------------------


-- Fonction pour compter les membres du groupe
local function countGroupMembers()
  local groupSize

  groupSize = GetNumPartyMembers() + 1

  return groupSize
end

-- Fonction pour générer le message dynamique
local function updateMsgFrameCombined()

  local totalPlayersInGroup = countGroupMembers()

  local totalGroupSize = 0

  local textWidth = msgTextDj:GetStringWidth()  -- Largeur du texte

  -- Segment des donjons ou raids sélectionnés
  local contentMessage = ""
  local selectedContent = {}

  -- Segment des rôles sélectionnés
  local selectedCountRoles = 0

  -- Comptage des rôles sélectionnés
  for _, role in pairs(selectedRoles) do
    selectedCountRoles = selectedCountRoles + 1
  end

  -- Segment des rôles
  local rolesSegmentFix = "Need "
  local rolesSegment = ""

  if selectedCountRoles == 3 then
    rolesSegment = "Need All"
  elseif selectedCountRoles > 0 then
    rolesSegment = rolesSegmentFix .. table.concat(selectedRoles, " & ")
  end

    -- Si un raid est sélectionné, utiliser les raids
  local selectedRaids = GetSelectedRaids()

  if table.getn(selectedRaids) > 0 then
    for _, raidAbrev in pairs(selectedRaids) do
        -- Rechercher le raid correspondant dans la table 'raids'
        for _, raid in pairs(raids) do
            if raid.abrev == raidAbrev then
                local raidMessage = ""
                raidMessage = raid.abrev
                table.insert(selectedContent, raidMessage)
                break
            end
        end
    end
  end

  -- Sinon, utiliser les donjons
  for _, donjonAbrev in pairs(selectedDungeons) do
      -- Rechercher le donjon correspondant dans la table 'donjons'
      for _, donjon in pairs(donjons) do
          if donjon.abrev == donjonAbrev then
              -- Vérifier que 'donjon.size' n'est pas nil avant de l'utiliser
              if donjon.size and totalPlayersInGroup then
                  totalGroupSize = donjon.size

                  -- Calcul du nombre de joueurs manquants pour chaque donjon
                  local missingPlayers = totalGroupSize - totalPlayersInGroup
                  if missingPlayers < 0 then
                      missingPlayers = 0
                      stopMessageBroadcast()
                  end

                  -- Générer le message pour ce donjon sous le format "LF M for Donjonselect"
                  local donjonMessage = ""
                  if missingPlayers > 0 then
                      donjonMessage = donjon.abrev
                  end

                  -- Ajouter le message pour ce donjon à la liste des contenus sélectionnés
                  table.insert(selectedContent, donjonMessage)
              else
                  -- Si 'donjon.size' est nil ou 'totalPlayersInGroup' est nil, afficher un message d'erreur
                  DEFAULT_CHAT_FRAME:AddMessage("Erreur : Invalid dungeon size or number of players for " .. donjon.abrev " " .. donjon.size)
              end
              break  -- Stopper la recherche dès qu'on a trouvé le bon donjon
          end
      end
  end

  -- Si aucun contenu n'est sélectionné, ne rien afficher
  if table.getn(selectedContent) == 0 and selectedCountRoles == 0 and userInputMessage == "" then
      combinedMessage = ""
      msgTextDj:SetText(combinedMessage)
      msgTextRaids:SetText(combinedMessage)
      return
  end

  -- Créer un message combiné pour chaque donjon
  if table.getn(selectedContent) > 0 then
      contentMessage = table.concat(selectedContent, ", ")
  end

  local mate = totalGroupSize - totalPlayersInGroup

  if mate == -totalGroupSize then
    mate = ""
  end

  if userInputMessage ~= "" then
    userInputMessage = userInputMessage
    msgTextDj:SetText("LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
    msgTextRaids:SetText("LFM " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
  else
    userInputMessage = ""
    msgTextDj:SetText("LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
    msgTextRaids:SetText("LFM " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
  end

  -- Combiner le message final
  combinedMessage = "LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " "
end



-- Fonction pour gérer le changement de texte
editBox:SetScript("OnTextChanged", function(self)
  -- print("Texte saisi : " .. this:GetText())  -- Afficher le texte dans la console
  userInputMessage = this:GetText()
      -- Vérifier si un message saisi existe
  if userInputMessage ~= "" then
      return updateMsgFrameCombined(userInputMessage)
  end
end)

AutoLFM:RegisterEvent("PARTY_MEMBERS_CHANGED")
AutoLFM:RegisterEvent("GROUP_ROSTER_UPDATE")

-- Fonction pour surveiller les changements dans le raid
local function OnRaidRosterUpdate()
  countRaidMembers()
  updateMsgFrameCombined()
end

local function OnGroupUpdate()
  countGroupMembers()
  updateMsgFrameCombined()
end

-- Ajouter un événement pour surveiller les changements dans le raid
AutoLFM:RegisterEvent("RAID_ROSTER_UPDATE")

AutoLFM:SetScript("OnEvent", function(self, event, ...)
  if "RAID_ROSTER_UPDATE" then
    OnRaidRosterUpdate()
  end
end)

AutoLFM:SetScript("OnEvent", function(self, event, ...)
  if "GROUP_ROSTER_UPDATE" then
      -- Si le groupe a changé, on arrête la diffusion du message
      OnGroupUpdate()
  end
end)

-- Fonction pour réinitialiser le message saisi
local function resetUserInputMessage()
  userInputMessage = ""  -- Réinitialiser le message saisi
  editBox:SetText(userInputMessage)  -- Mettre à jour l'EditBox
  updateMsgFrameCombined()
end

function GetCombinedMessage()
  return combinedMessage or {}
end

function GetSelectedRoles()
  return selectedRoles or {}
end

function GetSelectedDungeons()
  return selectedDungeons or {}
end

function GetSelectedRaids()
  return selectedRaids or {}
end


--------------------------- Role Fonction ---------------------------


-- -- Calculer la largeur totale nécessaire pour les icônes et l'espacement
local totalIconsWidth = 3 * iconWidth + 2 * iconSpacing

-- -- Calculer l'offset X pour centrer les icônes (centrer par rapport au `roleframe`)
local offsetX = (roleframe:GetWidth() - totalIconsWidth) / 2

-- -- Positionner les icônes
local offsetY = (roleframe:GetHeight() - iconHeight) / 2  -- Centrer verticalement


-- Créer l'icône Tank
local tankIcon = CreateFrame("Button", nil, roleframe)
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
local dpsIcon = CreateFrame("Button", nil, roleframe)
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
local healIcon = CreateFrame("Button", nil, roleframe)
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

-- Fonction pour récupérer les rôles sélectionnés
local function getSelectedRoles()
  return selectedRoles
end


-- Fonction pour désélectionner tous les rôles et vider la table selectedRoles
local function clearSelectedRoles()
    -- Vider la table selectedRoles
    selectedRoles = getSelectedRoles()

    if tankIcon.selected then
    -- Désélectionner l'icône Tank
      tankIcon.selected = false
      tankIcon:SetBackdrop(nil)  -- Retirer les bordures
      tankIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
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
    end

    if dpsIcon.selected then
    -- Désélectionner l'icône DPS
      dpsIcon.selected = false
      dpsIcon:SetBackdrop(nil)  -- Retirer les bordures
      dpsIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
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
    end

    if healIcon.selected then
    -- Désélectionner l'icône Heal
      healIcon.selected = false
      healIcon:SetBackdrop(nil)  -- Retirer les bordures
      healIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
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
    end
    -- Mettre à jour l'affichage après avoir désélectionné tous les rôles
end


--------------------------- Slider Frame ---------------------------


-- Valeur de pas fixe pour arrondir
local step = 10

-- Fonction pour arrondir la valeur du slider à l'étape la plus proche
local function SnapToStep(value)
    if value then
        local roundedValue = math.floor(value / step + 0.5) * step
        return roundedValue
    end
end

-- Variable pour stocker la valeur du slider
local sliderValue = 80

-- Créer une police pour afficher la valeur actuelle du slider (placer la valeur au-dessus du slider)
local valueText = slider:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
valueText:SetPoint("BOTTOM", slider, "TOP", 0, 5)
valueText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")

-- Mettre à jour la valeur du slider
sliderframe:SetScript("OnUpdate", function(self, elapsed)
  -- Récupérer la valeur actuelle du slider
  local currentValue = slider:GetValue()

  -- Arrondir la valeur à l'étape la plus proche
  local snappedValue = SnapToStep(currentValue)

  -- Appliquer la valeur arrondie au slider si nécessaire (au cas où la valeur serait flottante)
  if currentValue ~= snappedValue then
      slider:SetValue(snappedValue)
  end

  -- Mettre à jour dynamiquement le texte pour refléter la nouvelle valeur en temps réel
  valueText:SetText("Dispense every " .. slider:GetValue() .. " seconds")
end)


--------------------------- Donjon Fonction ---------------------------


-- Initialiser les tables si elles ne le sont pas déjà
donjonCheckButtons = donjonCheckButtons or {}
raidCheckButtons = raidCheckButtons or {}

-- Ajouter l'index à chaque donjon
for index, donjon in ipairs(donjons) do
  donjon.originalIndex = index
end

function calculer_priorite(niveau_joueur, donjon)
  local diff_min = niveau_joueur - donjon.lvl_min  -- Différence par rapport au niveau minimum du donjon
  local diff_max = niveau_joueur - donjon.lvl_max  -- Différence par rapport au niveau maximum du donjon

  local priority

  if diff_min > 7 then
      priority = 4  -- Gris : trop élevé, le joueur a plus de 7 niveaux au-dessus du donjon
  elseif diff_min >= 3 then
      priority = 1  -- Vert : adapté, joueur est à +2 niveaux du niveau minimum du donjon
  elseif diff_min >= 1 then
      priority = 2  -- Orange : légèrement en dessous, joueur à 1 niveau en dessous du niveau minimum
  elseif diff_min < 0 and math.abs(diff_min) > 5 then
      priority = 3  -- Rouge : trop faible, joueur a plus de 5 niveaux en dessous du donjon
  else
      priority = 3  -- Rouge : situation où le joueur est trop faible mais moins de 5 niveaux en dessous
  end

  return priority
end


-- Fonction pour afficher les donjons par code couleur avec le niveau du donjon
function DisplayDungeonsByColor()
  -- Effacer les précédents donjons affichés
  for _, child in ipairs({contentFrame:GetChildren()}) do
      child:Hide()
  end

  local playerLevel = UnitLevel("player")  -- Récupère le niveau du joueur
  local yOffset = 0  -- Position verticale pour les donjons
  local donjonCount = 0  -- Initialiser le compteur de donjons

  -- Créer une table de priorités pour organiser les donjons selon leur couleur
  local sortedDungeons = {}

  -- Ajouter une priorité pour chaque donjon
  for _, donjon in pairs(donjons) do
      if donjonCount >= maxDonjons then
          break
      end
      donjonCount = donjonCount + 1

      -- Utiliser la fonction calculer_priorite pour obtenir la priorité du donjon
      local priority = calculer_priorite(playerLevel, donjon)

      -- Ajouter le donjon à la table avec son index pour garder l'ordre d'origine
      table.insert(sortedDungeons, {donjon = donjon, priority = priority, originalIndex = donjon.originalIndex})
  end

  -- Tri par priorité (couleur)
  table.sort(sortedDungeons, function(a, b)
      if a.priority == b.priority then
          return a.originalIndex < b.originalIndex  -- Si la priorité est identique, trier par ordre d'apparition
      else
          return a.priority < b.priority  -- Sinon, trier par priorité de couleur (vert, rouge, gris)
      end
  end)

  -- Afficher les donjons dans l'ordre trié
  for _, entry in ipairs(sortedDungeons) do
      local donjon = entry.donjon
      local priority = entry.priority

      -- Créer une ligne cliquable qui englobe la case à cocher et les labels
      local clickableFrame = CreateFrame("Button", "ClickableDonjonFrame" .. donjon.abrev, contentFrame)
      clickableFrame:SetHeight(30)  -- Hauteur de la ligne
      clickableFrame:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -yOffset)
      clickableFrame:SetWidth(300)  -- Largeur de la ligne
      clickableFrame:SetScript("OnClick", function()
          -- Gestion de la sélection des donjons lorsqu'on clique sur la ligne
          local checkbox = donjonCheckButtons[donjon.abrev]
          checkbox:SetChecked(not checkbox:GetChecked())
          checkbox:GetScript("OnClick")()  -- Appeler la fonction OnClick déjà définie
      end)

      -- Créer la case à cocher à gauche du label
      local checkbox = CreateFrame("CheckButton", "DonjonCheckbox" .. donjon.abrev, clickableFrame, "UICheckButtonTemplate")
      checkbox:SetWidth(20)
      checkbox:SetHeight(20)
      checkbox:SetPoint("LEFT", clickableFrame, "LEFT", 0, 0)  -- Positionner la case à cocher à gauche

      local donjonAbrev = donjon.abrev
      donjonCheckButtons[donjonAbrev] = checkbox

      -- Créer un label pour afficher le niveau du donjon à droite de la case à cocher
      local levelLabel = clickableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      levelLabel:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
      levelLabel:SetText(donjon.lvl_min .. "-" .. donjon.lvl_max)

      -- Créer un label pour chaque donjon à droite du niveau du donjon
      local label = clickableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      label:SetPoint("LEFT", levelLabel, "RIGHT", 10, 0)

    -- Attribuer la couleur en fonction de la priorité calculée
    if priority == 4 then
      label:SetTextColor(0.5, 0.5, 0.5)  -- Gris (trop élevé)
    elseif priority == 1 then
      label:SetTextColor(0, 1, 0)  -- Vert (adapté ou légèrement en dessous)
    elseif priority == 2 then
      label:SetTextColor(1, 0.5, 0)  -- Orange (légèrement en dessous)
    else
      label:SetTextColor(1, 0, 0)  -- Rouge (trop faible)
    end


      label:SetText(donjon.nom)

      -- Ajouter la gestion de la sélection des donjons
      checkbox:SetScript("OnClick", function()
          local isChecked = checkbox:GetChecked()

          if isChecked then
              -- Vérifier si déjà 2 donjons sont sélectionnés
              if table.getn(selectedDungeons) >= 4 then
                  -- Retirer le premier élément sélectionné et décocher la case correspondante
                  local firstDonjonAbrev = selectedDungeons[1]  -- Récupérer l'abréviation du premier donjon
                  table.remove(selectedDungeons, 1)  -- Retirer le premier donjon
                  -- Décocher la case du premier donjon retiré
                  if donjonCheckButtons[firstDonjonAbrev] then
                      donjonCheckButtons[firstDonjonAbrev]:SetChecked(false)
                  end
              end
              -- Ajouter le nouveau donjon sélectionné à la liste
              table.insert(selectedDungeons, donjonAbrev)
          else
              -- Si la case est décochée, retirer l'abréviation du donjon de la liste
              for i, value in pairs(selectedDungeons) do
                  if value == donjonAbrev then
                      table.remove(selectedDungeons, i)
                      -- Après avoir retiré l'élément de la liste, décocher la case
                      checkbox:SetChecked(false)
                      break
                  end
              end
          end
          updateMsgFrameCombined()  -- Mettre à jour l'affichage
      end)
      yOffset = yOffset + 30
  end
end

-- Fonction pour effacer les donjons sélectionnés
function clearSelectedDungeons()
  -- Décoche toutes les cases des donjons
  for _, donjonCheckbox in pairs(donjonCheckButtons) do
      donjonCheckbox:SetChecked(false)
  end
  selectedDungeons = {}
end


--------------------------- Raids Fonctions ---------------------------

--------------------------- SLIDER DE TAILLE ---------------------------

-- -- Créer le cadre du slider
-- local sliderSizeFrame = CreateFrame("Frame", nil, AutoLFM)
-- sliderSizeFrame:SetBackdrop({
--     bgFile = nil,
--     -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
--     edgeSize = 16,  -- Taille de la bordure
--     insets = { left = 4, right = 2, top = 4, bottom = 4 },
-- })
-- sliderSizeFrame:SetBackdropColor(1, 1, 1, 0.3)
-- sliderSizeFrame:SetBackdropBorderColor(1, 1, 1, 1)

-- sliderSizeFrame:SetWidth(raidFrame:GetWidth())  -- Utiliser raidFrame si roleframe est nil
-- sliderSizeFrame:SetHeight(50)
-- sliderSizeFrame:SetPoint("TOPRIGHT", raidFrame, "BOTTOMRIGHT", 0, -40)

-- sliderSizeFrame:Hide()

-- -- Créer le slider
-- local sliderSize = CreateFrame("Slider", nil, sliderSizeFrame, "OptionsSliderTemplate")
-- sliderSize:SetWidth(200)
-- sliderSize:SetHeight(20)
-- sliderSize:SetPoint("CENTER", sliderSizeFrame, "CENTER", 0, 0)

-- -- Initialiser la valeur
-- sliderSize:SetValueStep(1)  -- Pas de valeur du slider
-- sliderSize:Hide()

-- -- Définir le texte du slider
-- local sliderValueText = sliderSizeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
-- sliderValueText:SetPoint("CENTER", sliderSize, "TOP", 0, 10)


--------------------------- VARIABLES ET INITIATION ---------------------------

-- Nombre maximum de raids à afficher
local raidCount = 0
local maxRaids = 100

-- Créer le contenu du ScrollFrame pour les raids
local raidContentFrame = CreateFrame("Frame", nil, raidFrame)
raidContentFrame:SetWidth(raidFrame:GetWidth() - 20)
raidContentFrame:SetHeight(raidFrame:GetHeight() - 60)
raidContentFrame:SetPoint("TOPLEFT", raidFrame, "TOPLEFT", 10, -40)

raidCheckButtons = {}

--------------------------- CRÉATION DES CASES À COCHER ---------------------------

-- Fonction pour créer et gérer les cases à cocher des raids
for index, raid in pairs(raids) do
    -- Incrémenter le nombre de raids
    raidCount = raidCount + 1
    if raidCount >= maxRaids then
        break
    end

    -- Initialisation des valeurs des tailles (fallback sur 0 si nil)


    -- Créer le cadre cliquable qui englobe la case à cocher et le label
    local clickableFrame = CreateFrame("Button", "ClickableRaidFrame" .. index, raidContentFrame)
    clickableFrame:SetHeight(30)  -- Hauteur de la ligne
    clickableFrame:SetPoint("TOPLEFT", raidContentFrame, "TOPLEFT", 0, -(30 * (index - 1)))
    clickableFrame:SetWidth(raidContentFrame:GetWidth())  -- Largeur de la ligne

    -- Capturer l'abréviation du raid localement
    local raidAbrev = raid.abrev
    local raidName = raid.nom
    -- local sizeMin = raid.size_min
    -- local sizeMax = raid.size_max


    -- Créer la case à cocher pour chaque raid
    local checkbox = CreateFrame("CheckButton", "RaidCheckbox" .. index, clickableFrame, "UICheckButtonTemplate")
    checkbox:SetWidth(20)
    checkbox:SetHeight(20)
    checkbox:SetPoint("LEFT", clickableFrame, "LEFT", 0, 0)  -- Positionner la case à cocher à gauche

    -- Créer le label pour chaque raid
    local label = clickableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
    label:SetText(raidName)

    -- Ajouter la case à cocher dans la table raidCheckButtons
    raidCheckButtons[raidAbrev] = checkbox

    -- Ajouter la gestion de la sélection des raids
    checkbox:SetScript("OnClick", function()
        -- Si la case est cochée, désélectionner toutes les autres cases
        if checkbox:GetChecked() then
            -- Désélectionner toutes les autres cases à cocher de raid
            for _, otherCheckbox in pairs(raidCheckButtons) do
                if otherCheckbox ~= checkbox then
                    otherCheckbox:SetChecked(false)
                end
            end
            -- Ajouter le raid sélectionné à la liste
            selectedRaids = {raidAbrev}
            -- name = raidName
            -- sizeMin = sizeMin
            -- sizeMax = sizeMax
            -- -- Mettre à jour le slider avec les nouvelles valeurs
            -- raid = {name, sizeMin, sizeMax}
            -- updateSliderForSelectedRaid(raid, sizeMin, sizeMax)
        else
            -- Si la case est décochée, retirer l'abréviation du raid de la liste
            selectedRaids = {}
            -- sliderSizeFrame:Hide()
        end
        -- Mettre à jour l'affichage après chaque changement
        updateMsgFrameCombined()
    end)

    -- Ajouter la gestion du clic sur la ligne entière (le cadre cliquable)
    clickableFrame:SetScript("OnClick", function()
        -- Lorsque la ligne entière est cliquée, basculer la sélection de la case à cocher
        checkbox:SetChecked(not checkbox:GetChecked())
        checkbox:GetScript("OnClick")()  -- Appeler la fonction OnClick déjà définie
    end)
end



--------------------------- FONCTIONS DE MISE À JOUR ---------------------------


-- -- Fonction pour mettre à jour le slider en fonction du raid sélectionné
-- function updateSliderForSelectedRaid(raid, sizeMin, sizeMax)
--   sliderSizeFrame:Show()
--   sliderSize:Show()

--   sizeMin = sizeMin
--   sizeMax = sizeMax

--   -- Vérification si `raid` est défini
--   if raid and sizeMin and sizeMax then
--     local sizeMidle = (sizeMax / 2)
--       -- Debug : afficher les valeurs min et max dans le chat
--       DEFAULT_CHAT_FRAME:AddMessage("Raid = " .. name .. " | Size : " .. sizeMin .. " & " .. sizeMax .. " | middle at : " .. sizeMidle .. "")


--       -- Mettre à jour les valeurs min et max du slider
--       sliderSize:SetMinMaxValues(sizeMin, sizeMax)
--       sliderSize:SetValue(sizeMidle)  -- Valeur initiale au milieu de size_min et size_max

--       -- Mettre à jour le texte du slider
--       sliderValueText:SetText(string.format("Min: %d / Max: %d", sizeMin, sizeMax))
--   else
--       DEFAULT_CHAT_FRAME:AddMessage("Erreur : Raid invalide.")
--   end
-- end

-- -- Assurez-vous que `selectedRaid` est initialisé avec une valeur valide
-- if not selectedRaid then
--   selectedRaid = raids[1]  -- Utiliser le premier raid si aucun raid n'est sélectionné
-- end

-- updateSliderForSelectedRaid(selectedRaid)

-- -- Afficher le slider
-- sliderSizeFrame:Hide()


--------------------------- FONCTIONS SUPPLÉMENTAIRES ---------------------------

-- Fonction pour effacer les raids sélectionnés
function clearSelectedRaids()
    -- Décoche toutes les cases des raids
    for _, raidCheckbox in pairs(raidCheckButtons) do
        raidCheckbox:SetChecked(false)
    end
    selectedRaids = {}
    -- sliderSizeFrame:Hide()  -- Masquer le slider
end


--------------------------- Swap Bouton ---------------------------


local swapButton = CreateFrame("Button", nil, AutoLFM, "OptionsButtonTemplate")
swapButton:SetText("Raids List")
swapButton:SetWidth(200)
swapButton:SetHeight(25)
swapButton:SetPoint("BOTTOM", djScrollFrame, "TOP", 0, 10)
swapButton:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})

--- Action lorsque le bouton est cliqué ---
swapButton:SetScript("OnClick", function()
    -- Si les donjons et les raids sont vides, basculer entre les vues
    if djScrollFrame:IsShown() then
        -- Cacher les donjons et afficher les raids
        djScrollFrame:Hide()
        swapButton:SetText("Dungeons List")
        raidFrame:Show()
        raidContentFrame:Show()
        msgFrameDj:Hide()
        msgFrameRaids:Show()
        clearSelectedDungeons()
        clearSelectedRoles()
        resetUserInputMessage()
        updateMsgFrameCombined()
    else
        -- Cacher les raids et afficher les donjons
        swapButton:SetText("Raids List")
        djScrollFrame:Show()
        msgFrameRaids:Hide()
        raidContentFrame:Hide()
        raidFrame:Hide()
        msgFrameDj:Show()
        clearSelectedRaids()
        clearSelectedRoles()
        resetUserInputMessage()
        updateMsgFrameCombined()
        -- sliderSizeFrame:Hide()
    end
end)


--------------------------- Broadcast Fonction ---------------------------


-- Variables pour gérer l'intervalle et la diffusion du message
local isBroadcasting = false
local broadcastStartTime = 0
local lastBroadcastTime = 0

-- Fonction pour arrêter la diffusion du message
local function stopMessageBroadcast()
    isBroadcasting = false
    print("Broadcast stopped")
end

-- Fonction pour démarrer la diffusion du message
local function startMessageBroadcast()
    -- Vérifier si combinedMessage est vide avant de démarrer la diffusion
    if combinedMessage == "" or combinedMessage == " " then
        print("The LFM message is empty. The broadcast cannot begin.")
        return
    end

    isBroadcasting = true
    broadcastStartTime = GetTime()
    print("Broadcast started.")

    -- Diffuser immédiatement le message dès le démarrage
    sendMessageToChannels(combinedMessage)
end

-- Frame d'update pour gérer le délai entre chaque diffusion
local broadcastFrame = CreateFrame("Frame")

broadcastFrame:SetScript("OnUpdate", function(self, elapsed)
  if isBroadcasting then
      -- Mettre à jour la valeur de l'intervalle du slider
      local sliderValue = slider:GetValue()

      -- Vérifier si le temps écoulé est supérieur ou égal à l'intervalle du slider
      local timeElapsed = GetTime() - broadcastStartTime

      -- Calculer la moitié de la valeur du slider
      local halfSliderValue = sliderValue / 2
      local oneSecondBefore = sliderValue

      -- Afficher un message une seule fois pour chaque niveau du décompte
      if not broadcastedHalf and timeElapsed >= halfSliderValue and timeElapsed < halfSliderValue + 1 then
          -- Message à la moitié du temps
          DEFAULT_CHAT_FRAME:AddMessage("Rediffusion in " .. math.floor(halfSliderValue) .. " seconds", 0, 1, 1)
          broadcastedHalf = true  -- Marquer comme diffusé une fois
      end

      if not broadcastedOneSecBefore and timeElapsed >= oneSecondBefore and timeElapsed < oneSecondBefore + 1 then
          -- Message 1 seconde avant la diffusion
          DEFAULT_CHAT_FRAME:AddMessage("Rediffusion of Message", 0, 1, 1)
          broadcastedOneSecBefore = true  -- Marquer comme diffusé une fois
      end

      -- Une fois le temps écoulé, envoyer le message
      if timeElapsed >= sliderValue then
          -- Diffuser le message
          if combinedMessage ~= "" then
              sendMessageToChannels(combinedMessage)
          end

          -- Réinitialiser le temps pour la prochaine diffusion
          broadcastStartTime = GetTime()

          -- Réinitialiser les drapeaux
          broadcastedHalf = false
          broadcastedOneSecBefore = false
      end
  end
end)

--------------------------- Toggle Bouton ---------------------------


-- Créer un bouton Toggle en dessous de msgFrame, centré par rapport à AutoLFM
local toggleButton = CreateFrame("Button", "ToggleButton", msgFrame, "UIPanelButtonTemplate")
toggleButton:SetWidth(120)
toggleButton:SetHeight(30)

-- Positionner le bouton en bas centré, sous roleframe et msgFrame par rapport a autolfm
toggleButton:SetPoint("CENTER", msgFrame, "CENTER", 0, -10)  -- Placer 10 pixels sous msgFrame
toggleButton:SetPoint("BOTTOM", AutoLFM, 0, 20)

toggleButton:SetText("Start")

-- Fonction pour gérer le changement d'état du bouton et démarrer/arrêter la diffusion
toggleButton:SetScript("OnClick", function()
    -- Vérifier si le message combiné est vide ou ne contient que des espaces
    if combinedMessage == " " or combinedMessage == "" then
        -- Si le message est vide, ne pas démarrer la diffusion et vider la variable
        combinedMessage = ""
        toggleButton:SetText("Start")
        print("The message is empty. The broadcast cannot start.")
        return
    end

    if isBroadcasting then
      stopMessageBroadcast()
      toggleButton:SetText("Start")
    else
      startMessageBroadcast()
      toggleButton:SetText("Stop")
    end
end)


--------------------- Commandes Slash pour l'addon ---------------------


-- Définir les slash commandes
SLASH_LFM1 = "/lfm"
SLASH_LFM3 = "/lfm help"
SLASH_LFM5 = "/lfm minimap show"
SLASH_LFM6 = "/lfm minimap hide"

-- Fonction principale des commandes Slash
SlashCmdList["LFM"] = function(msg)
    -- Séparer le message en argument
    local args = strsplit(" ", msg)

    -- Afficher les commandes disponibles
    if args[1] == "help" then
        -- Afficher les commandes disponibles dans le chat avec des couleurs
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff00Available commands :")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFF /lfm  |cffFFFFFFOpens AutoLFM window.")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFF /lfm help   |cffFFFFFFDisplays all available orders.")  -- Bleu clair pour la commande et blanc pour l'explication
        DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFF /lfm minimap show   |cffFFFFFFDisplays the minimap button.")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFF /lfm minimap hide   |cffFFFFFFHide minimap button.")
        return
    end

    -- Commande pour ouvrir la fenêtre AutoLFM
    if args[1] == "" or args[1] == "open" then
        if AutoLFM then
            if AutoLFM:IsVisible() then
                AutoLFM:Hide()  -- Si la fenêtre est visible, la cacher
            else
                AutoLFM:Show()  -- Si la fenêtre est cachée, l'afficher
            end
        end
        return
    end

    -- Commande pour afficher le bouton de la minimap
    if args[1] == "minimap" and args[2] == "show" then
      -- Vérifier si le bouton de la minimap existe et s'il est caché
      if AutoLFMMinimapButton then
          -- Réinitialiser les configurations du bouton de la minimap (par exemple, réinitialiser la position)
          AutoLFMMinimapBtn:SetWidth(25)  -- Taille du bouton
          AutoLFMMinimapBtn:SetHeight(25)  -- Taille du bouton
          AutoLFMMinimapBtn:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -5, -5)  -- Positionner le bouton

          -- Afficher le bouton de la minimap
          AutoLFMMinimapButton:Show()

          DEFAULT_CHAT_FRAME:AddMessage("The minimap button has been redisplayed and reset.", 0.0, 1.0, 0.0)  -- Texte vert
      else
          DEFAULT_CHAT_FRAME:AddMessage("The minimap button is already visible.", 1.0, 0.0, 0.0)  -- Texte rouge
      end
      return
    end

        -- Commande pour masquer le bouton de la minimap
    if args[1] == "minimap" and args[2] == "hide" then
        -- Vérifier si le bouton de la minimap existe et est visible
        if AutoLFMMinimapButton and AutoLFMMinimapButton:IsVisible() then
            AutoLFMMinimapButton:Hide()  -- Masquer le bouton
            DEFAULT_CHAT_FRAME:AddMessage("The minimap button has been hidden.", 0.0, 1.0, 0.0)  -- Texte vert
        else
            DEFAULT_CHAT_FRAME:AddMessage("The minimap button is already hidden.", 1.0, 0.0, 0.0)  -- Texte rouge
        end
        return
    end

    -- Si la commande est incorrecte
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000 ! Usage !   |cff00FFFF/lfm help |cffFFFFFFto list all commands.")  -- Rouge
end

AutoLFM:Hide()
