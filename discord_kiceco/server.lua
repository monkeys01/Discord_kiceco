-- mon_script/server.lua

local webhookUrl = 'TON_WEBOOK'

AddEventHandler('playerConnecting', function()
    local playerName = GetPlayerName(source)
    print("Le joueur " .. playerName .. " est en train de se connecter.")
    
    -- Envoie un message sur Discord
    local discordMessage = 'Le joueur ' .. playerName .. ' vient de se connecter.'
    PerformHttpRequest(webhookUrl, function(statusCode, text, headers)
        if statusCode ~= 200 then
            print('Erreur lors de l\'envoi du message Discord. Code de statut : ' .. statusCode)
        else
            print('Message Discord envoyé avec succès.')
        end
    end, 'POST', json.encode({content = discordMessage}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    print("Le joueur " .. playerName .. " s'est déconnecté. Raison : " .. reason)
    
    -- Envoie un message sur Discord
    local discordMessage = 'Le joueur ' .. playerName .. ' s\'est déconnecté. Raison : ' .. reason
    PerformHttpRequest(webhookUrl, function(statusCode, text, headers)
        if statusCode ~= 200 then
            print('Erreur lors de l\'envoi du message Discord. Code de statut : ' .. statusCode)
        else
            print('Message Discord envoyé avec succès.')
        end
    end, 'POST', json.encode({content = discordMessage}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerKilled', function(killerId, deathData)
    local killerName = GetPlayerName(killerId)
    local victimName = GetPlayerName(source)
    
    -- Envoie un message sur Discord
    local discordMessage = 'Le joueur ' .. killerName .. ' a tué ' .. victimName .. ' avec la cause : ' .. deathData.killerInWeapon .. '.'
    PerformHttpRequest(webhookUrl, function(statusCode, text, headers)
        if statusCode ~= 200 then
            print('Erreur lors de l\'envoi du message Discord. Code de statut : ' .. statusCode)
        else
            print('Message Discord envoyé avec succès.')
        end
    end, 'POST', json.encode({content = discordMessage}), { ['Content-Type'] = 'application/json' })
end)

