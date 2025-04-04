air = 1
image_speed = 0.25
if (vspd < 0 && (!key_jump_held))
    vspd = max(vspd, ((-jumpspeed) / 3))
if (!dashing)
{
    vspd += grav
    vspd = median(-4, vspd, 12)
}
else
    vspd = 0
if key_shoot_pressed
{
    var seffect = choose(97)
    var s = audio_play_sound(seffect, 5, false)
    audio_sound_pitch(s, random_range(0.9, 1.2))
}
if (vspd < -0.5)
{
    sprite_index = spr_cat_jump_loop
    image_speed = 0.25
}
else if (vspd > 0.5)
{
    sprite_index = spr_cat_fall_loop
    image_speed = 0.25
}
else
{
    sprite_index = spr_cat_midjump
    image_speed = 0
    if (vspd < -0.25)
    {
        image_index = 0
        iindex = image_index
    }
    else if (vspd >= -0.25 && vspd <= 0.25)
    {
        image_index = 1
        iindex = image_index
    }
    else if (vspd > 0.25)
    {
        image_index = 1
        iindex = image_index
    }
}
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    move_state = 69
}
xaxis = key_right - key_left
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
    hspd = approach(hspd, ((cat_movespd + cat_jumpoffset) * xaxis), cat_accel)
    if place_meeting((x + xaxis), y, obj_wall)
    {
        move_state = 71
        sprite_index = spr_cat_wall
        mask_index = spr_cat_wall
        hspd = 0
        vspd = min(0.5, (vspd * 0.8))
        audio_play_sound(CatClimb, 1, false)
        audio_sound_pitch(CatClimb, random_range(0.6, 1.1))
    }
}
else
    hspd = approach(hspd, 0, cat_air_drag)
