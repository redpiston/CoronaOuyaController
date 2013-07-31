display.setStatusBar(display.HiddenStatusBar)

local mainGroup = display.newGroup()

local ouya = require("OuyaController")

local buttonNameLabel

local buttonStateLabel

local playerLabel

local W = display.contentWidth
local H = display.contentHeight
local fontSize = 150
local spacing = 300

local function ouyaListener( event )

	--add your button specific code here
	buttonNameLabel.text = "Button Name: " ..event.buttonName
	
	buttonStateLabel.text = "Button State: " ..event.phase
	
	playerLabel.text = "Player Name: "..event.playerName
	
	--EXAMPLE:
	--if event.buttonName == "o" and event.phase == "pressed" then
	--	player.jump()
	--elseif event.buttonName == "u" and event.phase == "pressed" then
	--	player.punch()
	--end
end

local function main()
	
	buttonStateLabel = display.newText( "", 0, 0, "Helvetica", fontSize )
	buttonStateLabel:setTextColor( 255, 255, 255, 255 )
	buttonStateLabel.text = "Button State: "
	buttonStateLabel.x = W * .5
	buttonStateLabel.y = H * 0.25
	
	--set up label to display input
	buttonNameLabel = display.newText( "", 0, 0, "Helvetica", fontSize )
	buttonNameLabel:setTextColor( 255, 255, 255, 255 )
	buttonNameLabel.text = "Button Name: "
	buttonNameLabel.x = buttonStateLabel.x
	buttonNameLabel.y = buttonStateLabel.y + spacing
	
	playerLabel = display.newText( "", 0, 0, "Helvetica", fontSize )
	playerLabel:setTextColor( 255, 255, 255, 255 )
	playerLabel.text = "Player Name: "
	playerLabel.x = buttonStateLabel.x
	playerLabel.y = buttonNameLabel.y + spacing

	--set the event listener for the controller
	ouya:setListener( ouyaListener )
	
	--use this to remove the event listener when not waiting on controller input
	--ouya:removeListener( )
end


main()