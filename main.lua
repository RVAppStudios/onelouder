local OneLouderAd = require "plugin.OneLouderAdAndroid"

local widget = require('widget-v1')

local function listener( event )
	--native.showAlert( event.name, event.adLoaded, { "OK" } )
	print("ONE LOUDER RESPONSE: ",event.adLoaded)
	print("ONE LOUDER AD TYPE: ",event.adType)
end

--[[
	Arguments to init:
	1-> Product Name
	2-> Version 
	3-> enable testmode
	4-> enable diagnostics
	5-> Email Address optional
	6-> Twitter Id optional
	7-> Function where you get responses from one louder
]]--
OneLouderAd.init( "adlibdemo","2.1.2",false,true,"mail@a.com","twitter@a.com",listener )

local interstitialBtn = nil
local onInterstitial = function(event)
    if(interstitialBtn.isActive) then
		OneLouderAd.showInterstitial("launch")  --screenchange
	end
end
interstitialBtn = widget.newButton{
    width = 107,
    height = 38,
    label = "Interstitial",
    onRelease = onInterstitial
}
interstitialBtn.x = 160
interstitialBtn.y = 100
interstitialBtn.isActive = true

local bannerBtn = nil
local onBanner = function(event)
    if(bannerBtn.isActive) then
		OneLouderAd.showBanner("global")
	end
end
bannerBtn = widget.newButton{
    width = 107,
    height = 38,
    label = "Banner Ad",
    onRelease = onBanner
}
bannerBtn.x = 160
bannerBtn.y = 150
bannerBtn.isActive = true

local hideBannerBtn = nil
local onHideBanner = function(event)
    if(hideBannerBtn.isActive) then
		OneLouderAd.hideBanner()
	end
end
hideBannerBtn = widget.newButton{
    width = 107,
    height = 38,
    label = "Hide Banner Ad",
    onRelease = onHideBanner
}
hideBannerBtn.x = 160
hideBannerBtn.y = 200
hideBannerBtn.isActive = true


timer.performWithDelay( 1000, function()
	-- Pass your placement id as argumrnt
	OneLouderAd.showBanner("global")
end )

local function onSystemEvent( event )
	if (event.type == "applicationStart") then
	
	elseif (event.type == "applicationSuspend") then
	
	elseif (event.type == "applicationResume") then
		-- If in-app purchase done then set flag true, otherwise false
		OneLouderAd.resumeBanner(true)
	elseif (event.type == "applicationExit") then

	end
end
Runtime:addEventListener( "system", onSystemEvent )

