-- Variables
local selectedDungeons = {}
local selectedRaids = {}
local selectedRoles = {}
local selectedChannels = {}
local combinedMessage = ""

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
    { nom = "Karazhan Crypt", abrev = "Kara Crypt", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
    { nom = "Stratholme UD 5", abrev = "Strat UD 5", size = 5, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
    { nom = "Stratholme UD 10", abrev = "Strat UD 10", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
    { nom = "Caverns of Time. Black Morass", abrev = "BT", size = 5, lvl = "60", lvl_min = 60, lvl_max = 60 },
    { nom = "Stormwind Vault", abrev = "SWV", size = 5, lvl = "60", lvl_min = 60, lvl_max = 60 },
    { nom = "Upper Blackrock Spire", abrev = "UBRS", size = 10, lvl = "58-60", lvl_min = 58, lvl_max = 60 },
}

-- Ajouter l'index à chaque donjon
for index, donjon in ipairs(donjons) do
    donjon.originalIndex = index
end

local raids = {
    { nom = "Zul'Gurub", abrev = "ZG", size = 20 },
    { nom = "Ruins of Ahn'Qiraj", abrev = "AQ20", size = 20 },
    { nom = "Molten Core", abrev = "MC", size = 40 },
    { nom = "Onyxia's Lair", abrev = "Ony", size = 40 },
    { nom = "Lower Karazhan Halls", abrev = "Kara10",  size = 10 },
    { nom = "Blackwing Lair", abrev = "BWL", size = 40 },
    { nom = "Emerald Sanctum", abrev = "ES", size = 40},
    { nom = "Temple of Ahn'Qiraj", abrev = "AQ40", size = 40 },
    { nom = "Naxxramas", abrev = "Naxx", size = 40 },
}

-- Liste des rôles possibles
local allRoles = {
    "Tank",
    "Healer",
    "DPS"
}

-- Initialiser les tables si elles ne le sont pas déjà
donjonCheckButtons = donjonCheckButtons or {}
raidCheckButtons = raidCheckButtons or {}

-- Initialisation des variables
local donjonCount = 0
local maxDonjons = 100

-- Nombre maximum de donjons à afficher
for _, donjon in pairs(donjons) do
    if donjonCount >= maxDonjons then
        break
    end
    donjonCount = donjonCount + 1
end


--------------------------- Fonction Divers ---------------------------


-- Fonction pour compter manuellement les éléments dans une table
local function countTableEntries(t)
    local count = 0
    for _, _ in pairs(t) do
        count = count + 1
    end
    return count
end

-- Fonction pour vérifier si la table est vide
local function isTableEmpty(t)
    for _, _ in pairs(t) do
        return false
    end
    return true
end

-- Fonction pour compter les rôles sélectionnés
local function countSelectedRoles(selectedRoles)
    local count = 0
    for _, _ in pairs(selectedRoles) do
        count = count + 1
    end
    return count
end

local function countSelectedDungeons(selectedDungeons)
    local count = 0
    for _, _ in pairs(selectedDungeons) do
        count = count + 1
    end
    return count
end

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


--------------------------- Interface ---------------------------

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
    insets = { left = 11, right = 12, top = 11, bottom = 12 },
})

-- Créer un titre du cadre
local title = CreateFrame("Frame", nil, AutoLFM)
title:SetPoint("BOTTOM", AutoLFM, "TOP", 0, 1)
title:SetWidth(200)
title:SetHeight(40)
title:SetMovable(true)
title:EnableMouse(true)
title:RegisterForDrag("LeftButton")

title:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
})
title:SetBackdropBorderColor(0, 0, 0, 1)



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
closeButton:SetPoint("TOPRIGHT", AutoLFM, "TOPRIGHT", 10, 10)

-- Appliquer une forme ronde au bouton avec une bordure
closeButton:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
closeButton:SetBackdropColor(0, 0, 0, 1)
closeButton:SetBackdropBorderColor(0, 0, 0, 1)

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
end)

closeButton:SetScript("OnLeave", function(self)
    this:SetBackdropBorderColor(0, 0, 0, 1)
end)


--------------------------- Frames ---------------------------


-- Créer cadre djframe
local djframe = CreateFrame("Frame", nil, AutoLFM)
djframe:SetWidth(265)
djframe:SetHeight(380)
djframe:SetPoint("TOPLEFT", AutoLFM, "TOPLEFT", 10, -10)
djframe:SetBackdrop({
    edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
})
djframe:Hide()

