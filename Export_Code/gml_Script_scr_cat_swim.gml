air = 1
image_speed = 0
if key_jump
{
    audio_play_sound(CatSwim, 1, false)
    audio_sound_pitch(CatSwim, random_range(0.5, 1))
    vspd = -2
    alarm[5] = min(alarm[5], 30)
}
if (!dashing)
{
    vspd += (0.5 * grav)
    vspd = median(-6, vspd, 1)
}
else
    vspd = 0
if (vspd < -0.6)
{
    image_speed = abs(vspd) * 0.5
    sprite_index = spr_cat_swim_up
}
else if (vspd > 0.7)
{
    sprite_index = spr_cat_swim_down
    image_speed = abs(vspd) * 0.3
}
else
{
    sprite_index = spr_cat_swim_middle
    image_speed = abs(hspd) * 0.2 + 0.1
}
xaxis = key_right - key_left
hspd += (0.4 * movespeed * xaxis)
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
}
else if grounded
    hspd = lerp(hspd, 0, 0.1)
else
    hspd = lerp(hspd, 0, 0.02)
if (!dashing)
    hspd = median(-2, hspd, 2)
if (!(place_meeting(x, y, WATER)))
{
    move_state = 70
    in_water = 0
    instance_create(x, y, obj_splash)
    vspd = -4
}
