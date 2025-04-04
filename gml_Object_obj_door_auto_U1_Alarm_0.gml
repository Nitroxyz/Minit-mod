var low_temp = instance_position(x, (y + 10), obj_door_auto_U)
if (low_temp != -4)
    lower = low_temp
else
{
    lower = -1
    master = 1
}
var hi_temp = instance_position(x, (y - 10), obj_door_auto_U)
if (hi_temp != -4)
    upper = hi_temp
else
    upper = -1
