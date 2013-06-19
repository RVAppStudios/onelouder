module(..., package.seeall)

local storyboard = require( "storyboard" )
local OneLouder = require "plugin.OneLouder"

local scene = storyboard.newScene()
local widget = require('widget-v1')

local titleBg = nil
local titleText = nil
local backBtn = nil

function scene:createScene( event )
    local screenGroup = self.view
	if(storyboard.getPrevious()) then
        storyboard.removeScene(storyboard.getPrevious())
    end
    
    titleBg = display.newRect(0,0,display.contentWidth,50)
    titleBg:setFillColor(140, 140, 140)
    screenGroup:insert(titleBg)
    
    titleText = display.newText("Square Ads",display.contentWidth*0.5,20,native.systemFontBold,24)
    titleText.x = display.contentWidth*0.5
    titleText.y = 25
    screenGroup:insert(titleText)
    
    OneLouder.showSquareAd("test_square",240)
    
    local onBack = function(event)
    	if(backBtn.isActive) then
			OneLouder.removeSquareAd()
			storyboard.gotoScene( "scene1" )  
		end
	end
	backBtn = widget.newButton{
    	width = 70,
    	height = 38,
    	label = "Back",
    	onRelease = onBack
	}
	backBtn.x = 40
	backBtn.y = 25
	backBtn.isActive = true
    screenGroup:insert(backBtn)
end

function scene:enterScene( event )
	local function onOrientationChange( event )
       --print("Here ",display.contentHeight)
       --titleBg:setFillColor(255, 200, 140)
       titleBg.width = display.contentWidth
       titleBg.x = display.contentWidth*0.5
       
       titleText.x = display.contentWidth*0.5
	end
 
	Runtime:addEventListener( "orientation", onOrientationChange )
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