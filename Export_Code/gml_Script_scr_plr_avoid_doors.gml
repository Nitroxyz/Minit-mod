key_right = 0
key_left = 0
key_down = 0
key_up = 0
key_jump = 0
key_jump_held = 0
key_action = 0
key_shoot = 0
key_shoot_release = 0
key_jump_release = 0
key_shoot2 = 0
key_shoot3 = 0
key_dash = 0
if instance_place(x, y, obj_wall)
{
    if (!(instance_place(x, (y + 1), obj_wall)))
        y++
    else
        y--
    return;
}
var tt = instance_place(x, y, obj_door_auto_U)
if tt
{
    if (!tt.on_side)
    {
        if (x < 130)
            key_right = 1
        else if (x > 130)
            key_left = 1
    }
}
else
{
    with (obj_door_auto_U)
    {
        if (upper == -1)
        {
            alarm[1] = 6
            sprite_index = spr_door1_U
            iindex = sprite_get_number(spr_door1_U) - 1
            visible = true
        }
    }
    if (grounded || vehicle == 2)
        control_state = 88
}
