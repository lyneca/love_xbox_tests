BUTTON_RADIUS = 30
BUTTON_OUTLINE = 5

S_BUTTON_WIDTH = 30
S_BUTTON_HEIGHT = 20
S_BUTTON_OUTLINE = 5

SHOULDER_BUTTON_WIDTH = 70
SHOULDER_BUTTON_HEIGHT = 30
SHOULDER_BUTTON_OUTLINE = 5

DPAD_BUTTON_WIDTH = 42
DPAD_BUTTON_HEIGHT = 30
DPAD_BUTTON_OUTLINE = 5

function draw_button(button)
	if not button then return end
	if button.t == 0 then
		draw_face_button(button)
	elseif button.t == 1 then
		draw_shoulder_button(button)
	elseif button.t == 2 then
		draw_special_button(button)
	elseif button.t == 3 then
		draw_dpad_button(button)
	elseif button.t == 4 then
		love.graphics.setColor(unpack(button.color))
		love.graphics.circle("fill", button.x, button.y, BUTTON_RADIUS * 1.2)
		if button.pressed then 
			love.graphics.setColor(unpack(darker(button.color, 50)))
		else
			love.graphics.setColor(unpack(darker(button.color, 100)))
		end
		love.graphics.circle("fill", button.x, button.y, BUTTON_RADIUS*1.2 - BUTTON_OUTLINE)
	end
end

function draw_face_button(button)
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

function draw_shoulder_button(button)
	love.graphics.setColor(unpack(button.color))
	love.graphics.rectangle(
		"fill",
		button.x - SHOULDER_BUTTON_WIDTH/2,
		button.y - SHOULDER_BUTTON_HEIGHT/2,
		SHOULDER_BUTTON_WIDTH,
		SHOULDER_BUTTON_HEIGHT
	)
	if button.pressed then
		love.graphics.setColor(unpack(darker(button.color, 10)))
	else
		love.graphics.setColor(unpack(darker(button.color, 30)))
	end
	love.graphics.rectangle(
		"fill",
		button.x - SHOULDER_BUTTON_WIDTH/2 + SHOULDER_BUTTON_OUTLINE,
		button.y - SHOULDER_BUTTON_HEIGHT/2 + SHOULDER_BUTTON_OUTLINE,
		SHOULDER_BUTTON_WIDTH - 2*SHOULDER_BUTTON_OUTLINE,
		SHOULDER_BUTTON_HEIGHT - 2*SHOULDER_BUTTON_OUTLINE
	)
end

-- man this next bit is disgusting, I should learn to DRY

function draw_dpad_button(button)
	love.graphics.setColor(button.color)
	if button.rot == 0 then
		love.graphics.rectangle(
			"fill",
			button.x - DPAD_BUTTON_WIDTH/2,
			button.y - DPAD_BUTTON_HEIGHT/2,
			DPAD_BUTTON_WIDTH,
			DPAD_BUTTON_HEIGHT
		)
		if button.pressed then 
			love.graphics.setColor(unpack(darker(button.color, 10)))
		else
			love.graphics.setColor(unpack(darker(button.color, 30)))
		end
		love.graphics.rectangle(
			"fill",
			button.x - DPAD_BUTTON_WIDTH/2 + DPAD_BUTTON_OUTLINE,
			button.y - DPAD_BUTTON_HEIGHT/2 + DPAD_BUTTON_OUTLINE,
			DPAD_BUTTON_WIDTH - 2*DPAD_BUTTON_OUTLINE,
			DPAD_BUTTON_HEIGHT - 2*DPAD_BUTTON_OUTLINE
		)
	else
		love.graphics.rectangle(
			"fill",
			button.x - DPAD_BUTTON_HEIGHT/2,
			button.y - DPAD_BUTTON_WIDTH/2,
			DPAD_BUTTON_HEIGHT,
			DPAD_BUTTON_WIDTH
		)
		if button.pressed then 
			love.graphics.setColor(unpack(darker(button.color, 10)))
		else
			love.graphics.setColor(unpack(darker(button.color, 30)))
		end
		love.graphics.rectangle(
			"fill",
			button.x - DPAD_BUTTON_HEIGHT/2 + DPAD_BUTTON_OUTLINE,
			button.y - DPAD_BUTTON_WIDTH/2 + DPAD_BUTTON_OUTLINE,
			DPAD_BUTTON_HEIGHT - 2*DPAD_BUTTON_OUTLINE,
			DPAD_BUTTON_WIDTH - 2*DPAD_BUTTON_OUTLINE
		)
	end
end