local djScrollFrame = CreateFrame("ScrollFrame", "AutoLFM_ScrollFrame_Dungeons", djframe, "UIPanelScrollFrameTemplate")
djScrollFrame:SetPoint("TOPLEFT", djframe, "TOPLEFT", 10, -40)
djScrollFrame:SetWidth(265)
djScrollFrame:SetHeight(330)
djScrollFrame:Hide()

-- Créer le contenu du ScrollFrame pour les donjons
local contentFrame = CreateFrame("Frame", nil, djScrollFrame)
contentFrame:SetWidth(250)
contentFrame:SetHeight(donjonCount * 30)  -- Hauteur dynamique basée sur le nombre de donjons
djScrollFrame:SetScrollChild(contentFrame)
contentFrame:Show()


-- Créer cadre raidFrame
local raidFrame = CreateFrame("Frame", nil, AutoLFM)
raidFrame:SetWidth(240)
raidFrame:SetHeight(380)
raidFrame:SetPoint("TOPLEFT", AutoLFM, "TOPLEFT", 10, -10)
raidFrame:SetBackdrop({
    edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
})
raidFrame:Hide()

local raidScrollFrame = CreateFrame("ScrollFrame", "AutoLFM_ScrollFrame_Raids", raidFrame, "UIPanelScrollFrameTemplate")
raidScrollFrame:SetPoint("TOPLEFT", raidFrame, "TOPLEFT", 10, -40)
raidScrollFrame:SetWidth(265)
raidScrollFrame:SetHeight(330)
raidScrollFrame:Hide()


