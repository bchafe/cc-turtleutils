function pathBuild(d, wayBack)
    for i=1,d 
    do
        -- Refuel turtle if needed.
        if ( turtle.getFuelLevel() == 0 )
        then
            turtle.refuel(1)
        end
            
        -- Break block above if there.
        while turtle.detectUp()
        do
            turtle.digUp()
        end
        
        -- Break block in front if there.
        while turtle.detect()
        do
            turtle.dig()
        end
        
        -- Place block below if needed
        if not turtle.detectDown()
        then
            turtle.placeDown()
        end

        -- If not way back, then run side wall ops.
        if not wayBack
        then
        

            -- Turn left, check block, place if needed.
            turtle.turnLeft()
            if not turtle.detect()
            then 
                turtle.place()
            end
            
            --Double turn right, check, place if needed.
            turtle.turnRight()
            turtle.turnRight()
            if not turtle.detect()
            then
                turtle.place()
            end
            
            --Return to starting direction.
            turtle.turnLeft()
        end
                                              
        -- Move turtle forward.
        turtle.forward()    
    
    end
end

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

-- Instructions start here.
args = {...}
dist = args[1]

pathBuild(dist, false)
turnAround()
pathBuild(dist, true)     
turnAround()        