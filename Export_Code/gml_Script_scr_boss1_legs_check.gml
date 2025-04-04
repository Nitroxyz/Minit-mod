t_flag = 0
with (leg_l)
{
    if place_meeting(x, y, obj_wall)
        other.t_flag = 1
}
with (leg_r)
{
    if place_meeting(x, y, obj_wall)
        other.t_flag = 1
}
return t_flag;
