ytemp = floor(y)
y = ytemp
while place_meeting(x, y, obj_wall)
{
    ytemp--
    y = ytemp
}
instance_create(x, y, obj_hidecloud)
visible = true
state = 362
