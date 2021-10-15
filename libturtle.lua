local function refuel()
    if ( turtle.getFuelLevel() == 0 ) then
        for i=1,16 do
            if (type(turtle.getItemDetail(i)) == "table" and turtle.getItemDetail(i)["name"] == "minecraft:coal") then
                return turtle.refuel(i)
            end
        end
        return false
    end
end

return { refuel = refuel }