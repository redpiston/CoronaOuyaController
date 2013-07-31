-- OuyaController.lua
--
-- Version 1.0
--
-- Copyright (C) 2013 Red Piston Inc. All Rights Reserved.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of 
-- this software and associated documentation files (the "Software"), to deal in the 
-- Software without restriction, including without limitation the rights to use, copy, 
-- modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
-- and to permit persons to whom the Software is furnished to do so, subject to the 
-- following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all copies 
-- or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
-- DEALINGS IN THE SOFTWARE.

module(..., package.seeall)

local ouya = display.newGroup()

local function ouyaListener( event )
	
	local e = {}
	
	if (event.keyName == "buttonA") then
		e.buttonName = "o"
	elseif (event.keyName == "buttonX") then
		e.buttonName = "u"
	elseif (event.keyName == "buttonY") then
		e.buttonName = "y"
	elseif (event.keyName == "buttonB") then
		e.buttonName = "a"
		
	--left analog stick and control pad
	elseif (event.keyName == "left") then
		e.buttonName = event.keyName
	elseif (event.keyName == "right") then
		e.buttonName = event.keyName
	elseif (event.keyName == "up") then
		e.buttonName = event.keyName
	elseif (event.keyName == "down") then
		e.buttonName = event.keyName
	
	--push in analog sticks
	elseif (event.keyName == "leftJoystickDown") then
		e.buttonName = event.keyName
	elseif (event.keyName == "rightJoystickDown") then
		e.buttonName = event.keyName
	
	-- home/Ouya button 
	elseif (event.keyName == "u") then
		e.buttonName = "home"
	
	-- shoulder buttons
	elseif (event.keyName == "rightShoulderButton1") then
		e.buttonName = "rightBumper"
	elseif (event.keyName == "rightShoulderButton2") then
		e.buttonName = "rightTrigger"
	elseif (event.keyName == "leftShoulderButton1") then
		e.buttonName = "leftBumper"
	elseif (event.keyName == "leftShoulderButton2") then
		e.buttonName = "leftTrigger"
		
	--Currently there is no support for the right analog stick, and the left analog stick
	--behaves like the control pad

	--Xbox 360 controllers:
	elseif (event.keyName == "buttonStart") then
		e.buttonName = "start"
	elseif (event.keyName == "a") then
		e.buttonName = "back"
	
	-- Xbox 360 triggers are not supported
	
	else
		e.buttonName = event.keyName
	end

	if (event.phase == "down") then
		e.phase = "pressed"
	elseif (event.phase == "up") then
		e.phase = "released"
	end
	
	--to distinguish between controllers
	if event.device.descriptor then
		e.playerName = event.device.descriptor
	end
	
	ouya.callback( e )
	
	return true
end

function ouya:removeListener( ) 
	Runtime:removeEventListener( "key", ouyaListener )
end

function ouya:setListener( callback )
	
	ouya.callback = callback
		
	Runtime:addEventListener( "key", ouyaListener )
end

return ouya