class "Background" {
	screenWdith = 0;
	screenHeight = 0;
	distance = 0;
}

function Background:__init(width, height)
	self.screenWidth = width;
	self.screenHeight = height;
	self.distance = 50;
  self.image = love.graphics.newImage("gfx/background.png")
  self.image:setWrap("repeat", "repeat")
  --self.quad = love.graphics.newQuad(0, 0, self.image:getWidth(), self.image:getHeight(), self.image:getWidth(), self.image:getHeight())
	self.quad = love.graphics.newQuad(0, 0, width, height, self.image:getWidth(), self.image:getHeight())
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Background:draw(offsetx, offsety)
	love.graphics.setBackgroundColor(0, 0, 0, 255)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.rectangle("line", self.distance, self.distance, self.screenWidth - 2 * self.distance, self.screenHeight - 2 * self.distance)
	--love.graphics.draw(self.image, self.quad, 0 - offsetx % (self.width * 2), 0 - offsety % self.height, 0, 2, 2)
end

function Background:update(dt)
end

function Background:getSize()
  return self.width, self.height
end

function Background:getWidth()
  return self.width
end

function Background:getHeight()
  return self.height
end

function Background:getType()
	return "Background"
end

function Background:checkCollision(x, y, width, height)
	x = x - width/2
	y = y - height/2
	if x <= self.distance then
		return true;
	elseif x + width >= self.screenWidth - self.distance then
		return true;
	end
	
	if y <= self.distance then
		return true;
	elseif y + height >= self.screenHeight - self.distance then
		return true;
	end
	
	return false
end

function Background:use()
	
end
