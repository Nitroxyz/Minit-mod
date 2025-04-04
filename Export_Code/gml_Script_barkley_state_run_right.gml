if (!instance_exists(obj_player))
    return;
dist_to_player = point_distance(x, y, obj_player.x, obj_player.y)
if (!grounded)
{
    sprite_index = spr_barkley_jump
    image_speed = 0
    if (vspd < -0.5)
        iindex = 0
    else if (vspd < 0.5)
        iindex = 1
    else
        iindex = 2
    vspd += grav
    if place_meeting(x, (y + 1), obj_wall)
    {
        grounded = 1
        vspd = 0
    }
}
else
{
    if (hspd != 0)
    {
        if ((floor(iindex) % 3) == 0)
            instance_create(x, bbox_bottom, obj_dust_cloud_walk)
    }
    if place_meeting((x + 48), y, obj_escape_pod)
    {
        vspd = -4
        hspd = 4
        y -= 1
        grounded = 0
    }
    if place_meeting(x, (y + 1), obj_bridgenode)
    {
        if (dist_to_player < 64)
        {
            state = 285
            vspd = -2
        }
        image_xscale = -1
        sprite_index = spr_barkley_idle
        image_speed = 0.2
        hspd = approach(hspd, 0, 0.08)
    }
    else if (x > obj_player.x)
    {
        if (dist_to_player < 100)
        {
            hspd = approach(hspd, spd, 0.1)
            sprite_index = spr_barkley_run
            image_speed = 0.1 * abs(hspd)
            if (hspd != 0)
                image_xscale = sign(hspd)
        }
        else
        {
            hspd = approach(hspd, 0, 0.1)
            if (hspd == 0)
            {
                sprite_index = spr_barkley_idle
                image_speed = 0.2
                image_xscale = -1
            }
        }
    }
    else
    {
        hspd = approach(hspd, spd, 0.1)
        sprite_index = spr_barkley_run
        image_speed = 0.1 * abs(hspd)
    }
}
if place_meeting(x, y, obj_escape_pod)
    instance_destroy()
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
animate_actor()
