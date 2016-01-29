require('background')

class "World" {
	screenWidth = 0;
	screenHeight = 0;
	offsetx = 0;
	offsety = 0;
}

function World:__init(width, height)
	screenWidth = width;
	screenHeight = height;
	self.background = Background:new(width, height)
end

function World:update(dt)
	self.background:update(dt)
end

function World:draw()
	self.background:draw(self.offsetx, self.offsety)
end
