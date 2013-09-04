--lipo -create libPhone.a libSimulator.a -output libUniversal.a
local OneLouder = require "plugin.OneLouder"

local storyboard = require( "storyboard" )

local function listener( event )
	print("Ad: ",event.adType,"  ",event.adStatus)
end

<<<<<<< HEAD
local isAndroid = "Android" == system.getInfo( "platformName" )
if isAndroid then
	OneLouder.init( "androidtest", "2.1.4", listener )
else
	OneLouder.init( "iostest", "2.1.4", listener )
end

--OneLouder.enableDiagnostics()
--OneLouder.enableTestMode()
=======
--adlibsdkdemo --iostest
--OneLouder.init( "iostest", "a@twitter.com", "a@a.com", "23672-323", listener )
OneLouder.init( "adlibsdkdemo", "1.0", listener )

OneLouder.enableDiagnostics()
OneLouder.enableTestMode()
>>>>>>> 59df53a4827019e0cacb12479fdf961d869c6911
OneLouder.setEmail("a@a.com")
OneLouder.setTwitterId("a@twitter.com")
OneLouder.setPhoneNo("23672-323")

timer.performWithDelay( 1000, function()
	storyboard.gotoScene( "scene1" )  
end )

