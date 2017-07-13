require('utils')
require('buttons')

b_a = {t = 0, x = 600, y = 350, color = {0, 150, 0}, pressed = false}
b_b = {t = 0, x = 650, y = 300, color = {150, 0, 0}, pressed = false}
b_x = {t = 0, x = 550, y = 300, color = {0, 0, 150}, pressed = false}
b_y = {t = 0, x = 600, y = 250, color = {150, 150, 0}, pressed = false}

b_shoulder_left  = {t = 1, x = 600, y = 150, color = {100, 100, 100}, pressed = false}
b_shoulder_right = {t = 1, x = 200, y = 150, color = {100, 100, 100}, pressed = false}

b_start = {t = 2, x = 450, y = 300, color = {50, 50, 50}, pressed = false}
b_back  = {t = 2, x = 350, y = 300, color = {50, 50, 50}, pressed = false}

buttons = {b_a, b_b, b_x, b_y, b_shoulder_right, b_shoulder_left, b_back, b_start}

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
end

function love.draw()
	for i, button in ipairs(buttons) do
		draw_button(button)
	end
end
