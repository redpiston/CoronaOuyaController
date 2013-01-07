display.setStatusBar(display.HiddenStatusBar)

local mainGroup = display.newGroup()

local ouya = require("OuyaController")

local buttonNameLabel

local buttonStateLabel

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
	buttonNameLabel = display.newText( "", display.contentWidth*0.5, display.contentHeight*0.5 - 12, "Helvetica", 20 )
	buttonNameLabel:setTextColor( 255, 255, 255, 255 )
	buttonNameLabel.text = "Button Name: "
	
	buttonStateLabel = display.newText( "", display.contentWidth*0.5, display.contentHeight*0.5 + 12, "Helvetica", 20 )
	buttonStateLabel:setTextColor( 255, 255, 255, 255 )
	buttonStateLabel.text = "Button State: "

	--set the event listener for the controller
	ouya:setListener( ouyaListener )
	
	--use this to remove the event listener when not waiting on controller input
	--ouya:removeListener( )
end


main()