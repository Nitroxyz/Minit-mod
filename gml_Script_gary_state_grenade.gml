gary_pathfind()
sprite_index = spr_gary_throw
image_speed = 0.2
stun_state = 652
if (!(place_meeting(x, (y + 1), obj_wall)))
    vspd += grav
hspd = approach(hspd, 0, 0.5)
animate_actor()
gary_collisions()
if (iindex <= 10)
{
    if (target_x > x)
        image_xscale = 1
    else
        image_xscale = -1
}
else if (!has_thrown)
{
    var gren = instance_create((x + (sign(image_xscale * 8))), (y - 4), obj_gary_grenade)
    gren.dir = point_direction(x, y, target_x, target_y)
    gren.xdist = abs(target_x - x)
    has_thrown = 1
}
if ((iindex + image_speed) >= image_number)
{
    pursuit_state = 656
    state = pursuit_state
    has_thrown = 0
    next_special = 655
}
