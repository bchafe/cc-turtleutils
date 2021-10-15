-- slotMem: allows easy storing and recalling of the currently selected slot.
local slotMem

local function setSlotMem()
    slotMem = turtle.getSelectedSlot()
end

local function getSlotMem()
    return slotMem
end

local function selectSlotMem()
    return turtle.select(slotMem)
end


-- refuel(): Looks for coal, attempts to refuel the turtle if found.
local function refuel()
    if ( turtle.getFuelLevel() == 0 ) then
        for i=1,16 do
            if (type(turtle.getItemDetail(i)) == "table" and turtle.getItemDetail(i)["name"] == "minecraft:coal") then
                setSlotMem() -- Saves current slot to return to after refueling.
                turtle.select(i)
                result = turtle.refuel(1)
                selectSlotMem() -- Resets to slot mem.
                return result
            end
        end
        return false
    end
end

return { refuel = refuel, setSlotMem = setSlotMem, getSlotMem = getSlotMem, selectSlotMem = selectSlotMem }