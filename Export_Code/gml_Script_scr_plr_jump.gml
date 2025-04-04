air = 1
image_speed = 0
if (sliptimer > 0)
{
    if key_jump
    {
        grounded = 0
        move_state = 66
        var snd = audio_play_sound(snd_jump, 1, false)
        audio_sound_pitch(snd, random_range(0.6, 1))
        vspd = (-jumpspeed)
        vspd = median(-4, vspd, 30)
        sliptimer = 0
    }
    sliptimer--
}
else if (key_jump && a_double_jump)
{
    grounded = 0
    move_state = 67
    catmood_update(2, 30)
    var _sfx = audio_play_sound(snd_jumpair, 1, false)
    audio_sound_pitch(_sfx, random_range(0.5, 1))
    _sfx = audio_play_sound(snd_spin_jump, 5, false)
    audio_sound_pitch(_sfx, (hopper ? random_range(0.6, 0.8) : random_range(0.9, 1.1)))
    vspd = (-mech_jumpspd) * 1.2
    image_speed = 5
    dj -= 1
    dpress = 1
    var muzzle = instance_create(x, y, obj_muzzle)
    with (muzzle)
    {
        offset_y = 6
        muzdir = "down"
        if (other.facing == -1)
            offset_x = -2
    }
}
if scr_plr_dash()
    return;
if (vspd < 0)
{
    if ((!key_jump_held) && (!stun))
        vspd = lerp(vspd, max(vspd, ((-jumpspeed) / 3)), 0.5)
    if (vspd > -1)
    {
        if (image_index != 1)
            image_index = 1
    }
}
else if (image_index != 2)
    image_index = 2
if (!dashing)
{
    vspd += grav
    vspd = median((-3 * jumpspeed), vspd, 30)
}
else
    vspd = 0
xaxis = key_right - key_left
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
    hspd = approach(hspd, (mech_movespd * xaxis), mech_accel)
}
else if grounded
    hspd = approach(hspd, 0, mech_accel)
else
    hspd = approach(hspd, 0, mech_air_drag)
if (!dashing)
{
    if (!shooting)
        hspd = clamp(hspd, (-mech_movespd), mech_movespd)
    else
        hspd = clamp(hspd, (-mech_movespd), mech_movespd)
}
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    move_state = 65
    sprite_index = spr_player_C
    image_index = 0
}
