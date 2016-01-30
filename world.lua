require('background')
require('bed')
require('player')
require('cat')

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
	self.objects = {}
	self.player = Player:new(400, 150)
	
	table.insert(self.objects, Bed:new(150, 150))
        table.insert(self.objects, Cat:new(450, 250))
end

function World:update(dt)
	self.background:update(dt)
	for i, v in pairs(self.objects) do
		v:update(dt)
	end
	self.player:update(dt)
end

function World:draw()
	self.background:draw(self.offsetx, self.offsety)
	for i, v in pairs(self.objects) do
		v:draw(self.offsetx, self.offsety)
	end
	self.player:draw(self.offsetx, self.offsety)
end
