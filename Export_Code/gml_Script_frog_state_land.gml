sprite_index = spr_frog_land
image_speed = 0.1
animate_actor()
if (iindex == (image_number - 1))
{
    iindex = 0
    sprite_index = spr_frog_idle
    image_speed = 0
    vspd = 0
    hspd = 0
    state = 319
}
if (!(place_meeting(x, (y + 1), obj_wall)))
    state = 322
