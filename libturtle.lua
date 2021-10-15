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


-- find(): searches turtle inventory for item given by id, returns inv. index for item if found.
local function find(id)
    for i=1,16 do
        slot = turtle.getItemDetail(i)
        if (type(slot) == "table" and slot["name"] == id) then
            return i
        end
    end
    return nil
end


-- isInInv(): Checks to see if an item is in the turtle inv. returns false if not found.
local function isInInv(id)
    if type(find(id)) == "number" then
        return true
    end
    return false
end


-- refuel(): Looks for coal, attempts to refuel the turtle if found.
local function refuel()
    if ( turtle.getFuelLevel() == 0 ) then
        setSlotMem()
        result = turtle.select(find("minecraft:coal"))
        selectSlotMem()
        return result
    end
end


--dig(): digs until the block is confirmed broken (sand/gravel safe).
--local function dig

return { 
    refuel = refuel, 
    setSlotMem = setSlotMem, 
    getSlotMem = getSlotMem, 
    selectSlotMem = selectSlotMem,
    find = find, 
    isInInv = isInInv 
}