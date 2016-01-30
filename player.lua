class "Player" {
	width = 0;
	height = 0;
}

function Player:__init(x, y)
	self.x = x
	self.y = y
	self.width = 35;
	self.height = 10;
	self.headSize = 15;
end

function Player:draw(offsetx, offsety)
	love.graphics.setColor(0, 192, 0, 255)
	love.graphics.ellipse("line", self.x, self.y, self.width, self.height, 100)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.circle("fill", self.x, self.y, self.headSize, 100)
	love.graphics.setColor(128, 255, 128, 255)
	love.graphics.circle("line", self.x, self.y, self.headSize, 100)
	
end

function Player:update(dt)
end

function Player:getSize()
  return self.width, self.height
end

function Player:getWidth()
  return self.width
end

function Player:getHeight()
  return self.height
end

function Player:getType()
	return "Player"
end
