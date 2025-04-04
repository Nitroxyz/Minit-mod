if (vehicle == 3)
{
    var _xoff = x + 5 * image_xscale
    var _yoff = y - 5 * image_yscale
    var _xzoom = lengthdir_x((turret_shoot_energy_max - turret_shoot_energy), (turret_shoot_direction + 90))
    var _yzoom = lengthdir_y((turret_shoot_energy_max - turret_shoot_energy), (turret_shoot_direction + 90))
    draw_line_width((_xoff + _xzoom), (_yoff + _yzoom), (_xoff + (lengthdir_x(400, turret_shoot_direction)) + _xzoom), (_yoff + (lengthdir_y(400, turret_shoot_direction)) + _yzoom), (turret_shoot_energy / turret_shoot_energy_max * 4))
    draw_line_width((_xoff - _xzoom), (_yoff - _yzoom), (_xoff + (lengthdir_x(400, turret_shoot_direction)) - _xzoom), (_yoff + (lengthdir_y(400, turret_shoot_direction)) - _yzoom), (turret_shoot_energy / turret_shoot_energy_max * 4))
}
if (image_blend == c_white)
{
    draw_self_actor()
    if (!surface_exists(global.playersurf))
        global.playersurf = surface_create(308, 196)
    surface_set_target(global.playersurf)
    camera_apply(view_camera[0])
    draw_self_actor()
    surface_reset_target()
}
