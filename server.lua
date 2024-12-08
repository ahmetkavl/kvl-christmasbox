if KVL['Config']['Framework'] == 'QBCore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif KVL['Config']['Framework'] == 'ESX' then
    ESX = exports["es_extended"]:getSharedObject()
end

if KVL['Config']['Framework'] == 'QBCore' then
    QBCore.Functions.CreateUseableItem('giftbox', function(source, item)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer.Functions.GetItemByName(item.name) then return end

        local itemData = KVL['GiftItem']

        local randomItem = math.random(1, #itemData)
        local selectedItemData = itemData[randomItem]

    
        local selectedItem = selectedItemData.name
        local minAmount = selectedItemData.min
        local maxAmount = selectedItemData.max
        local randomAmount = math.random(minAmount, maxAmount)

        
        xPlayer.Functions.AddItem(selectedItem, randomAmount)
        xPlayer.Functions.RemoveItem('giftbox', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[selectedItem], "add", randomAmount)
    end)

elseif KVL['Config']['Framework'] == 'ESX' then
    ESX.RegisterUsableItem('giftbox', function(playerId)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        local itemData = KVL['GiftItem']

        local randomItem = math.random(1, #itemData)
        local selectedItemData = itemData[randomItem]

    
        local selectedItem = selectedItemData.name
        local minAmount = selectedItemData.min
        local maxAmount = selectedItemData.max
        local randomAmount = math.random(minAmount, maxAmount)

        
        xPlayer.addInventoryItem(selectedItem, randomAmount)
        
        xPlayer.removeInventoryItem('giftbox', 1)
    end)
end