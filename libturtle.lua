-- slotMem: allows easy storing and recalling of the currently selected slot.
local slotMem

local function setSlotMem()
    slotMem = getSelectedSlot()
end

local function getSlotMem()
    return slotMem
end


-- refuel(): Looks for coal, attempts to refuel the turtle if found.
local function refuel()
    if ( turtle.getFuelLevel() == 0 ) then
        for i=1,16 do
            if (type(turtle.getItemDetail(i)) == "table" and turtle.getItemDetail(i)["name"] == "minecraft:coal") then
                turtle.select(i)
                return turtle.refuel(1)
            end
        end
        return false
    end
end

return { refuel = refuel, setSlotMem = setSlotMem, getSlotMem = getSlotMem }