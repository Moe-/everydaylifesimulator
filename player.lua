class "Player" {
	width = 0;
	height = 0;
}

function Player:__init(x, y)
	self.x = x
	self.y = y
	self.dead = false
	self.width = 35
	self.height = 10
	self.headSize = 15
	self.dx = 0
	self.dy = 0
	self.speed = 75
	self.use = false
	self.sleep = 75
	self.needFactor = 10
	self.text = ""
	self.renderTextTime = 0
end

function Player:draw(offsetx, offsety)
	love.graphics.setColor(0, 192, 0, 255)
	if self.dx ~= 0 then
		love.graphics.ellipse("line", self.x, self.y, self.height, self.width, 100)
	else
		love.graphics.ellipse("line", self.x, self.y, self.width, self.height, 100)
	end
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.circle("fill", self.x, self.y, self.headSize, 100)
	love.graphics.setColor(128, 255, 128, 255)
	love.graphics.circle("line", self.x, self.y, self.headSize, 100)
	
	if self.renderTextTime > 0 then
		love.graphics.print(self.text, self.x + 3 * self.width / 2, self.y - self.height / 2)
	end
end

function Player:update(dt, objects)
	local newX = self.x + dt * self.speed * self.dx
	local newY = self.y + dt * self.speed * self.dy
	
	for i,v in pairs(objects) do
		if v:checkCollision(newX, newY, self.width, self.height) then
			if not v:checkCollision(newX, self.y, self.width, self.height) then
				newY = self.y
			elseif not v:checkCollision(self.x, newY, self.width, self.height) then
				newX = self.x
			else
				newX = self.x
				newY = self.y
				break
			end
		end
		
		if self.use then
			self.use = false
			v:use(self)
		end
	end
	
	self.x = newX
	self.y = newY
	
	self.sleep = self.sleep - dt * self.needFactor
	if self.sleep < 0 then
		self.dead = true
		self.dx = 0
		self.dy = 0
		self.renderTextTime = 0
	end
	
	self.renderTextTime = self.renderTextTime - dt
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

function Player:keypressed(key)
  if self.dead then
    return
  end

  if key == 'w' then
    self.dy = -1	
  elseif key == 's' then
    self.dy = 1
  end
  if key == 'a' then
    self.dx = -1
  elseif key == 'd' then
    self.dx = 1
  end
	
	if key == 'e' then
		self.use = true
	end
end

function Player:keyreleased(key)
  if self.dead then
    return
  end

  if key == 'w' then
    if not love.keyboard.isDown('s') then
      self.dy = 0
    else
      self.dy = 1
    end
  elseif key == 's' then
    if not love.keyboard.isDown('w') then
      self.dy = 0
    else
      self.dy = -1
    end
  end
  
  if key == 'a' then
    if not love.keyboard.isDown('d') then
      self.dx = 0
    else
      self.dx = 1
    end
  elseif key == 'd' then
    if not love.keyboard.isDown('a') then
      self.dx = 0
    else
      self.dx = -1
    end
  end
end

function Player:addSleep(val)
	self.sleep = clamp(self.sleep + val, 0, 100)
	self.renderTextTime = 5
	self.text = "Ah, this was refreshing!"
end

function Player:getSleep(val)
	return self.sleep
end

function Player:isDead()
	return self.dead
end