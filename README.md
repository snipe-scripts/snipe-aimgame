# Aim Minigame

## How to use

```lua
local config = {
    initializingTimer= 2, -- in seconds before the game starts
    gameCountDownTime= 15, --in seconds how much time they have to complete the game
    totalCorrectClicksAllowed= 3, -- total number of correct clicks required to win
    totalWrongClicksAllowed= 2, -- total number of wrong click they can do before losing

    chooseRandomBubbleColors= true, --if false singleBubbleColor will be given if provided else color from code used 
    singleBubbleColor= '', --optional - if not provided, color from code will be used
    chooseRandomSizeBubbles= false, --if false singleBubbleSize will be given if provided else size from code used 
    singleBubbleSize= '1'--optional - if not provided, size from code will be used -> value should be integer values from 1 to 3
}
local result = exports["snipe-aimgame"]:openAimGame(config)
if result then
    print("winner")
else
    print("loser")
end
```

# Open the minigame based on command

```lua
RegisterCommand("mini", function()
    local config = {
        initializingTimer= 2, -- in seconds before the game starts
        gameCountDownTime= 15, --in seconds how much time they have to complete the game
        totalCorrectClicksAllowed= 3, -- total number of correct clicks required to win
        totalWrongClicksAllowed= 2, -- total number of wrong click they can do before losing

        chooseRandomBubbleColors= true, --if false singleBubbleColor will be given if provided else color from code used 
        singleBubbleColor= '', --optional - if not provided, color from code will be used
        chooseRandomSizeBubbles= false, --if false singleBubbleSize will be given if provided else size from code used 
        singleBubbleSize= '1'--optional - if not provided, size from code will be used -> value should be integer values from 1 to 3
    }
    local result = exports["snipe-aimgame"]:openAimGame(config)
    if result then
        print("winner")
    else
        print("loser")
    end
end)
```