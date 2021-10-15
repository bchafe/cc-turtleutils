args = {...}
for i=1,args[1] do
    if ( turtle.getFuelLevel() == 0 )
    then
        turtle.refuel()
    end
    turtle.forward()
end
