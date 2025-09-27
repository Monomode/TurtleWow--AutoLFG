-- Création du cadre pour les canaux
channelsFrame = CreateFrame("Frame", nil, AutoLFM)
channelsFrame:SetWidth(140)
channelsFrame:SetHeight(110)

-- Ajouter un fond pour le cadre des canaux
channelsFrame:SetBackdrop{
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    edgeSize = 12,
    insets = { left = 5, right = 5, top = 5, bottom = 5 },
}
-- Ajouter un titre en haut du cadre
titleText = channelsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
titleText:SetPoint("TOP", channelsFrame, "TOP", 0, -10)
titleText:SetText("Select Channel Broadcast")
titleText:SetTextColor(1, 1, 0)  -- Couleur dorée pour le titre
titleText:SetJustifyH("CENTER")
titleText:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")

-- Créer un cadre interne pour contenir les boutons et les organiser
buttonFrame = CreateFrame("Frame", nil, channelsFrame)
buttonFrame:SetPoint("TOP", titleText, "BOTTOM", 0, -10)
buttonFrame:SetWidth(channelsFrame:GetWidth() - 20)  -- Légèrement plus petit que la largeur du cadre principal
buttonFrame:SetHeight(channelsFrame:GetHeight() - 50)  -- Réduit la hauteur pour que les boutons tiennent dans la frame

-- Fonction pour sauvegarder les canaux sélectionnés
function SaveSelectedChannels()
    AutoLFM_SavedVariables[uniqueIdentifier].selectedChannels = selectedChannels
end

-- Fonction pour charger les canaux sélectionnés lors du démarrage
function LoadSelectedChannels()
    if AutoLFM_SavedVariables[uniqueIdentifier] and AutoLFM_SavedVariables[uniqueIdentifier].selectedChannels then
        selectedChannels = AutoLFM_SavedVariables[uniqueIdentifier].selectedChannels
    else
        selectedChannels = {}
        AutoLFM_SavedVariables[uniqueIdentifier].selectedChannels = selectedChannels
    end
end

-- Fonction pour mettre à jour le canal sélectionné dans la table
function ToggleChannelSelection(channelName, isSelected)
    if isSelected then
        selectedChannels[channelName] = true  -- Ajouter le canal aux sélectionnés
    else
        selectedChannels[channelName] = nil  -- Retirer le canal des sélectionnés
    end
    -- Sauvegarder après chaque modification
    SaveSelectedChannels()
end

-- Fonction pour mettre à jour la position en fonction de l’état du panneau droit
function UpdateChannelsFramePosition()
    if showArrowBtn and showArrowBtn:IsShown() then
        channelsFrame:SetPoint("BOTTOMRIGHT", AutoLFM, "BOTTOMRIGHT", 118, 52)
    else
        channelsFrame:SetPoint("BOTTOMRIGHT", AutoLFM, "BOTTOMRIGHT", 360, 52)
    end
end


---------------------------------------------------------------------------------
--                          Canaux World & LFG                                 --
---------------------------------------------------------------------------------


-- Fonction pour capturer les messages du canal Hardcore
function OnHardcoreChatMessage(self, event, msg, author, _, _, _, _, _, _, _, channelId, channelName)
    -- Vérifier si l'événement est bien CHAT_MSG_HARDCORE (événement personnalisé)
    if "CHAT_MSG_HARDCORE" then
        -- Afficher le message reçu dans la fenêtre de chat
        -- DEFAULT_CHAT_FRAME:AddMessage("Message reçu dans")
    end
end

-- Créer un cadre pour écouter les événements personnalisés
frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_HARDCORE")  -- S'abonner à l'événement personnalisé CHAT_MSG_HARDCORE
frame:SetScript("OnEvent", OnHardcoreChatMessage)

-- Liste des canaux à rechercher
channelsToFind = {"WORLD", "LookingForGroup", "Hardcore"}

-- Table pour stocker les canaux trouvés
foundChannels = {}

