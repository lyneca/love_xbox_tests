function darker(color, n)
	return {color[1] - n, color[2] - n, color[3] - n}
end

function colorfrac(current, target, amount)
	return {
		current[0] + (target[0] - current[0]) * amount,
		current[1] + (target[1] - current[1]) * amount,
		current[2] + (target[2] - current[2]) * amount,
	}
end

function relx(x)
	--return (x / 800) * love.graphics.getWidth()
	return x
end

function rely(y)
	--return (y / 600) * love.graphics.getHeight()
	return y
end
