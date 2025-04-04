air = 1
image_speed = approach(image_speed, 1, 0.2)
sprite_index = spr_mech_djump
if scr_plr_dash()
    return;
if (spin_particle_timer > 0)
    spin_particle_timer--
else
{
    spin_particle_timer = 2
    var _trail = instance_create(x, y, obj_spin_trail)
    _trail.image_xscale = image_xscale
}
if (vspd < 0)
{
    if ((!key_jump_held) && (!stun) && alarm[6] <= 0)
        vspd = lerp(vspd, max(vspd, ((-jumpspeed) / 3)), 0.5)
}
if (!dashing)
{
    vspd += grav
    vspd = median(-8, vspd, 8)
}
else
    vspd = 0
xaxis = key_right - key_left
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
    hspd = approach(hspd, ((mech_movespd + cat_jumpoffset) * xaxis), mech_accel)
}
else if grounded
    hspd = approach(hspd, 0, mech_accel)
else
    hspd = approach(hspd, 0, (mech_air_drag / 4))
if (!dashing)
{
    if (!shooting)
    {
    }
}
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    move_state = 65
    sprite_index = spr_player_idle
}
