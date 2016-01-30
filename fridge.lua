class "Fridge" {
	width = 0;
	height = 0;
}

function Fridge:__init(x, y, player)
	self.x = x
	self.y = y
	self.width = 100
	self.height = 50
	self.timeToUse = 0
	self.player = player
end

function Fridge:draw(offsetx, offsety)
	local playerEaten = self.player:getEaten()
	if playerEaten > 50 then
		love.graphics.setColor(0, 192, 255, 255)
		love.graphics.rectangle("line", self.x + 5, self.y + 5, self.width - 10, self.height / 5)
	else
		love.graphics.setColor(255 - playerEaten, 0, 255, 255)
		love.graphics.rectangle("line", self.x + 5 - ((playerEaten % 4) - 2), self.y + 5 - ((playerEaten % 4) - 2), 
																		self.width - 10 + 2 * ((playerEaten % 4) - 2), self.height / 5 + 2 * ((playerEaten % 4) - 2))
		--love.graphics.rectangle("line", self.x + 5 - ((playerSleep % 4) - 2), self.y + 5 - ((playerSleep % 4) - 2), 
		--																self.width - 10 + 2 * ((playerSleep % 4) - 2), self.height / 5 self.height + 2 * ((playerSleep % 4) - 2))
	end
	
	love.graphics.setColor(128, 128, 255, 255)
	--love.graphics.rectangle("line", self.x + 5, self.y + 5, self.width - 10, self.height / 5)
	love.graphics.rectangle("line", self.x + 5, self.y + 10 + self.height / 5, self.width - 10, self.height - 15 - self.height/5)
end

function Fridge:update(dt)
	self.timeToUse = self.timeToUse + dt
end

function Fridge:getSize()
  return self.width, self.height
end

function Fridge:getWidth()
  return self.width
end

function Fridge:getHeight()
  return self.height
end

function Fridge:getType()
	return "Fridge"
end

function Fridge:checkCollision(x, y, width, height)
	if x >= self.x and x <= self.x + self. width and y >= self.y and y <= self.y + self.height then
		return true
	end
	
	return false
end

function Fridge:use(player)
	if self.player:getEaten() < 50 then
		self.player:eat(50)
	end
end