-- Fonction pour rechercher et stocker les canaux
function findChannels()
    -- Effacer la table foundChannels avant de la remplir
    foundChannels = {}

    -- Recherche des canaux définis
    for _, channel in ipairs(channelsToFind) do
        if channel == "Hardcore" then
            -- Ajoute un canal personnalisé "Hardcore" à la table foundChannels
            table.insert(foundChannels, {name = "Hardcore", id = "hardcore_channel"})
        else
            -- Recherche l'ID du canal standard avec GetChannelName
            channelId = GetChannelName(channel)
            if channelId and channelId > 0 then
                -- Ajoute l'ID du canal trouvé à la table foundChannels
                table.insert(foundChannels, {name = channel, id = channelId})
            else
                -- DEFAULT_CHAT_FRAME:AddMessage("Canal " .. channel .. " non trouvé ou non ouvert.")
            end
        end
    end

    -- Afficher les canaux trouvés dans la fenêtre de chat pour vérifier
    if next(foundChannels) then
        for _, channel in ipairs(foundChannels) do
            -- DEFAULT_CHAT_FRAME:AddMessage("Canal trouvé : " .. channel.name)
        end
    else
        -- DEFAULT_CHAT_FRAME:AddMessage("Aucun canal trouvé.")
    end
end

-- Créer un bouton de case à cocher pour chaque canal
function CreateChannelButtons()
    -- Vérifier si des canaux ont été trouvés avant de créer les boutons
    if not next(foundChannels) then
        -- DEFAULT_CHAT_FRAME:AddMessage("Unable to create buttons : No channel found.")
        return
    end

    -- Effacer les anciens boutons avant de créer de nouveaux boutons
    for _, button in ipairs(channelsFrame.buttons or {}) do
        button:Hide()  -- Masquer les anciens boutons
    end
    channelsFrame.buttons = {}  -- Réinitialiser la liste des boutons

    lastButton = nil
    -- Créer un bouton pour chaque canal trouvé
    for _, channel in ipairs(foundChannels) do
        -- Vérifier si channel est valide avant de créer le bouton
        if channel and channel.name then
            -- Créer le bouton de case à cocher
            local button = CreateFrame("CheckButton", nil, channelsFrame, "UICheckButtonTemplate")
            button:SetWidth(14)
            button:SetHeight(14)
            if lastButton then
                button:SetPoint("TOP", lastButton, "BOTTOM", 0, -5)  -- Espacer les boutons
            else
                button:SetPoint("TOPLEFT", buttonFrame, "TOPLEFT", 10, -5)  -- Premier bouton sous le titre
            end


            -- Créer un texte à afficher à côté de la case à cocher
            channelText = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            channelText:SetPoint("LEFT", button, "RIGHT", 5, 0)
            channelText:SetText(channel.name)
            channelText:SetFont("Fonts\\FRIZQT__.TTF", 9, "MONOCHROME")

            -- Vérifier si le canal est sélectionné
            button:SetChecked(selectedChannels[channel.name])  -- Vérifier si le canal est dans la liste des sélectionnés

            -- Capturer explicitement la valeur du canal dans une variable locale
            local currentChannel = channel

            -- Fonction à appeler lorsque la case à cocher est modifiée
            button:SetScript("OnClick", function()
                if currentChannel and currentChannel.name then
                    -- Mettre à jour la sélection du canal dans la table
                    ToggleChannelSelection(currentChannel.name, button:GetChecked())
                end
            end)

            -- Ajouter le bouton dans le tableau pour pouvoir les masquer/mettre à jour plus tard
            table.insert(channelsFrame.buttons, button)

            lastButton = button  -- Référence au dernier bouton créé pour la position suivante
        else
            -- DEFAULT_CHAT_FRAME:AddMessage("Erreur : canal invalide lors de la création du bouton. Canal : " .. tostring(channel))
        end
    end
end

function swapChannelFrame()
    LoadSelectedChannels()

    if not channelsFrame.buttons or tableCount(channelsFrame.buttons) == 0 then
        findChannels()
        CreateChannelButtons()
    end

    if next(selectedChannels) == nil then
        UpdateChannelsFramePosition()
    else
        channelsFrame:Hide()
    end
end
