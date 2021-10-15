torchCount = 0

function placeTorch()
    if torchCount > 11
    then
        check = turtle.placeUp()  
        if check
        then
            torchCount = 0
        end
    end
    torchCount = torchCount + 1
end

function mineStraight(d, wayBack)
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
        
        -- Run Torch function if heading back.
        if wayBack then placeTorch() end
        
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

mineStraight(dist, false)
turnAround()
mineStraight(dist, true)     
turnAround()        