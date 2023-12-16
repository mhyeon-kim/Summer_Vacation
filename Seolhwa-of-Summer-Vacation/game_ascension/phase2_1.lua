-----------------------------------------------------------------------------------------
--
-- phase2_1.lua
-- 이밍 승천 연습 성층권
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- 효과음 --
	local explosionSound2 = audio.loadSound("sound/A_1. 미니게임 버튼_카툰코드음14_mp3.mp3") -- 점프
	local explosionSound3 = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3") -- 설정 등 클릭

	physics.start()
	physics.setDrawMode( "normal" )


	-- 배경 --
	local background = display.newImage("image/game_ascension/background/하늘3.jpg")
	background.x, background.y = display.contentCenterX, display.contentCenterY


	-- 기본 오브젝트 배치 --
	local menuGroup = display.newGroup()

	local set = display.newImage("image/public/설정.png")
	set.x, set.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local guide = display.newImage("image/public/지천얼굴.png")
	guide.x, guide.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09


	-- 구름 오브젝트 배치 --
	local cloud = {}

	cloud[1] = display.newImageRect("image/game_ascension/성층구름.png", 300, 90)
	cloud[1].x, cloud[1].y = 300, 550

	cloud[2] = display.newImageRect("image/game_ascension/성층구름.png", 300, 90)
	cloud[2].x, cloud[2].y = 650, 470

	cloud[3] = display.newImageRect("image/game_ascension/성층구름.png", 300, 90)
	cloud[3].x, cloud[3].y = 1000, 400

	cloud[4] = display.newImageRect("image/game_ascension/성층구름.png", 300, 90)
	cloud[4].x, cloud[4].y = 680, 290

	cloud[5] = display.newImageRect("image/game_ascension/성층구름.png", 300, 90)
	cloud[5].x, cloud[5].y = 380, 190

	
	-- 벽 설정 --
	local wall = {}

	wall[1] = display.newRect(0, background.y, 30, background.height)
	wall[2] = display.newRect(background.width, background.y, 30, background.height)
	wall[3] = display.newRect(background.x, 0, background.width, 30)
	wall[3].name = "up"
	wall[4] = display.newRect(background.x, background.height, background.width, 30)
	wall[4].name = "down"


	-- 구름, 벽 물리엔진, 배경레이어 추가 --
	for i = 1, #wall do
		physics.addBody(wall[i], "static")
		sceneGroup:insert(wall[i])
	end

	sceneGroup:insert(background)

	local cloud_outline_none = graphics.newOutline(1, "image/game_ascension/대기구름.png")

	for i = 1, #cloud do 
		physics.addBody(cloud[i], "static", {friction=1, outline=cloud_outline_none})
		sceneGroup:insert(cloud[i])
	end


	-- 점프하세요 이미지 --
	local jumpImg = display.newImage("image/game_ascension/JUMP.png")
	jumpImg.x, jumpImg.y = 300, 140

	sceneGroup:insert(jumpImg)


	-- 오존층 배치 --
	local ozone = display.newImage("image/game_ascension/오존층.png")
	ozone.x, ozone.y = display.contentWidth/2, display.contentHeight-40

	local ozone_outline_none = graphics.newOutline(1, "image/game_ascension/오존층.png")

	physics.addBody(ozone, "static", {friction=1, outline=ozone_outline_none})
	sceneGroup:insert(ozone)


	local arrow = {}

	arrow[1] = display.newImage("image/game_ascension/arrow/왼쪽버튼2.png")
	arrow[1]:scale(0.75, 0.75)
	arrow[1].x, arrow[1].y = 1050, 630
	arrow[1].name = "left"

	arrow[2] = display.newImage("image/game_ascension/arrow/점프2.png")
	arrow[2]:scale(0.75, 0.75)
	arrow[2].x, arrow[2].y = 100, 630
	arrow[2].name = "jump"

	arrow[3] = display.newImage("image/game_ascension/arrow/오른쪽버튼2.png")
	arrow[3]:scale(0.75, 0.75)
	arrow[3].x, arrow[3].y = 1200, 630
	arrow[3].name = "right"

	arrow[4] = "right"


	-- player 이밍 추가 --
	local eming = display.newImage("image/game_ascension/이밍게임_오른쪽.png")
	eming.x, eming.y = display.contentCenterX, 550

	local eming_outline_none = graphics.newOutline(2, "image/game_ascension/이밍게임_오른쪽.png")
	local eming_outline_flip = graphics.newOutline(2, "image/game_ascension/이밍게임_왼쪽.png")

	physics.addBody(eming, {friction=1, outline=eming_outline_none})
	eming.isFixedRotation = true 
	sceneGroup:insert(eming)


	function arrowTab( event )
		x = eming.x
		y = eming.y
		if (event.target.name == "jump") then
			audio.play(explosionSound2)

			if (arrow[4] == "left") then
				transition.to(eming, {time=250, x=(x-130), y=(y-130)})
			else
			    transition.to(eming, {time=250, x=(x+150), y=(y-120)})
			end
			
		else
			if (event.target.name == arrow[4]) then
			    if (event.target.name == "left") then
			       transition.to(eming, {time=100, x=(x-50)})
			    else
			       transition.to(eming, {time=100, x=(x+50)})
			    end
			 else
			    arrow[4] = event.target.name
			    eming:scale(-1, 1)
			    physics.removeBody(eming)

			    if (event.target.name == "left") then
			       physics.addBody(eming, {friction=1, outline=eming_outline_flip})
			       transition.to(eming, {time=100, x=(x-50)})
			    else
			       physics.addBody(eming, {friction=1, outline=eming_outline_none})
			       transition.to(eming, {time=100, x=(x+50)})
			    end
			    eming.isFixedRotation = true
				end
		end
	end

	for i = 1, 3 do
		arrow[i]:addEventListener("tap", arrowTab)
		sceneGroup:insert(arrow[i])
	end


	-- 벽 충돌 설정 --

	local flag = false

	function wallCollision(self, event)
		if(event.phase == "ended" and flag == false) then
			if(event.other.name == "up") then
				flag = true

				timer.performWithDelay(1, function()
										physics.removeBody(ozone)
										physics.removeBody(eming)

										for i = 1, #cloud do 
											physics.removeBody(cloud[i])
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										composer.gotoScene('game_ascension.phase2_2')
									end, 1)

			elseif(event.other.name == "down") then
				flag = true
				timer.performWithDelay(1, function()
										physics.removeBody(eming)

										for i = 1, #cloud do 
											physics.removeBody(cloud[i])
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										composer.gotoScene('game_ascension.phase1_2')
									end, 1)

			end
		end
	end

	eming.collision = wallCollision
	eming:addEventListener('collision')


	function set:tap( event )
		audio.play(explosionSound3)

		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

		composer.setVariable("phase", "phase2_1")
		composer.setVariable("eming", eming)
		composer.setVariable("save", ozone)
		composer.setVariable("wall", wall)
		composer.setVariable("cloud", cloud)

 		composer.showOverlay('game_ascension.ascension_setting', options)
 	end
 	set:addEventListener("tap", set)

 	function item:tap( event )
 		audio.play(explosionSound3)

 		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

 		composer.showOverlay('items0', options)
 	end
 	item:addEventListener("tap", item)

 	function guide:tap( event )
 		audio.play(explosionSound3)
 		
 		local options = {
		    isModal = true,
		    effect = "fade",
		    time = 400,
		    params = {}
		}

 		composer.showOverlay('game_ascension.ascension_info', options)
 	end
 	guide:addEventListener("tap", guide)

 	menuGroup:insert(set)
	menuGroup:insert(guide)
	menuGroup:insert(item)

	sceneGroup:insert(menuGroup)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)

		composer.removeScene('game_ascension.phase2_1')

	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene