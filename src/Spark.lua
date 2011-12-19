Spark = class()

function Spark:init(args)
    self.pos = args.pos
    self.vel = args.vel or vec2(0,0)
    self.acc = args.acc or vec2(0,0)
    self.lifespan = args.lifespan or 1
    self.age = 0
    self.initialColor = args.initialColor or color(242, 221, 41, 255)
    self.finalColor = args.finalColor or color(128, 38, 29, 0)
end

function Spark:draw()
    local c = blendColor(self.initialColor, self.finalColor, 
                         self.age/self.lifespan)
    
    pushStyle()
    
    fill(c)
    stroke(c)
    noStroke()
    rectMode(CENTER)
    
    rect(self.pos.x, self.pos.y, 3, 3)
    
    popStyle()
end

function Spark:isAlive()
    return self.age <= self.lifespan
end

function Spark:animate(dt)
    self.age = self.age + dt
    self.pos = self.pos + self.vel*dt
    self.vel = self.vel + self.acc*dt
end

function blend(v1, v2, t)
    return v1 + (v2-v1)*clamp(t, 0, 1)
end

function blendColor(c1, c2, t)
    return color(
        blend(c1.r, c2.r, t),
        blend(c1.g, c2.g, t),
        blend(c1.b, c2.g, t),
        blend(c1.a, c2.a, t))
end

function clamp(x, min, max)
    return math.max(min, math.min(max, x))
end
