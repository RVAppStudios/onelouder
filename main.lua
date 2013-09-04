--lipo -create libPhone.a libSimulator.a -output libUniversal.a
local OneLouder = require "plugin.OneLouder"

local storyboard = require( "storyboard" )

local function listener( event )
	print("Ad: ",event.adType,"  ",event.adStatus)
end

local isAndroid = "Android" == system.getInfo( "platformName" )
if isAndroid then
	OneLouder.init( "androidtest", "2.1.4", listener )
else
	OneLouder.init( "iostest", "2.1.4", listener )
end

--OneLouder.enableDiagnostics()
--OneLouder.enableTestMode()
OneLouder.setEmail("a@a.com")
OneLouder.setTwitterId("a@twitter.com")
OneLouder.setPhoneNo("23672-323")

timer.performWithDelay( 1000, function()
	storyboard.gotoScene( "scene1" )  
end )

