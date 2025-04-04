if inactive
    return;
j_right = 0
j_left = 0
j_jump = 0
if mp_grid_path(collision_grid, path, x, y, target_x, target_y, true)
{
    next_x = path_get_point_x(path, 1)
    next_y = path_get_point_y(path, 1)
    if (point_distance(x, y, target_x, target_y) > 8)
    {
        if (x < next_x)
            j_right = 1
        if (x > next_x)
            j_left = 1
    }
    if (y > (next_y + 2))
        j_jump = 1
}
if place_meeting(x, (y + 1), obj_wall)
{
    if (!grounded)
        grounded = 1
}
else
    grounded = 0
if (!grounded)
{
    if (j_jump && vspd < 0)
        vspd += (grav * 0.5)
    else
        vspd += grav
    if j_right
        hspd = approach(hspd, 2, 0.1)
    else if j_left
        hspd = approach(hspd, -2, 0.1)
    else
        hspd = approach(hspd, 0, 0.1)
    if (hspd != 0)
        image_xscale = sign(hspd)
    sprite_index = spr_cat_jump_loop
}
else
{
    if j_right
        hspd = approach(hspd, 2.5, 0.1)
    else if j_left
        hspd = approach(hspd, -2.5, 0.1)
    else
        hspd = approach(hspd, 0, 0.1)
    if (hspd != 0)
    {
        sprite_index = spr_cat_walk
        image_xscale = sign(hspd)
        image_speed = abs(hspd) / 2.5 * 0.5
    }
    else
    {
        sprite_index = spr_cat_idle
        image_speed = 0.2
        image_xscale = target_facing
    }
    if j_jump
        vspd -= 3.5
}
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
