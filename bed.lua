class "Bed" {
	width = 0;
	height = 0;
}

function Bed:__init(x, y, player)
	self.x = x
	self.y = y
	self.width = 100
	self.height = 200
	self.timeToUse = 0
	self.player = player
end

function Bed:draw(offsetx, offsety)
	local playerSleep = self.player:getSleep()
	if playerSleep > 50 then
		love.graphics.setColor(0, 192, 0, 255)
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	else
		love.graphics.setColor(255 - playerSleep, 0, 0, 255)
		love.graphics.rectangle("line", self.x - ((playerSleep % 4) - 2), self.y - ((playerSleep % 4) - 2), 
																		self.width + 2 * ((playerSleep % 4) - 2), self.height + 2 * ((playerSleep % 4) - 2))
	end
	
	love.graphics.setColor(128, 255, 128, 255)
	love.graphics.rectangle("line", self.x + 5, self.y + 5, self.width - 10, self.height / 5)
	love.graphics.rectangle("line", self.x + 5, self.y + 10 + self.height / 5, self.width - 10, self.height - 15 - self.height/5)
end

function Bed:update(dt)
	self.timeToUse = self.timeToUse + dt
end

function Bed:getSize()
  return self.width, self.height
end

function Bed:getWidth()
  return self.width
end

function Bed:getHeight()
  return self.height
end

function Bed:getType()
	return "Bed"
end

function Bed:checkCollision(x, y, width, height)
	if x >= self.x and x <= self.x + self. width and y >= self.y and y <= self.y + self.height then
		return true
	end
	
	return false
end

function Bed:use(player)
	if self.player:getSleep() < 50 then
		self.player:addSleep(50)
	end
end
