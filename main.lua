BUTTON_RADIUS = 30
BUTTON_OUTLINE = 5

S_BUTTON_WIDTH = 30
S_BUTTON_HEIGHT = 20
S_BUTTON_OUTLINE = 5

function darker(color, n)
	return {color[1] - n, color[2] - n, color[3] - n}
end

function draw_button(button)
	love.graphics.setColor(unpack(button.color))
	love.graphics.circle("fill", button.x, button.y, BUTTON_RADIUS)
	if button.pressed then 
		love.graphics.setColor(unpack(darker(button.color, 50)))
	else
		love.graphics.setColor(unpack(darker(button.color, 100)))
	end
	love.graphics.circle("fill", button.x, button.y, BUTTON_RADIUS - BUTTON_OUTLINE)
end

function draw_special_button(button)
	love.graphics.setColor(unpack(button.color))
	love.graphics.rectangle(
		"fill",
		button.x - S_BUTTON_WIDTH/2,
		button.y - S_BUTTON_HEIGHT/2,
		S_BUTTON_WIDTH,
		S_BUTTON_HEIGHT
	)
	if button.pressed then
		love.graphics.setColor(unpack(darker(button.color, 10)))
	else
		love.graphics.setColor(unpack(darker(button.color, 30)))
	end
	love.graphics.rectangle(
		"fill",
		button.x - S_BUTTON_WIDTH/2 + S_BUTTON_OUTLINE,
		button.y - S_BUTTON_HEIGHT/2 + S_BUTTON_OUTLINE,
		S_BUTTON_WIDTH - 2*S_BUTTON_OUTLINE,
		S_BUTTON_HEIGHT - 2*S_BUTTON_OUTLINE
	)
end

b_a = {x = 600, y = 350, color = {0, 150, 0}, pressed = false}
b_b = {x = 650, y = 300, color = {150, 0, 0}, pressed = false}
b_x = {x = 550, y = 300, color = {0, 0, 150}, pressed = false}
b_y = {x = 600, y = 250, color = {150, 150, 0}, pressed = false}

buttons = {b_a, b_b, b_x, b_y}

b_start = {x = 450, y = 300, color = {50, 50, 50}, pressed = false}
b_select = {x = 350, y = 300, color = {50, 50, 50}, pressed = false}

function love.load()
	local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
end

function love.update(dt)
	if not joystick then return end
	for i, button in ipairs(buttons) do
		button.pressed = joystick:isDown(i)
	end
end

function love.draw()
	for i, button in ipairs(buttons) do
		draw_button(button)
	end
	draw_special_button(b_start)
	draw_special_button(b_select)
end
