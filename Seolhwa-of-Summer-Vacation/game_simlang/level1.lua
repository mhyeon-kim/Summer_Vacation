-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local timeAttack

function scene:create( event )
	local sceneGroup = self.view

	local settingGroup = display.newGroup()

	local explosionSound = audio.loadSound( "sound/Over the hill.mp3" )
	audio.play(explosionSound, {channel=1, loops=-1})
	--배경음악 설정
	audio.setMaxVolume(1, { channel=1 })
	audio.setVolume(0.5, {channel=1})

	local explosionSound2 = audio.loadSound( "sound/코드39.wav" )

	local explosionSound3 = audio.loadSound( "sound/스위치_랜턴_버튼.mp3" )

	local clickSound = audio.loadSound( "sound/카툰코드음14.wav" )
	
	
	local levelText2
	local startGroup = display.newGroup()

	--시작 화면---------------------
	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local textStart=display.newImage("image/simlang_image/천생연분_시작버튼X.png")
	textStart.x,textStart.y=display.contentWidth/2, display.contentHeight*0.5

	local button = display.newImageRect("image/simlang_image/시작버튼.png",450,90)
	button.x,button.y=display.contentWidth/2, display.contentHeight*0.78
	

	 local startTalk = display.newText("심랑의 색, 특징, 그리고 생김새를 유심히 살펴보렴.", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
	 startTalk:setFillColor(0)
	 startTalk.size=30

	 local nameBack =display.newImageRect("image/dialogue/이름.png",200,50)
	 nameBack.x,nameBack.y = display.contentWidth*0.3, display.contentHeight*0.8
	 

	 local name = display.newText("유영", display.contentWidth*0.3, display.contentHeight*0.8,"font/경기천년바탕_Regular.ttf")
	 startTalk:setFillColor(0)
	 name:setFillColor(0)
	 name.size=30

	 startGroup:insert(nameBack)
	 startGroup:insert(name)
	 startGroup:insert(time)
	 startGroup:insert(textStart)
	 startGroup:insert(button)
	 startGroup:insert(startTalk)
	 
	-- 이미지 불러오기 ----
	

	local levelText = display.newText("1단계)어디에 있을까?", display.contentWidth*0.5, display.contentHeight*0.9, "font/경기천년바탕_Regular.ttf")
	levelText:setFillColor(0)
	levelText.size=30
	levelText.alpha=0

	
	
	local background = display.newImageRect("image/background/수화산정상.png", display.contentWidth, display.contentHeight)
	background.x,background.y=display.contentCenterX, display.contentCenterY

	local cardgroup= display.newGroup()
	-- local back = display.newImageRect("image/p9_1.png",display.contentWidth, display.contentHeight)
	-- back.x, back.y = display.contentWidth*0.5, display.contentHeight*0.5

	

	local setting1 = display.newImage("image/public/설정.png")
	setting1.x, setting1.y = display.contentWidth * 0.05, display.contentHeight * 0.09

	local face = display.newImage("image/public/지천얼굴.png")
	face.x, face.y = display.contentWidth * 0.853, display.contentHeight * 0.09

	local item = display.newImage("image/public/아이템.png")
	item.x, item.y = display.contentWidth * 0.95, display.contentHeight * 0.09

	local c1 = display.newImageRect("image/simlang_image/유영.png",170,410)
	c1.x,c1.y = display.contentWidth*0.151, display.contentHeight*0.71
	
	local c2 = display.newImageRect("image/simlang_image/심랑.png",170,410)
	c2.x,c2.y = display.contentWidth*0.8486, display.contentHeight*0.71

	local c3 = display.newImageRect("image/simlang_image/심랑_눈물.png",170,410)
	c3.x,c3.y = display.contentWidth*0.8486, display.contentHeight*0.71
	c3.alpha=0

	local c4 = display.newImageRect("image/character/유영당황.png",170,410)
	c4.x,c4.y = display.contentWidth*0.151, display.contentHeight*0.71
	c4.alpha=0

	
	local c5 = display.newImageRect("image/character/심랑_신난,완전체.png",170,410)
	c5.x,c5.y = display.contentWidth*0.8486, display.contentHeight*0.71
	c5.alpha=0

	local c6 = display.newImageRect("image/character/유영웃는.png",170,410)
	c6.x,c6.y = display.contentWidth*0.151, display.contentHeight*0.71
	c6.alpha=0

	local board = display.newImageRect("image/simlang_image/1단계배경.png",680,400)
    board.x,board.y=display.contentWidth*0.5, display.contentHeight*0.48

	-- local board = display.newImageRect("image/simlang_image/보드.png",680,400)
	-- board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.48

	local time= display.newText(10, display.contentWidth/2, display.contentHeight*0.12)
	time.size = 50

	local timeBoard = display.newRoundedRect(display.contentWidth/2, display.contentHeight*0.1, 100,100, 5)
	timeBoard:setFillColor(0.6, 0.5, 0.5)

	local timerText =  display.newText("timer", display.contentWidth*0.5, display.contentHeight*0.05, "font/경기천년바탕_Regular.ttf")
	timerText.size=20

--------
	local card1 = display.newImageRect("image/simlang_image/빨간색.png",300,180)
	card1.x,card1.y= display.contentWidth*0.37, display.contentHeight*0.34
--------
	local card2 = display.newImageRect("image/simlang_image/파랑.png",300,180)
	card2.x,card2.y= display.contentWidth*0.63, display.contentHeight*0.34

-------
	local card3 = display.newImageRect("image/simlang_image/노란색(정답).png",300,180)
	card3.x,card3.y= display.contentWidth*0.37, display.contentHeight*0.62

	
-------
	local card4 = display.newImageRect("image/simlang_image/흰색.png",300,180)
	card4.x,card4.y= display.contentWidth*0.63, display.contentHeight*0.62

------
	-- local level = display.newImageRect("image/simlang_image/단계.png",670,120)
	-- level.x,level.y= display.contentWidth*0.5, display.contentHeight*0.89

	------이미지 불러오기 끝 ----------------

	----설정창 이미지 불러오기 및 그룹넣고 레이어 정리----------
	local background3 = display.newImage("image/setting/설정창바탕.png")
	-- background3.strokeWidth = 5
	-- background3:setStrokeColor(0.5, 0.5, 0.5)
	background3.x, background3.y = display.contentCenterX, display.contentCenterY

	local replay = display.newImage("image/setting/2클릭.png")
	replay.x, replay.y = display.contentWidth * 0.5, display.contentHeight * 0.3

	local detail = display.newImage("image/setting/3클릭.png")
	detail.x, detail.y = display.contentWidth * 0.5, display.contentHeight * 0.5

	local out = display.newImage("image/setting/4클릭.png")
	out.x, out.y = display.contentWidth * 0.5, display.contentHeight * 0.7

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

    local button1 = display.newImage("image/public/X.png")
	button1.x,button1.y=display.contentWidth*0.645,display.contentHeight*0.17


	local dialogue = display.newImageRect("image/dialogue/대사창.png",720,160)
	dialogue.x,dialogue.y= display.contentWidth*0.5, display.contentHeight*0.89
	
	settingGroup:insert(background3)
	settingGroup:insert(replay)
	settingGroup:insert(detail)
	settingGroup:insert(sound1)
	settingGroup:insert(sound2)
	settingGroup:insert(sound3)
    settingGroup:insert(out)
	settingGroup:insert(button1)

	settingGroup.alpha=0
	-------------------------------event 정리--------------------------
	
	function detail:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		detail.alpha = 0
		sound1.alpha = 1
		sound2.alpha = 1
		sound3.alpha = 1
	end
	detail:addEventListener("tap", detail)


	function sound1:tap ( event )
		audio.setVolume(0, {channel=1})
	end
	sound1:addEventListener("tap", sound1)

	function sound2:tap ( event )
		audio.setVolume(0.5, {channel=1})
	end
	sound2:addEventListener("tap", sound2)

	function sound3:tap ( event )
		audio.setVolume(1, {channel=1})
	end
	sound3:addEventListener("tap", sound3)

	-- function replay:tap( event )
	-- 	audio.play(explosionSound3, {duration = 1000})
	-- 	audio.play(click)
 	-- 	composer.hideOverlay('fade', 400)
 	-- end
 	-- replay:addEventListener("tap", replay)

	function replay:tap( event )
	 	audio.play(explosionSound3, {duration = 1000})
         composer.removeScene('game_simlang.level1')
	 	composer.gotoScene('game_simlang.level1')
 	end
 	replay:addEventListener("tap", replay)

     function button1:tap( event )
		audio.play(explosionSound3, {duration = 1000})
        timer.resume(timeAttack)
		
		card2:addEventListener("tap", card2)
		card3:addEventListener("tap", card3)
		card4:addEventListener("tap", card4)
		card1:addEventListener("tap", card1)

		settingGroup.alpha=0
	end
	button1:addEventListener("tap", button1)

	function out:tap( event )
		audio.pause(explosionSound)
		audio.play(explosionSound3, {duration = 1000})		
        composer.removeScene('game_simlang.level1')
		composer.gotoScene('start')
 	end
 	out:addEventListener("tap", out)

	----------------------------------------------------------------------

	-----레이어 정리-----------
	sceneGroup:insert(background)
	--sceneGroup:insert(back)
	sceneGroup:insert(face)
	
	sceneGroup:insert(item)
	sceneGroup:insert(setting1)
	sceneGroup:insert(board)
	
	sceneGroup:insert(card1)
	sceneGroup:insert(card2)
	sceneGroup:insert(card3)
	sceneGroup:insert(card4)
	sceneGroup:insert(dialogue)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(c4)
	sceneGroup:insert(c5)
	sceneGroup:insert(c6)
	--sceneGroup:insert(level)	
	sceneGroup:insert(levelText)
	sceneGroup:insert(timeBoard)
	sceneGroup:insert(timerText)
	sceneGroup:insert(time)

	

	--레이어 정리 끝 -------------

	

	
	sceneGroup:insert(startGroup)


	--tap 확대 event------------------------------------------------
	function card1:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
---------------------
	function card2:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
--------------------
	function card3:tap( event )
		time.alpha = 0
		audio.play(explosionSound2)
		--audio.pause(explosionSound)
		timer.pause(timeAttack)
		c2.alpha=0
		c5.alpha=1
		c1.alpha=0
		c6.alpha=1
		levelText.alpha=0
		levelText2 = display.newText("찾기 성공! 1단계 통과~~", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30

		sceneGroup:insert(levelText2)
	local board = display.newImage("image/simlang_image/성공.png")
	board.x,board.y= display.contentWidth*0.5, display.contentHeight*0.5

    
	

 	sceneGroup:insert(board)

	card1:removeEventListener("tap", card1)
	card2:removeEventListener("tap", card2)
	card3:removeEventListener("tap", card3)
	card4:removeEventListener("tap", card4)
	
		--composer.showOverlay('game_simlang.popup')
	function  board:tap( event )
		audio.play(explosionSound3, {duration = 1000})
		composer.removeScene('game_simlang.level1')
		composer.gotoScene('game_simlang.level2')
		timer.cancel(timeAttack)
	end
	board:addEventListener("tap",  board)
	
	
	
	

	
	end
	
----------------
	function card4:tap( event )
		time.alpha = 0
		audio.play(clickSound)
		c2.alpha=0
		c3.alpha=1
		c1.alpha=0
		c4.alpha=1
		--audio.pause(explosionSound)
		composer.showOverlay('game_simlang.fail')
		levelText.alpha=0
		levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
		levelText2:setFillColor(0)
		levelText2.size=30
		sceneGroup:insert(levelText2)	
		timer.cancel(timeAttack)
		card1:removeEventListener("tap", card1)
		card2:removeEventListener("tap", card2)
		card3:removeEventListener("tap", card3)
		card4:removeEventListener("tap", card4)
	end
	
--------------
function button:tap( event )
	startGroup.alpha=0
	levelText.alpha=1

	

		--timer event-------------------------
	local function counter( event )
		time.text = time.text - 1

		if( time.text == '5' ) then
			time:setFillColor(1, 0, 0)
		end

		if( time.text == '-1') then
			time.alpha = 0
			audio.pause(explosionSound)
			composer.showOverlay('game_simlang.fail')
			levelText.alpha=0
			levelText2 = display.newText("다시 시도해보자 ㅠㅠ", display.contentWidth*0.5, display.contentHeight*0.9,"font/경기천년바탕_Regular.ttf")
			levelText2:setFillColor(0)
			levelText2.size=30

			sceneGroup:insert(levelText2)
			
		end
	end

	timeAttack = timer.performWithDelay(1000, counter, 11)   

	card1:addEventListener("tap", card1)
	card2:addEventListener("tap", card2)
	card3:addEventListener("tap", card3)
	card4:addEventListener("tap", card4)
end
button:addEventListener("tap", button)
		
function setting1:tap( event )
	settingGroup.alpha=1
	timer.pause(timeAttack)
	audio.play(explosionSound3, {duration = 1000})
	card1:removeEventListener("tap", card1)
	card2:removeEventListener("tap", card2)
	card3:removeEventListener("tap", card3)
	card4:removeEventListener("tap", card4)	
end
setting1:addEventListener("tap", setting1)

function face:tap( event )
	audio.play(explosionSound3, {duration = 1000})
	timer.pause(timeAttack)
	composer.setVariable( "timeAttack2", timeAttack )

	composer.showOverlay('game_simlang.jichunface')
end
face:addEventListener("tap", face)

function item:tap( event )
	audio.play(explosionSound3, {duration = 1000})
	timer.pause(timeAttack)
	composer.setVariable( "timeAttack3", timeAttack )
	composer.showOverlay('game_simlang.item')
end
item:addEventListener("tap", item)

sceneGroup:insert(settingGroup)
settingGroup:toFront()

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
		composer.removeScene('game_simlang.level1')
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene