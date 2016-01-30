require('background')
require('bed')
require('player')
require('fridge')

class "World" {
	screenWidth = 0;
	screenHeight = 0;
	offsetx = 0;
	offsety = 0;
}

function World:__init(width, height)
	screenWidth = width;
	screenHeight = height;
	self.objects = {}
	self.player = Player:new(400, 150)
	
	table.insert(self.objects, Bed:new(150, 150, self.player))
	table.insert(self.objects, Bed:new(750, 150, self.player))
	table.insert(self.objects, Fridge:new(500, 650, self.player))
	table.insert(self.objects, Background:new(width, height))
end

function World:update(dt)
	for i, v in pairs(self.objects) do
		v:update(dt)
	end
	self.player:update(dt, self.objects)
end

function World:draw()
	for i, v in pairs(self.objects) do
		v:draw(self.offsetx, self.offsety)
	end
	self.player:draw(self.offsetx, self.offsety)
	
	if self.player:isDead() then
		love.graphics.print("Looser!", 250, 250, 0, 5, 5)
	end
end

function World:keypressed(key)
  self.player:keypressed(key)
end

function World:keyreleased(key)
  self.player:keyreleased(key)
end
