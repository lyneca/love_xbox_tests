HAT_BASE_RADIUS = 70
HAT_BASE_OUTLINE = 5
HAT_HEAD_RADIUS = 30
HAT_HEAD_OUTLINE = 5

HAT_BASE_COLOR = {50, 50, 50}
HAT_HEAD_COLOR = {150, 150, 150}

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
	love.graphics.setColor(unpack(darker(HAT_HEAD_COLOR, 100)))
	love.graphics.circle(
		"fill",
		hat.x + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hx,
		hat.y + (HAT_BASE_RADIUS - HAT_HEAD_RADIUS - HAT_BASE_OUTLINE) * hat.hy,
		HAT_HEAD_RADIUS - HAT_HEAD_OUTLINE
	)
end
