HAT_BASE_RADIUS = 70
HAT_BASE_OUTLINE = 5
HAT_HEAD_RADIUS = 30
HAT_HEAD_OUTLINE = 5

HAT_BASE_COLOR = {50, 50, 50}
HAT_HEAD_COLOR = {150, 150, 150}

TRIGGER_WIDTH = 150
TRIGGER_HEIGHT = 50
TRIGGER_OUTLINE = 5


function draw_hat(hat)
	love.graphics.setColor(unpack(HAT_BASE_COLOR))
	love.graphics.circle("fill", hat.x, hat.y, HAT_BASE_RADIUS)
	love.graphics.setColor(unpack(darker(HAT_BASE_COLOR, 50)))
	love.graphics.circle("fill", hat.x, hat.y, HAT_BASE_RADIUS - HAT_BASE_OUTLINE)

	love.graphics.setColor(unpack(HAT_HEAD_COLOR))
	love.graphics.circle(
		"fill",
		hat.x + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hx,
		hat.y + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hy,
		HAT_HEAD_RADIUS
	)
	if hat.pressed then
		love.graphics.setColor(unpack(darker(HAT_HEAD_COLOR, 50)))
	else
		love.graphics.setColor(unpack(darker(HAT_HEAD_COLOR, 100)))
	end
	love.graphics.circle(
		"fill",
		hat.x + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hx,
		hat.y + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hy,
		HAT_HEAD_RADIUS - HAT_HEAD_OUTLINE
	)
end

function draw_trigger(trigger)
	love.graphics.setColor(unpack(trigger.color))
	love.graphics.rectangle("fill", trigger.x - TRIGGER_WIDTH/2, trigger.y - TRIGGER_HEIGHT/2, TRIGGER_WIDTH, TRIGGER_HEIGHT)
	love.graphics.setColor(unpack(darker(trigger.color, 30)))
	love.graphics.rectangle(
		"fill",
		trigger.x - TRIGGER_WIDTH/2 + TRIGGER_OUTLINE,
		trigger.y - TRIGGER_HEIGHT/2 + TRIGGER_OUTLINE,
		TRIGGER_WIDTH - 2*TRIGGER_OUTLINE,
		TRIGGER_HEIGHT - 2*TRIGGER_OUTLINE
	)
	love.graphics.setColor(unpack(darker(trigger.color, 10)))
	if trigger.reversed then
		love.graphics.rectangle(
			"fill",
			trigger.x + TRIGGER_WIDTH/2 - TRIGGER_OUTLINE + (TRIGGER_WIDTH - 2*TRIGGER_OUTLINE) * -trigger.v,
			trigger.y - TRIGGER_HEIGHT/2 + TRIGGER_OUTLINE,
			(TRIGGER_WIDTH - 2*TRIGGER_OUTLINE) * trigger.v,
			(TRIGGER_HEIGHT - 2*TRIGGER_OUTLINE)
		)
	else
		love.graphics.rectangle(
			"fill",
			trigger.x - TRIGGER_WIDTH/2 + TRIGGER_OUTLINE,
			trigger.y - TRIGGER_HEIGHT/2 + TRIGGER_OUTLINE,
			(TRIGGER_WIDTH - 2*TRIGGER_OUTLINE) * trigger.v,
			(TRIGGER_HEIGHT - 2*TRIGGER_OUTLINE)
		)
	end
end
