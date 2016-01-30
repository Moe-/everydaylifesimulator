class "Cat" {
	width = 0;
	height = 0;
}

function Cat:__init(x, y)
	self.x = x
	self.y = y
	self.radius = 30;
	self.height = 200;
end

function Cat:draw(offsetx, offsety)
	love.graphics.setColor(0, 192, 128, 255)
	love.graphics.circle("line", self.x, self.y, self.radius, self.height)
	love.graphics.setColor(128, 255, 128, 255)
	--eyes
        love.graphics.circle("line", self.x - 10, self.y - 10, self.radius / 8, self.height / 5)
	love.graphics.circle("line", self.x + 10, self.y - 10, self.radius / 8, self.height - 15 - self.height/5)
        love.graphics.line(self.x - 10, self.y + 5, self.x + 10, self.y + 5, self.x, self.y + 15, self.x - 10, self.y + 5)
        love.graphics.line(self.x, self.y + 15, self.x, self.y + 25)
        --mouth
        --love.graphics.line(self.x, self.y + 25, self.x - 5, self.y + 20)
        --love.graphics.line(self.x, self.y + 25, self.x + 5, self.y + 20)
        -- ears
        x_right_1 = self.x + self.radius * math.cos(math.pi)
        y_right_1 = self.y + self.radius * math.sin(math.pi)
        x_right_2 = self.x + self.radius * math.cos(1.3 * math.pi)
        y_right_2 = self.y + self.radius * math.sin(1.3 * math.pi)
        x_left_1  = self.x + self.radius * math.cos(2 * math.pi)
        y_left_1  = self.y + self.radius * math.sin(2 * math.pi)
        x_left_2  = self.x + self.radius * math.cos(1.7 * math.pi)
        y_left_2  = self.y + self.radius * math.sin(1.7 * math.pi)
        love.graphics.line(x_right_1, y_right_1, x_right_1, y_right_1 - 40, x_right_2, y_right_2)
        love.graphics.line(x_left_1,  y_left_1 , x_left_1,  y_left_1  - 40, x_left_2, y_left_2)
end

function Cat:update(dt)
end

function Cat:getSize()
  return self.width, self.height
end

function Cat:getWidth()
  return self.width
end

function Cat:getHeight()
  return self.height
end

function Cat:getType()
	return "Bed"
end
