             
function setup()
    font = ZXMonospace()
    animator = Animator()
    particles = Layer()
end

function touched(t)
    if t.state == ENDED then
        font:render("Particles!", ParticleFontStyle {
            origin = vec2(t.x, t.y),
            vel=vec2(t.deltaX/DeltaTime,t.deltaY/DeltaTime),
            acc=vec2(0,-50),
            drift=1,
            lifespan=5,
            launcher = function(p)
                animator:add(p)
                particles:add(p)
            end
        })
    end
end

function draw()
    background(0, 0, 0, 255)
    
    animator:animate(DeltaTime)
    
    smooth()
    particles:draw()
    
    pushMatrix()
    translate(0,HEIGHT-24)
    noSmooth()
    fill(255, 255, 255, 255)
    font:render("Hello, World.\nMultiple lines!\n\nA blank line.")
    popMatrix()
end