-- Créer cadre roleframe
local roleframe = CreateFrame("Frame", nil, AutoLFM)
roleframe:SetBackdrop({
    bgFile = nil,
    -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
roleframe:SetBackdropColor(1, 1, 1, 0.3)
roleframe:SetBackdropBorderColor(1, 1, 1, 1)

-- Positionner le roleframe
roleframe:SetWidth(AutoLFM:GetWidth() * 0.4)
roleframe:SetHeight(AutoLFM:GetHeight() * 0.2)
roleframe:SetPoint("TOPRIGHT", AutoLFM, "TOPRIGHT", -50, -40)

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

-- Calculer la largeur totale nécessaire pour les icônes et l'espacement
local totalIconsWidth = 3 * iconWidth + 2 * iconSpacing

-- Calculer l'offset X pour centrer les icônes (centrer par rapport au `roleframe`)
local offsetX = (roleframe:GetWidth() - totalIconsWidth) / 2

-- Positionner les icônes
local offsetY = (roleframe:GetHeight() - iconHeight) / 2  -- Centrer verticalement


-- Créer cadre msgFrame
local msgFrame = CreateFrame("Frame", nil, AutoLFM)
msgFrame:SetBackdrop({
    bgFile = nil,
    -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
    edgeSize = 16,  -- Taille de la bordure
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
msgFrame:SetBackdropColor(1, 1, 1, 0.3)
msgFrame:SetBackdropBorderColor(1, 1, 1, 1)

-- Positionner le cadre msgFrame juste en dessous de roleframe
msgFrame:SetWidth(roleframe:GetWidth())
msgFrame:SetHeight(roleframe:GetHeight() + 20)
msgFrame:SetPoint("TOPRIGHT", roleframe, "BOTTOMRIGHT", 0, -5)


-- Créer un FontString dans msgFrame pour afficher le message
local msgText = msgFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
msgText:SetPoint("CENTER", msgFrame, "CENTER")
msgText:SetTextColor(1, 1, 1)
msgText:SetJustifyH("CENTER")
msgText:SetJustifyV("CENTER")
msgText:SetWidth(msgFrame:GetWidth())


-- Créer une zone de saisie de texte en bas de msgFrame
local editBox = CreateFrame("EditBox", "MonAddonEditBox", msgFrame)
editBox:SetPoint("BOTTOM", msgFrame, "BOTTOM", 0, -50)  -- Positionner en bas, avec un écart de 10 pixels du bas du cadre

-- Définir les propriétés de la zone de texte sans spécifier la taille
editBox:SetAutoFocus(false)  -- Empêcher le focus automatique
editBox:SetFontObject(GameFontNormal)  -- Police de texte normale
editBox:SetMaxLetters(100)  -- Limiter le nombre de caractères
editBox:SetText("")  -- Texte initial (vide)

-- Adapter la largeur de la zone de texte à la largeur de msgFrame moins une marge (pour éviter que le texte soit collé aux bords)
editBox:SetWidth(msgFrame:GetWidth() - 40)  -- Largeur légèrement réduite par rapport à msgFrame

-- Définir une hauteur fixe pour la zone de saisie (sans SetSize)
editBox:SetHeight(22)  -- Hauteur fixe de la zone de saisie


-- Créer un texte pour afficher un tiret centré au-dessus de la zone de saisie
local dashText = msgFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
dashText:SetPoint("BOTTOM", editBox, "TOP", 0, 5)  -- Placer au-dessus de editBox avec un écart de 5 pixels
dashText:SetText("Add details (optional)")  -- Le texte du tiret

-- Personnaliser l'apparence du tiret (par exemple, couleur et taille de police)
dashText:SetFontObject(GameFontNormal)  -- Utiliser la police de texte normale
dashText:SetTextColor(1, 1, 1, 1)  -- Couleur blanche pour le tiret


-- Optionnel : ajouter un fond à la zone de saisie pour la rendre plus visible
editBox:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 5,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
editBox:SetBackdropColor(0, 0, 0, 0.7)  -- Fond légèrement transparent
editBox:SetBackdropBorderColor(1, 1, 1, 1)  -- Bordure blanche


-- Créer cadre sliderframe
local sliderframe = CreateFrame("Frame", nil, AutoLFM)
sliderframe:SetBackdrop({
    bgFile = nil,
    -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",  -- Bordure blanche dev position
    edgeSize = 16,  -- Taille de la bordure
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
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
slider:SetValue(70)
slider:SetValueStep(10)


-- Fonction pour gérer l'événement PLAYER_ENTERING_WORLD
local function OnPlayerEnteringWorld(self, event)

-- Segments de texte avec leurs couleurs RGB
local seg1 = "|cff00FF00Auto "  -- "Auto" en vert (0.0, 1.0, 0.0)
local seg2 = "|cff0070DDL"      -- "L" en Bleu (0.0, 0.0, 1.0)
local seg3 = "|cffffffffF"     -- "F" en vert (0.0, 1.0, 0.0)
local seg4 = "|cffff0000M "     -- "M" en rouge (1.0, 0.0, 0.0)
local seg5 = "|cff00FF00properly load "  -- "properly load" en blanc (1.0, 1.0, 1.0)
local seg6 = "|cff00FFFF/lfm help "  -- "/lfm" en rouge (1.0, 0.0, 0.0)
local seg7 = "|cff00FF00for more information"  -- "help for more information" en blanc (1.0, 1.0, 1.0)

-- Concaténation des segments et envoi du message complet
DEFAULT_CHAT_FRAME:AddMessage(seg1 .. seg2 .. seg3 .. seg4 .. seg5 .. seg6 .. seg7)
    -- Afficher les donjons
    DisplayDungeonsByColor()

    -- Masquer le cadre de chargement une fois les donjons colorés
    if dungeonsColored then
        loadingFrame:Hide()  -- Masquer le cadre de chargement une fois les donjons colorés
    end

    -- Désenregistrer cet événement une fois qu'il est traité
    this:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

-- Enregistrer l'événement PLAYER_ENTERING_WORLD
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", OnPlayerEnteringWorld)

-- Créer un cadre de chargement personnalisé
local loadingFrame = CreateFrame("Frame", nil, UIParent)
loadingFrame:SetWidth(200)  -- Largeur du cadre
loadingFrame:SetHeight(100)  -- Hauteur du cadre
loadingFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)  -- Positionner au centre de l'écran

-- Ajouter un texte de chargement
local loadingText = loadingFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
loadingText:SetPoint("CENTER", loadingFrame, "CENTER", 0, 0)  -- Placer le texte au centre du cadre
loadingText:SetText("Chargement des donjons...")

-- Afficher le cadre immédiatement
loadingFrame:Show()

-- Variable pour suivre si les donjons sont colorés
local dungeonsColored = false

--------------------------- Init ---------------------------

AutoLFM:RegisterEvent("PARTY_MEMBERS_CHANGED")

djframe:Show()
djScrollFrame:Show()


--------------------------- Msg Dynamique ---------------------------


-- Fonction pour obtenir la taille d'une table
local function getTableSize(tbl)
    local size = 0
    for _, _ in pairs(tbl) do
        size = size + 1
    end
    return size
end

local combinedMessage  = ""
local userInputMessage = ""


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
    local textWidth = msgText:GetStringWidth()  -- Largeur du texte


    -- Segment des rôles sélectionnés
    local selectedRoles = selectedRoles
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

    -- Segment des donjons ou raids sélectionnés
    local contentMessage = ""
    local selectedContent = {}

    -- Si un raid est sélectionné, utiliser les raids
    local selectedRaids = GetSelectedRaids()
    if table.getn(selectedRaids) > 0 then

        for _, raidAbrev in pairs(selectedRaids) do
            -- Rechercher le raid correspondant dans la table 'raids'
            for _, raid in pairs(raids) do
                if raid.abrev == raidAbrev then
                    -- Mettre à jour la taille du groupe en fonction du raid sélectionné
                    totalGroupSize = raid.size

                    -- Calcul du nombre de joueurs manquants pour chaque raid
                    local missingPlayers = totalGroupSize - totalPlayersInGroup
                    if missingPlayers < 0 then
                        missingPlayers = 0
                        stopMessageBroadcast()
                    end

                    -- Générer le message pour ce raid sous le format "LF M for Raidselect"
                    local raidMessage = ""
                    if missingPlayers > 0 then
                        raidMessage = raid.abrev
                    end

                    -- Ajouter le message pour ce raid à la liste des contenus sélectionnés
                    table.insert(selectedContent, raidMessage)
                    break
                end
            end
        end
    else

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
    end

    -- Si aucun contenu n'est sélectionné, ne rien afficher
    if table.getn(selectedContent) == 0 and selectedCountRoles == 0 and userInputMessage == "" then
        combinedMessage = ""
        msgText:SetText(combinedMessage)
        return
    end

    -- Créer un message combiné pour chaque donjon
    if table.getn(selectedContent) > 0 then
        contentMessage = table.concat(selectedContent, ", ")
    end

    local mate = totalGroupSize - totalPlayersInGroup

    if mate == -totalPlayersInGroup then
      mate = ""
    end

    if userInputMessage ~= "" then
      userInputMessage = userInputMessage
      msgText:SetText("LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
    else
      userInputMessage = ""
      msgText:SetText("LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " ")
    end

    -- Combiner le message final
    combinedMessage = "LF" .. mate .. "M " .. contentMessage .. " " .. rolesSegment .. " " .. userInputMessage .. " "

end

-- Fonction pour réinitialiser le message saisi
local function resetUserInputMessage()
    userInputMessage = ""  -- Réinitialiser le message saisi
    editBox:SetText(userInputMessage)  -- Mettre à jour l'EditBox
    updateMsgFrameCombined()
end

-- Fonction pour récupérer les donjons sélectionnés
function GetSelectedDungeons()
    return selectedDungeons or {}
end

-- Fonction pour récupérer les raids sélectionnés
function GetSelectedRaids()
    return selectedRaids or {}
end

function GetCombinedMessage()
    return combinedMessage or {}
end


--------------------------- Donjon Fonction ---------------------------


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



-- Tester pour chaque niveau de 1 à 60 et chaque donjon
for niveau_joueur = 1, 60 do
  for _, donjon in ipairs(donjons) do
      local priority = calculer_priorite(niveau_joueur, donjon)
      -- print("Joueur niveau " .. niveau_joueur .. " - Donjon: " .. donjon.nom .. " - Priorité: " .. priority)
  end
end

-- Fonction pour vérifier si un élément est présent dans la table
local function tableContains(table, element)
    return table[element] ~= nil  -- Vérification optimisée
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
          clearSelectedRaids()
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

          updateMsgFrameCombined()  -- Mettre à jour l'affichage sans rappeler DisplayDungeonsByColor
      end)

      dungeonsColored = true

      -- Vérifier si les donjons sont colorés, et masquer le cadre
      if dungeonsColored then
          loadingFrame:Hide()  -- Masquer le cadre de chargement
      end

      yOffset = yOffset + 30
  end
end


-- Fonction utilitaire pour vérifier si une table contient un élément
function table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Fonction pour effacer les raids sélectionnés
function clearSelectedRaids()
    -- Décoche toutes les cases des raids
    for _, raidCheckbox in pairs(raidCheckButtons) do
        raidCheckbox:SetChecked(false)
    end
    selectedRaids = {}
end

-- Créer un événement Frame pour écouter les événements du jeu
local eventFrame = CreateFrame("Frame")

-- Enregistrer l'événement pour le joueur se connectant
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnPlayerLogin()
    end
end)

-- Afficher les donjons au lancement
local function OnPlayerLogin()
    -- Réinitialiser et afficher les donjons
    DisplayDungeonsByColor()
    AutoLFM:Hide()
    AutoLFM:Show()
end


--------------------------- Raids Fonctions ---------------------------


local raidCount = 0
local maxRaids = 100

-- Nombre maximum de raids à afficher
for _, raid in pairs(raids) do
    raidCount = raidCount + 1
    if raidCount >= maxRaids then
        break
    end
end

-- Créer le contenu du ScrollFrame pour les raids
local raidContentFrame = CreateFrame("Frame", nil, raidScrollFrame)
raidContentFrame:SetWidth(200)
raidContentFrame:SetHeight(raidCount * 30)
raidScrollFrame:SetScrollChild(raidContentFrame)

raidCheckButtons = {}

-- Créer des cases à cocher pour chaque raid (similaire aux donjons)
for index, raid in pairs(raids) do
  -- Créer un cadre cliquable qui englobe la case à cocher et le label
  local clickableFrame = CreateFrame("Button", "ClickableRaidFrame" .. index, raidContentFrame)
  clickableFrame:SetHeight(30)  -- Hauteur de la ligne
  clickableFrame:SetPoint("TOPLEFT", raidContentFrame, "TOPLEFT", 0, -(30 * (index - 1)))
  clickableFrame:SetWidth(300)  -- Largeur de la ligne

  -- Capturer l'abréviation du raid localement
  local raidAbrev = raid.abrev

  -- Créer la case à cocher pour chaque raid
  local checkbox = CreateFrame("CheckButton", "RaidCheckbox" .. index, clickableFrame, "UICheckButtonTemplate")
  checkbox:SetWidth(20)
  checkbox:SetHeight(20)
  checkbox:SetPoint("LEFT", clickableFrame, "LEFT", 0, 0)  -- Positionner la case à cocher à gauche

  -- Créer le label pour chaque raid
  local label = clickableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
  label:SetText(raid.nom)

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

          -- Ajouter l'abréviation du raid à la liste des raids sélectionnés
          if not tableContains(selectedRaids, raidAbrev) then
              selectedRaids = {raidAbrev}
          end
      else
          -- Si la case est décochée, retirer l'abréviation du raid de la liste
          selectedRaids = {}
      end

      -- Lorsque des raids sont sélectionnés, effacer les donjons sélectionnés
      clearSelectedDungeons()

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


-- Fonction pour effacer les donjons sélectionnés
function clearSelectedDungeons()
    -- Décoche toutes les cases des donjons
    for _, donjonCheckbox in pairs(donjonCheckButtons) do
        donjonCheckbox:SetChecked(false)
    end
    selectedDungeons = {}
end


--------------------------- Swap Bouton ---------------------------


local swapButton = CreateFrame("Button", nil, AutoLFM, "OptionsButtonTemplate")
swapButton:SetText("Raids List")
swapButton:SetWidth(200)
swapButton:SetHeight(25)
swapButton:SetPoint("BOTTOM", djScrollFrame, "TOP", 0, 10)

--- Action lorsque le bouton est cliqué ---
swapButton:SetScript("OnClick", function()
    -- Si les donjons et les raids sont vides, basculer entre les vues
    if djframe:IsShown() then
        -- Cacher les donjons et afficher les raids
        djframe:Hide()
        djScrollFrame:Hide()
        swapButton:SetText("Dungeons List")
        raidFrame:Show()
        raidScrollFrame:Show()
    else
        -- Cacher les raids et afficher les donjons
        raidFrame:Hide()
        raidScrollFrame:Hide()
        swapButton:SetText("Raids List")
        djframe:Show()
        djScrollFrame:Show()
    end
end)


--------------------------- Role Fonction ---------------------------


-- Fonction pour réinitialiser l'état de sélection d'une icône (Tank, DPS, Heal)
local function clearIconSelection(icon, roleName)
    if icon.selected then
        icon.selected = false
        icon:SetBackdrop(nil)  -- Retirer les bordures
        icon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)

        -- Retirer l'ombre
        icon:SetBackdrop({
            edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
            edgeSize = 16,
        })

        -- Supprimer le rôle de la table selectedRoles
        for i, role in ipairs(selectedRoles) do
            if role == roleName then
                table.remove(selectedRoles, i)
                break
            end
        end
    end
end

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
    updateMsgFrameCombined()
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
    updateMsgFrameCombined()
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
    updateMsgFrameCombined()
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
local function clearSelections()
    -- Vider la table selectedRoles
    selectedRoles = {}

    -- Désélectionner l'icône Tank
    tankIcon.selected = false
    tankIcon:SetBackdrop(nil)  -- Retirer les bordures
    tankIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
    tankIcon:SetBackdrop({
        edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
        edgeSize = 16,
    })

    -- Désélectionner l'icône DPS
    dpsIcon.selected = false
    dpsIcon:SetBackdrop(nil)  -- Retirer les bordures
    dpsIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
    dpsIcon:SetBackdrop({
        edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
        edgeSize = 16,
    })

    -- Désélectionner l'icône Heal
    healIcon.selected = false
    healIcon:SetBackdrop(nil)  -- Retirer les bordures
    healIcon.texture:SetAlpha(0.5)  -- Appliquer un effet de fade (transparence)
    healIcon:SetBackdrop({
        edgeFile = "Interface\\AddOns\\AutoLFM\\icon\\shadow-border.tga",  -- Texture pour l'ombre
        edgeSize = 16,
    })

    -- Mettre à jour l'affichage après avoir désélectionné tous les rôles
    updateMsgFrameCombined()
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

-- Fonction pour gérer l'appui sur "Entrée"
editBox:SetScript("OnEnterPressed", function(self)
    userInputMessage = this:GetText()
    this:ClearFocus()  -- Retirer le focus de la zone de texte
    updateMsgFrameCombined(userInputMessage)
end)

editBox:SetScript("OnEscapePressed", function(self)
    this:ClearFocus()  -- Retirer le focus de la zone de texte
    updateMsgFrameCombined(userInputMessage)
end)


--------------------------- Slider Frame ---------------------------


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
local sliderValue = 70

-- Créer une police pour afficher la valeur actuelle du slider (placer la valeur au-dessus du slider)
local valueText = slider:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
valueText:SetPoint("BOTTOM", slider, "TOP", 0, 5)
valueText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")


-- Variables pour gérer l'intervalle et la diffusion du message
local isBroadcasting = false
local broadcastStartTime = 0
local lastBroadcastTime = 0

-- Fonction pour arrêter la diffusion du message
local function stopMessageBroadcast()
    isBroadcasting = false
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
        stopMessageBroadcast()
        toggleButton:SetText("Start")
        print("The message is empty. The broadcast cannot start.")
        return
    end

    if isBroadcasting then
        stopMessageBroadcast()
        toggleButton:SetText("Start")
        print("Broadcast stopped")
    else
        startMessageBroadcast()
        toggleButton:SetText("Stop")
    end
end)

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


--------------------------- Event Fonction ---------------------------


AutoLFM:SetScript("OnEvent", function(self, event, ...)
    if "GROUP_ROSTER_UPDATE" then
        -- Si le groupe a changé, on arrête la diffusion du message
        countGroupMembers()
        updateMsgFrameCombined()
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
        DEFAULT_CHAT_FRAME:AddMessage("Commandes disponibles :", 0.0, 1.0, 0.0)
        DEFAULT_CHAT_FRAME:AddMessage("- |cffadd8e6/lfm |cffFFFFFFOpens AutoLFM window.")
        DEFAULT_CHAT_FRAME:AddMessage("- |cffadd8e6/lfm help |cffFFFFFFDisplays all available orders.")  -- Bleu clair pour la commande et blanc pour l'explication
        DEFAULT_CHAT_FRAME:AddMessage("- |cffadd8e6/lfm minimap show |cffFFFFFFDisplays the minimap button.")
        DEFAULT_CHAT_FRAME:AddMessage("- |cffadd8e6/lfm minimap hide |cffFFFFFFHide minimap button.")
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
        if AutoLFMMinimapButton and not AutoLFMMinimapButton:IsVisible() then
            AutoLFMMinimapButton:Show()  -- Afficher le bouton de la minimap
            DEFAULT_CHAT_FRAME:AddMessage("The minimap button has been redisplayed.", 0.0, 1.0, 0.0)  -- Texte vert
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
    DEFAULT_CHAT_FRAME:AddMessage("|cffff7f7f! Usage !  |cffadd8e6/lfm help |cffFFFFFFto list all commands.")  -- Rouge
end


--------------------- Minimap Buton ---------------------


-- Création du bouton de la mini-carte
local AutoLFMMinimapBtn = CreateFrame("Button", "AutoLFMMinimapButton", Minimap)
AutoLFMMinimapBtn:SetWidth(25)  -- Taille du bouton
AutoLFMMinimapBtn:SetHeight(25)  -- Taille du bouton
AutoLFMMinimapBtn:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -5, -5)  -- Positionner le bouton

-- Définir l'icône
AutoLFMMinimapBtn:SetNormalTexture("Interface\\Icons\\spell_arcane_teleportsilvermoon")
AutoLFMMinimapBtn:GetNormalTexture():SetTexCoord(0.0, 1.0, 0.0, 1.0)  -- Ajuster le cadrage pour rendre l'icône plus centrée et ronde

-- Créer une bordure ronde
local border = AutoLFMMinimapBtn:CreateTexture(nil, "BACKGROUND")
border:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")  -- Texture de bordure par défaut
border:SetAllPoints(AutoLFMMinimapBtn)
border:SetVertexColor(1, 0.5, 0.5)  -- Couleur rouge clair pour la bordure
border:SetBlendMode("ADD")  -- Pour que la bordure brille un peu, ajoutez l'effet "ADD" pour l'éclat

-- Appliquer des coins arrondis à la bordure
border:SetTexCoord(0, 1, 0, 1)  -- Ajuste la texture de la bordure

-- Ajouter un effet lors du survol de la souris
AutoLFMMinimapBtn:SetScript("OnEnter", function()
    -- Appliquer une brillance à l'icône
    AutoLFMMinimapBtn:GetNormalTexture():SetVertexColor(1, 0.5, 0.5)  -- Rouge clair

    -- Afficher le tooltip
    GameTooltip:SetOwner(AutoLFMMinimapBtn, "ANCHOR_RIGHT")
    GameTooltip:SetText("AutoLFM")
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


--------------------------- Slash de Control Pour Dev ---------------------------


-- Créer la commande Slash pour afficher les rôles sélectionnés
local function ShowSelectedRoles()
    if getTableSize(selectedRoles) == 0 then
        print("Aucun rôle sélectionné.")
    else
        -- Concaténer les rôles sélectionnés en une chaîne séparée par des virgules
        local rolesText = ""
        for i, role in ipairs(selectedRoles) do
            rolesText = rolesText .. role
            if i < getTableSize(selectedRoles) then
                rolesText = rolesText .. ", "
            end
        end
        print("Rôles sélectionnés : " .. rolesText)
    end
end

SLASH_ShowRoles1 = "/roles"
SlashCmdList["ShowRoles"] = ShowSelectedRoles

-- Slash Command pour afficher les rôles sélectionnés
SLASH_SHOWROLES1 = "/roles"  -- Nom de la commande Slash
SlashCmdList["SHOWROLES"] = function()
    local rolesText = "Rôles sélectionnés : "

    -- Compter le nombre total de rôles dans allRoles
    local totalRoles = countTableEntries(allRoles)

    -- Vérifier combien de rôles sont sélectionnés
    local selectedCount = countSelectedRoles(selectedRoles)

    if selectedCount == totalRoles then
        -- Si tous les rôles sont sélectionnés
        rolesText = rolesText .. "All"
    elseif isTableEmpty(selectedRoles) then
        -- Si aucun rôle n'est sélectionné
        rolesText = rolesText .. "Aucun rôle sélectionné."
    else
        -- Afficher les rôles sélectionnés
        for role, _ in pairs(selectedRoles) do
            rolesText = rolesText .. role .. " "
        end
    end

    -- Afficher le message dans la fenêtre de chat
    DEFAULT_CHAT_FRAME:AddMessage(rolesText)
end

-- Slash Command pour afficher les donjons sélectionnés
SLASH_GETDUNGEONS1 = "/dgs"  -- Enregistrer la commande /dgs

SlashCmdList["GETDUNGEONS"] = function()
    -- Appeler la fonction pour récupérer les donjons sélectionnés avec leurs abréviations
    local selected = GetSelectedDungeons()

    local selectedCount = 0
    for _, _ in pairs(selected) do
        selectedCount = selectedCount + 1  -- Compter manuellement les raids sélectionnés
    end

    -- Vérifier si des donjons ont été sélectionnés
    if selectedCount == 0 then
        -- Message si aucun donjon n'est sélectionné
        DEFAULT_CHAT_FRAME:AddMessage("Aucun donjon sélectionné.", 1.0, 0.0, 0.0)  -- Rouge
    else
        -- Affichage des donjons sélectionnés
        DEFAULT_CHAT_FRAME:AddMessage("Donjons sélectionnés :", 0.0, 1.0, 0.0)  -- Vert

        -- Afficher chaque donjon sélectionné (abréviation)
        for _, donjon in ipairs(selected) do
            -- Affichage avec un tiret et une couleur personnalisée (ici un bleu clair)
            DEFAULT_CHAT_FRAME:AddMessage("- " .. donjon, 0.0, 0.6, 1.0)  -- Bleu clair (RGB: 0, 0.6, 1)
        end
    end
end

-- Slash Command pour afficher les raids sélectionnés
SLASH_GETRAIDS1 = "/raids"  -- Enregistrer la commande /raids

SlashCmdList["GETRAIDS"] = function()
    -- Appeler la fonction pour récupérer les raids sélectionnés
    local selected = GetSelectedRaids()

    -- Vérifier si des raids ont été sélectionnés
    local selectedCount = 0
    for _, _ in pairs(selected) do
        selectedCount = selectedCount + 1  -- Compter manuellement les raids sélectionnés
    end

    -- Afficher les raids sélectionnés dans le chat
    if selectedCount == 0 then
        DEFAULT_CHAT_FRAME:AddMessage("Aucun raid sélectionné.", 1.0, 0.0, 0.0)  -- Message rouge si aucun raid n'est sélectionné
    else
        DEFAULT_CHAT_FRAME:AddMessage("Raids sélectionnés :", 0.0, 1.0, 0.0)  -- Message vert indiquant les raids sélectionnés

        -- Pour chaque raid sélectionné, afficher avec un tiret et couleur
        for _, raid in ipairs(selected) do
            -- Affichage avec un tiret et une couleur personnalisée (ici un bleu clair)
            DEFAULT_CHAT_FRAME:AddMessage("- " .. raid, 0.0, 0.6, 1.0)  -- Bleu clair (RGB: 0, 0.6, 1)
        end
    end
end

-- Commande dev /inter pour afficher la valeur du slider

SLASH_INTER1 = "/inter"
SlashCmdList["INTER"] = function()
    -- Afficher la valeur actuelle du slider dans le chat
    print("La valeur actuelle du slider est : " .. sliderValue .. " second")
end

-- -- Enregistrer la commande Slash
SLASH_LFMMSG1 = "/lfmm"  -- Nom de la commande, par exemple "/lfmm"
-- Fonction qui sera appelée par la commande slash "/lfmm"
function showCombinedMessage(msg)
    -- Générer le message combiné
    GetCombinedMessage()

    -- Vérifier si le message est vide
    if combinedMessage and combinedMessage ~= "" then
        -- Afficher le message dans la fenêtre de chat
        DEFAULT_CHAT_FRAME:AddMessage(combinedMessage)
    else
        -- Message d'erreur si le message est vide
        print("Le message combiné est vide ou n'a pas été généré correctement.")
    end
end
SlashCmdList["LFMMSG"] = showCombinedMessage

-- Commande slash pour afficher le message combiné
SLASH_GETCOMBINEDMESSAGE1 = "/msg"
function SlashCmdList.GETCOMBINEDMESSAGE(msg)
    -- Appel à la fonction pour générer le message combiné
    GetCombinedMessage()

    print("Combined Message: ", combinedMessage)

    -- Affichage du message dans le chat
    DEFAULT_CHAT_FRAME:AddMessage(combinedMessage)
end


AutoLFM:Hide()  -- Cacher la fenêtre principale par défaut
