--lipo -create libPhone.a libSimulator.a -output libUniversal.a
local OneLouder = require "plugin.OneLouder"

local storyboard = require( "storyboard" )

local function listener( event )
	print("Ad: ",event.adType,"  ",event.adStatus)
end

--adlibsdkdemo --iostest
--OneLouder.init( "iostest", "a@twitter.com", "a@a.com", "23672-323", listener )
OneLouder.init( "adlibsdkdemo", "1.0", listener )

OneLouder.enableDiagnostics()
OneLouder.enableTestMode()
OneLouder.setEmail("a@a.com")
OneLouder.setTwitterId("a@twitter.com")
OneLouder.setPhoneNo("23672-323")

timer.performWithDelay( 1000, function()
	storyboard.gotoScene( "scene1" )  
end )

