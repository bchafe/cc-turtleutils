function refuel()
    
    if ( turtle.getFuelLevel() == 0 ) then
        for i=1,16 do
            if (turtle.getItemDetail(i)["name"] == "minecraft:coal") then
                return turtle.refuel(i)
        return false
    end