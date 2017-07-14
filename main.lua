require('utils')
require('buttons')
require('hats')

function update_screen_size()
	midx = love.graphics.getWidth() / 2
	midy = love.graphics.getHeight() / 2
end

update_screen_size()

function load_objects()
	b_a = {t = 0, x = midx + relx(220), y = midy + rely(50), color = {0, 150, 0}, pressed = false, c = 0}
	b_b = {t = 0, x = midx + relx(270), y = midy,            color = {150, 0, 0}, pressed = false, c = 0}
	b_x = {t = 0, x = midx + relx(170), y = midy,            color = {0, 0, 150}, pressed = false, c = 0}
	b_y = {t = 0, x = midx + relx(220), y = midy - rely(50), color = {150, 150, 0}, pressed = false, c = 0}

	b_guide = {t = 4, x = midx, y = midy, color = {0, 200, 0}, pressed = false, c = 0}

	b_shoulder_left  = {t = 1, x = midx - relx(200), y = midy - rely(150), color = {100, 100, 100}, pressed = false, c = 0}
	b_shoulder_right = {t = 1, x = midx + relx(200), y = midy - rely(150), color = {100, 100, 100}, pressed = false, c = 0}

	b_start = {t = 2, x = midx + relx(70), y = midy, color = {50, 50, 50}, pressed = false, c = 0}
	b_back  = {t = 2, x = midx - relx(70), y = midy, color = {50, 50, 50}, pressed = false, c = 0}

	left_hat  = {x = midx - relx(220), y = midy,             hx = 0, hy = 0, xa = 1, ya = 2, b = 10, pressed = false}
	right_hat = {x = midx + relx(100), y = midy + rely(150), hx = 0, hy = 0, xa = 4, ya = 5, b = 11, pressed = false}

	left_trigger  = {x = midx - relx(200), y = midy - rely(220), color = {50, 50, 50}, v = 0, a = 3, reversed = true}
	right_trigger = {x = midx + relx(200), y = midy - rely(220), color = {50, 50, 50}, v = 0, a = 6} 

	dp_up    = {t = 3, x = midx - relx(130), y = midy + rely(110), color = {50, 50, 50}, pressed = false, rot = 1, c = 0}
	dp_down  = {t = 3, x = midx - relx(130), y = midy + rely(190), color = {50, 50, 50}, pressed = false, rot = 1, c = 0}
	dp_left  = {t = 3, x = midx - relx(170), y = midy + rely(150), color = {50, 50, 50}, pressed = false, rot = 0, c = 0}
	dp_right = {t = 3, x = midx - relx(90),  y = midy + rely(150), color = {50, 50, 50}, pressed = false, rot = 0, c = 0}

	buttons = {b_a, b_b, b_x, b_y, b_shoulder_left, b_shoulder_right, b_back, b_start, b_guide, false, false, dp_left, dp_right, dp_up, dp_down}
	hats = {left_hat, right_hat}
	triggers = {left_trigger, right_trigger}
end

debugs = {}
events = {}

function debug(message)
	table.insert(debugs, message)
end

function event(message)
	table.insert(events, message)
	if #events >= math.floor(love.graphics.getHeight() / (3 * 15)) then table.remove(events, 1) end
end

function print_debugs()
	love.graphics.setColor(255, 255, 255)
	for i, message in ipairs(debugs) do
		love.graphics.print(message, 0, 15 * i)
	end
end

function print_events()
	w = 10
	h = love.graphics.getHeight() - 15*(#events + 1) - 10
	c = 10 * (math.floor(love.graphics.getHeight() / (3 * 15)) - #events)
	for i, message in ipairs(events) do
		love.graphics.setColor(c, c, c)
		if c < 255 then c = c + 10 end
		love.graphics.print(message, w, h + 15 * i)
	end
end

function love.load()
	font = love.graphics.newFont('notomono.ttf')
	love.graphics.setFont(font)

	event('program started')
	local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
	event('joystick found')
	load_objects()
end

function love.gamepadpressed(joystick, button)
	event('button \'' .. button .. '\' pressed')
end

function love.update(dt)
	if midx ~= love.graphics.getWidth() / 2 or midy ~= love.graphics.getHeight() / 2 then
		update_screen_size()
		load_objects()
	end
	debugs = {}
	if not joystick then return end
	for i, button in ipairs(buttons) do
		if button then 
			if button.c < 1 then
				button.c = button.c + 0.2
			end
			if button.pressed ~= joystick:isDown(i) then button.c = 0 end
			button.pressed = joystick:isDown(i)
		end
	end
	for i, hat in ipairs(hats) do
		hat.hx = joystick:getAxis(hat.xa)
		hat.pressed = joystick:isDown(hat.b)
		hat.hy = joystick:getAxis(hat.ya)
	end
	for i, trigger in ipairs(triggers) do
		trigger.v = (joystick:getAxis(trigger.a) + 1) / 2
	end
end

function love.draw()
	print_events()
	love.graphics.setColor(0, 0, 0, 200)
--	love.graphics.rectangle(
--		"fill",
--		0,
--		0,
--		love.graphics.getWidth(),
--		right_hat.y + HAT_BASE_RADIUS
--	)
	for i, button in ipairs(buttons) do
		if button then
			draw_button(button)
		end
	end
	for i, hat in ipairs(hats) do
		draw_hat(hat)
	end
	for i, trigger in ipairs(triggers) do
		draw_trigger(trigger)
	end
	print_debugs()
end
