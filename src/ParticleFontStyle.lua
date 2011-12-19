
function ParticleFontStyle(args)
    launcher = args.launcher
    origin = args.origin
    lifespan = args.lifespan or 10
    acc = args.acc or vec2(0,0)
    vel = args.vel or vec2(43,0)
    drift = args.drift or 0

    return function(lineIndex, charIndex, x, y, pixelCode)
        local size = 3
        local speed = math.random() * 2
        local direction = vec2(drift,0):rotate(math.random()*math.pi*2)
        
        launcher(Spark {
            pos = origin + vec2(x*size, y*size),
            vel = vel + speed * direction,
            acc = acc,
            lifespan=lifespan
        })
    end
end
