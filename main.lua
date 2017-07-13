require('utils')
require('buttons')
require('hats')

b_a = {t = 0, x = 620, y = 350, color = {0, 150, 0}, pressed = false}
b_b = {t = 0, x = 670, y = 300, color = {150, 0, 0}, pressed = false}
b_x = {t = 0, x = 570, y = 300, color = {0, 0, 150}, pressed = false}
b_y = {t = 0, x = 620, y = 250, color = {150, 150, 0}, pressed = false}

b_shoulder_left  = {t = 1, x = 600, y = 150, color = {100, 100, 100}, pressed = false}
b_shoulder_right = {t = 1, x = 200, y = 150, color = {100, 100, 100}, pressed = false}

b_start = {t = 2, x = 470, y = 300, color = {50, 50, 50}, pressed = false}
b_back  = {t = 2, x = 330, y = 300, color = {50, 50, 50}, pressed = false}

left_hat  = {x = 180, y = 300, hx = 0, hy = 0, xa = 1, ya = 2}
right_hat = {x = 500, y = 450, hx = 0, hy = 0, xa = 4, ya = 5}

buttons = {b_a, b_b, b_x, b_y, b_shoulder_right, b_shoulder_left, b_back, b_start}
hats = {left_hat, right_hat}

debugs = {}

function print_debugs()
	love.graphics.setColor(255, 255, 255)
	for i, message in ipairs(debugs) do
		love.graphics.print(message, 0, 15 * i)
	end
end

function love.load()
	local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
end

function love.update(dt)
	if not joystick then return end
	for i, button in ipairs(buttons) do
		if button then 
			button.pressed = joystick:isDown(i)
		end
	end
	debugs = {}
	for i, hat in ipairs(hats) do
		hat.hx = joystick:getAxis(hat.xa)
		hat.hy = joystick:getAxis(hat.ya)
	end
end

function love.draw()
	for i, button in ipairs(buttons) do
		draw_button(button)
	end
	for i, hat in ipairs(hats) do
		draw_hat(hat)
	end
	print_debugs()
end
