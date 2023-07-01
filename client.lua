-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------

local result = false
local NUI_Focus = false
local inGame = false

RegisterNUICallback("finalGameResult", function(data, cb)
    if inGame then
        result = data.finalResult == "winner"
        SendNUIMessage({
            action = "forceClose"
        })
        Wait(100)
        NUI_Focus = false
    else
        result = false
    end
    cb("ok")
end)

-- triggered when player presses escape key
RegisterNUICallback("closeMenu", function(data, cb)
    Wait(100)
    result = false
    NUI_Focus = false
end)



local function openAimGame(config)
    if not config then config = {} end
    local data = {
        initializingTimer= config.initializingTimer or 3,
        gameCountDownTime= config.gameCountDownTime or 15,
        totalCorrectClicksAllowed= config.totalCorrectClicksAllowed or 3,  
        totalWrongClicksAllowed= config.totalWrongClicksAllowed or 2,  

        chooseRandomBubbleColors= config.chooseRandomBubbleColors or true, 
        singleBubbleColor= config.singleBubbleColor or '',
        chooseRandomSizeBubbles= config.chooseRandomSizeBubbles or false,
        singleBubbleSize= config.singleBubbleSize or '1'
    }
    NUI_Focus = true
    inGame = true
    SendNUIMessage({
        action = "openGame",
        data = data
    })
    SetNuiFocus(true, true)
    while NUI_Focus do
        Wait(20)
    end
    Wait(100)
    SetNuiFocus(false, false)
    return result
end

exports("openAimGame", openAimGame)


-- RegisterCommand("mini", function()
--     local config = {
--         initializingTimer= 2, -- in seconds 
--         gameCountDownTime= 10, --in seconds 
--         totalCorrectClicksAllowed= 3, -- total number of correct clicks required to win
--         totalWrongClicksAllowed= 2, -- total number of wrong click they can do before losing

--         chooseRandomBubbleColors= true, --if false singleBubbleColor will be given if provided else color from code used 
--         singleBubbleColor= '', --optional - if not provided, color from code will be used
--         chooseRandomSizeBubbles= false, --if false singleBubbleSize will be given if provided else size from code used 
--         singleBubbleSize= '1'--optional - if not provided, size from code will be used -> value should be integer values from 1 to 3
--     }
--     local result = exports["snipe-aimgame"]:openAimGame(config)
--     if result then
--         print("winner")
--     else
--         print("loser")
--     end
-- end)