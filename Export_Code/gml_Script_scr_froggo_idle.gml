animate_actor()
if (jump_timer > 0)
    jump_timer--
else
{
    state = 349
    vspd = -1
    froggo_calculate_jump()
}
if place_meeting(x, y, obj_wall)
{
    while place_meeting(x, y, obj_wall)
        y--
}
else if (!(place_meeting(x, (y + 1), obj_wall)))
{
    if place_meeting(x, (y + 2), obj_wall)
        y++
    else
    {
        state = 349
        sprite_index = spr_froggo_jump
        vspd = -1
    }
}
