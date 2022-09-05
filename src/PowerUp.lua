PowerUp = Class{}

function PowerUp:init(x, y, type)
	
	self.x = x
	self.y = y
	self.dy = 0

	self.width = 16
	self.height = 16

	self.inPlay = false

	self.type = type or math.random(1,10)
end

function PowerUp:collides(target)
	-- if not in play we don't need to check
	if self.inPlay == false then
		return 0
	end

    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return 0
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return 0
    end 

    -- if the above aren't true, they're overlapping
    self.inPlay = false

    return self.type
end

function PowerUp:update(dt)
	self.y = self.y + self.dy * dt
end

function PowerUp:render()
	if self.inPlay then
		love.graphics.draw(gTextures['main'], gFrames['powerUps'][self.type], self.x + 8, self.y + 8)
	end
end
