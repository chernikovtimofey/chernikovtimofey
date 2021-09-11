using HorizonSideRobots
r = Robot()
points = [Nord, Ost, Sud, West]

function move_to!(r, x, y)
    for i in 1:x - 1
        move!(r, Ost)
    end
    for j in 1:y - 1
        move!(r, Nord)
    end
end

function move_till_border!(r, point)
    while !isborder(r, point)
        move!(r, point)
        putmarker!(r)
    end
end

function reverse_point(point)
    if point == Nord
        return Sud
    elseif  point == Sud
        return Nord
    elseif  point == Ost
        return West
    end 
    return Ost
end

function move_till_on_marker!(r, point)
    while ismarker(r)
        move!(r, point)
    end
end

move_to!(r, 9, 6)

for point in points
    move_till_border!(r, point)
    move_till_on_marker!(r, reverse_point(point))
end

show(r)
