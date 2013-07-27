display.setStatusBar(display.HiddenStatusBar)

local mainGroup = display.newGroup()

local ouya = require("OuyaController")

local buttonNameLabel

local buttonStateLabel

local W = display.contentWidth
local H = display.contentHeight
local fontSize = 150
local spacing = 100

local function ouyaListener( event )

	--add your button specific code here
	buttonNameLabel.text = "Button Name: " ..event.buttonName
	
	buttonStateLabel.text = "Button State: " ..event.phase
	
	--EXAMPLE:
	--if event.buttonName == "o" and event.phase == "pressed" then
	--	player.jump()
	--elseif event.buttonName == "u" and event.phase == "pressed" then
	--	player.punch()
	--end
	
	--Usable buttons as of build #971
	--O, U, A, D-Pad, Left Thumbstick
end

local function main()
	
	--set up label to display input
	buttonNameLabel = display.newText( "", 0, 0, "Helvetica", fontSize )
	buttonNameLabel:setTextColor( 255, 255, 255, 255 )
	buttonNameLabel.text = "Button Name: "
	buttonNameLabel.x = W * .5
	buttonNameLabel.y = H * 0.5 + spacing
	
	buttonStateLabel = display.newText( "", 0, 0, "Helvetica", fontSize )
	buttonStateLabel:setTextColor( 255, 255, 255, 255 )
	buttonStateLabel.text = "Button State: "
	buttonStateLabel.x = buttonNameLabel.x
	buttonStateLabel.y = H * 0.5 - spacing
	

	--set the event listener for the controller
	ouya:setListener( ouyaListener )
	
	--use this to remove the event listener when not waiting on controller input
	--ouya:removeListener( )
end


main()