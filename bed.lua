class "Bed" {
	width = 0;
	height = 0;
}

function Bed:__init(x, y)
	self.x = x
	self.y = y
	self.width = 100;
	self.height = 200;
end

function Bed:draw(offsetx, offsety)
	love.graphics.setColor(0, 192, 0, 255)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.setColor(128, 255, 128, 255)
	love.graphics.rectangle("line", self.x + 5, self.y + 5, self.width - 10, self.height / 5)
	love.graphics.rectangle("line", self.x + 5, self.y + 10 + self.height / 5, self.width - 10, self.height - 15 - self.height/5)
	
end

function Bed:update(dt)
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
