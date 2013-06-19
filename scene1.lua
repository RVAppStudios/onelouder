module(..., package.seeall)

local storyboard = require( "storyboard" )
local OneLouder = require "plugin.OneLouder"

local scene = storyboard.newScene()
local widget = require('widget-v1')

function scene:createScene( event )
    local screenGroup = self.view
	if(storyboard.getPrevious()) then
        storyboard.removeScene(storyboard.getPrevious())
    end
     
	local interstitialBtn = nil
	local onInterstitial = function(event)
    	if(interstitialBtn.isActive) then
			OneLouder.showInterstitial("scenechange") --launch --scenechange --preroll
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
	screenGroup:insert(interstitialBtn)
	
	local bannerBtn = nil
	local onBanner = function(event)
    	if(bannerBtn.isActive) then
			OneLouder.showBanner("global")
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
	screenGroup:insert(bannerBtn)
	
	OneLouder.showBanner("global")
	
	local hideBannerBtn = nil
	local onHideBanner = function(event)
  		if(hideBannerBtn.isActive) then
			OneLouder.hideBanner()
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
	screenGroup:insert(hideBannerBtn)
	
	local squareAdBtn = nil
	local onSquareAd = function(event)
    	if(squareAdBtn.isActive) then
    		OneLouder.removeBanner()
			storyboard.gotoScene( "scene2" )  
			--OneLouder.showSquareAd()
		end
	end
	squareAdBtn = widget.newButton{
    	width = 107,
    	height = 38,
    	label = "Square Ad",
    	onRelease = onSquareAd
	}
	squareAdBtn.x = 160
	squareAdBtn.y = 250
	squareAdBtn.isActive = true
    screenGroup:insert(squareAdBtn)
end

function scene:enterScene( event )
	
end

function scene:exitScene( event )
	
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
end


-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene