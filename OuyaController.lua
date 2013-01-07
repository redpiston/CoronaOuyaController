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

	if (event.keyName == "center") then
		e.buttonName = "o"
	elseif (event.keyName == "menu") then
		e.buttonName = "u"
	elseif (event.keyName == "back") then
		e.buttonName = "a"
	else
		e.buttonName = event.keyName
	end

	if (event.phase == "down") then
		e.phase = "pressed"
	elseif (event.phase == "up") then
		e.phase = "released"
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