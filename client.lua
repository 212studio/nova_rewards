local time = 0
local nomeItem = false

Citizen.CreateThread(function()
    Wait(1000)
    NewRewards()
end)


NewRewards = function()
    Config.Items = Config.Items or {}
    local randomNumber = math.random(1, #Config.Items)
    time = Config.Items[randomNumber].time
    nomeItem = Config.Items[randomNumber].item
   SendNUIMessage({
    type = "SET_RICOMPENSA",
    labelItem = Config.Items[randomNumber].label,
    img = Config.Items[randomNumber].img,
    time = Config.Items[randomNumber].time,
    nomeItem = Config.Items[randomNumber].item,
    quantity = Config.Items[randomNumber].quantity,
   })
end

Citizen.CreateThread(function()
  while true do
    Wait(1000)
    if time > 0 then
        time = time - 1000
        SendNUIMessage({
            type = "SET_TIME",
            time = time,
        })
    else
        TriggerServerEvent('ricky-rewards:giveItem', nomeItem)
        NewRewards()
    end
   end
end)