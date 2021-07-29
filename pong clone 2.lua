-- title:  pong clone 2
-- author: game developer
-- desc:   short description
-- script: lua

PlrOne = {
	pos = {
		x = 0,
		y = 0,
	},
	spriteNum = 00,
	minY = 0,
	maxY = 115,
	speed = 3
}

PlrTwo = {
	pos = {
		x = 220,
		y = 0,
	},
	spriteNum = 01,
	minY = 0,
	maxY = 115,
	speed = 3
}

Ball = {
	pos = {
		x = 115,
		y = 60,
	},
	spriteNum = 02,
  dx = math.random(1, 215),
	dy = math.random(1, 215),
	speed = 0.09
}

function TIC() --game loop
	cls()
	movePlrOne()
	drawPlrOne()
	movePlrTwo()
	drawPlrTwo()
	drawBall()
	ballMvmt()
	bounce()
	drawHalfCourt()


end



function movePlrOne() --movement for player one

	if (btn(1)) then
		PlrOne.pos.y = PlrOne.pos.y + PlrOne.speed
	elseif (btn(0)) then PlrOne.pos.y = PlrOne.pos.y - PlrOne.speed end

	PlrOne.pos.y = checkLimits(
		PlrOne.pos.y, PlrOne.minY, PlrOne.maxY)

end

function movePlrTwo() -- movement for player two

	if (btn(9)) then
		PlrTwo.pos.y = PlrTwo.pos.y + PlrTwo.speed
	elseif (btn(8)) then PlrTwo.pos.y = PlrTwo.pos.y - PlrTwo.speed end

	PlrTwo.pos.y = checkLimits(
		PlrTwo.pos.y, PlrTwo.minY, PlrTwo.maxY)

end

function checkLimits(value, min, max) --checks limits how how high up and down player can move

	if (value > max) then
		value = max
	elseif (value < min) then
		value = min
	end

	return value

end

function drawPlrOne() --sprite of player one
	spr(PlrOne.spriteNum, PlrOne.pos.x, PlrOne.pos.y, -1, 2)
end

function drawPlrTwo() --sprite of player two
	spr(PlrTwo.spriteNum, PlrTwo.pos.x, PlrTwo.pos.y, -1, 2)
end

function drawBall() --sprite of ball
	spr(Ball.spriteNum, Ball.pos.x, Ball.pos.y, -1, 2)
end

function ballMvmt() --ball movement
	Ball.pos.x = Ball.pos.x + Ball.dx * Ball.speed
	Ball.pos.y = Ball.pos.y + Ball.dy * Ball.speed
end



function bounce() --ball bounce
	if Ball.pos.y >= 122 then
    Ball.dy = -Ball.dy * Ball.speed
		Ball.dx = -Ball.dx * Ball.speed
  end
	if Ball.pos.y <= 0 then
    Ball.dy = Ball.dy * Ball.speed
		Ball.dx = Ball.dx * Ball.speed
  end
end










function drawHalfCourt() -- half court
	line(119, 0, 119, 10, 12)
	line(119, 15, 119, 25, 12)
	line(119, 30, 119, 40, 12)
	line(119, 45, 119, 55, 12)
	line(119, 60, 119, 70, 12)
	line(119, 75, 119, 85, 12)
	line(119, 90, 119, 100, 12)
	line(119, 105, 119, 115, 12)
	line(119, 120, 119, 130, 12)
end

-- <TILES>
-- 000:000cc000000cc000000cc000000cc000000cc000000cc000000cc000000cc000
-- 001:0006600000066000000660000006600000066000000660000006600000066000
-- 002:0000000000000000000000000002200000022000000000000000000000000000
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>
