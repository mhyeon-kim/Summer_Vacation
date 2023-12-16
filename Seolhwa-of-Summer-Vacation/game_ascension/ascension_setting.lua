-----------------------------------------------------------------------------------------
--
-- ascension_setting.lua
-- 이밍 승천 게임 설정창
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	physics.start()

	-- 효과음 설정
	click = audio.loadSound("sound/B. 일반 버튼_스위치_랜턴_버튼_mp3.mp3")
	
	-- 배경 --
	local background = display.newImage("image/game_ascension/이밍창바탕.png")
	background.x, background.y = display.contentCenterX, display.contentCenterY


	-- 다시하기 버튼 --
	local replay = display.newImage("image/setting/다시하기1.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3


	-- 세부설정 버튼 --
	local detail = display.newImage("image/setting/세부설정1.png")
	detail.x, detail.y = display.contentWidth * 0.5, display.contentHeight * 0.5


	-- 나가기 버튼 --
	local out = display.newImage("image/setting/나가기1.png")
	out.x, out.y = display.contentWidth * 0.5, display.contentHeight * 0.7


	-- X 버튼 --
	local x = display.newImage("image/public/X.png")
	x.x, x.y = display.contentWidth * 0.645, display.contentHeight * 0.17


	-- 소리 설정 --
	local sound1 = display.newRect(display.contentWidth * 0.4, display.contentHeight * 0.5, 50, 50)
	sound1.alpha = 0
	sound1.fill = {
		type = "image",
		filename = "image/setting/스피커1.png"
	}

	local sound2 = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, 50, 50)
	sound2.alpha = 0
	sound2.fill = {
		type = "image",
		filename = "image/setting/스피커2.png"
	}

	local sound3 = display.newRect(display.contentWidth * 0.6, display.contentHeight * 0.5, 50, 50)
	sound3.alpha = 0
	sound3.fill = {
		type = "image",
		filename = "image/setting/스피커3.png"
	}


	function detail:tap( event )
		audio.play(click)
		detail.alpha = 0
		sound1.alpha = 1
		sound2.alpha = 1
		sound3.alpha = 1
	end
	detail:addEventListener("tap", detail)

	function sound1:tap ( event )
		audio.play(click)
		audio.setVolume(0, {channel=1})
		audio.setVolume(0, click)
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.play(click)
		audio.setVolume(0.5, {channel=1})
		audio.setVolume(0.4, click)
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.play(click)
		audio.setVolume(1, {channel=1})
		audio.setVolume(1, click)
	end
	sound3:addEventListener("tap", sound3)

	
	-- 다시하기 클릭시 > 미니게임 재시작 --
	function replay:tap( event )
		audio.play(click)

 		local phase = composer.getVariable("phase")

 		local eming = composer.getVariable("eming")
 		local wall = composer.getVariable("wall")
 		local cloud = composer.getVariable("cloud")

 		save = nil
 		if phase == "phase1_1" or phase == "phase2_1" or phase == "phase_clear" then
 			save = composer.getVariable("save")
 		end

		timer.performWithDelay(1, function()
										-- 물리엔진 삭제 --
										if save ~= nil then
											physics.removeBody(save)
										end

										physics.removeBody(eming)

										if cloud ~= nil then
											for i = 1, #cloud do 
												physics.removeBody(cloud[i])
											end
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										-- 다음화면으로 넘어가기 --
										composer.removeScene('game_ascension.' .. phase, true)
 										composer.gotoScene('game_ascension.phase1_1')
									end, 1)
 	end
 	replay:addEventListener("tap", replay)

 	-- 나가기 클릭시 > start 화면 --
 	function out:tap( event )
 		audio.play(click)

 		local phase = composer.getVariable("phase")

 		local eming = composer.getVariable("eming")
 		local wall = composer.getVariable("wall")
 		local cloud = composer.getVariable("cloud")

 		save = nil
 		if phase == "phase1_1" or phase == "phase2_1" or phase == "phase_clear" then
 			save = composer.getVariable("save")
 		end

 		timer.performWithDelay(1, function()
 										-- 물리엔진 삭제 --
										if save ~= nil then
											physics.removeBody(save)
										end

										physics.removeBody(eming)

										if cloud ~= nil then
											for i = 1, #cloud do 
												physics.removeBody(cloud[i])
											end
										end

										for i = 1, #wall do
											physics.removeBody(wall[i])
										end

										-- 화면 이동 --
										composer.removeScene('game_ascension.' .. phase, true)
 										composer.gotoScene('start')
									end, 1)
 	end
 	out:addEventListener("tap", out)

 	-- X 클릭 --
 	function x:tap( event )
		audio.play(click)
		composer.hideOverlay('fade', 400)
	end
	x:addEventListener("tap", x)


	-- 레이어 정리 --
 	sceneGroup:insert(background)
 	sceneGroup:insert(replay)
 	sceneGroup:insert(detail)
 	sceneGroup:insert(sound1)
 	sceneGroup:insert(sound2)
 	sceneGroup:insert(sound3)
 	sceneGroup:insert(out)
 	sceneGroup:insert(x)
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