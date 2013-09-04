--lipo -create libPhone.a libSimulator.a -output libUniversal.a
local PinsightMedia = require "plugin.PinsightMedia"

local storyboard = require( "storyboard" )

local function listener( event )
	print("Ad: ",event.adType,"  ",event.adStatus)
end

local isAndroid = "Android" == system.getInfo( "platformName" )
if isAndroid then
	PinsightMedia.init( "androidtest", "2.1.4", listener )
else
	PinsightMedia.init( "iostest", "2.1.4", listener )
end

--PinsightMedia.enableDiagnostics()
--PinsightMedia.enableTestMode()
PinsightMedia.setEmail("a@a.com")
PinsightMedia.setTwitterId("a@twitter.com")
PinsightMedia.setPhoneNo("23672-323")

timer.performWithDelay( 1000, function()
	storyboard.gotoScene( "scene1" )  
end )

