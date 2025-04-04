air = 1
image_speed = 0
image_index = 1
scr_plr_dash()
if (vspd < 0 && (!key_jump_held))
    vspd = max(vspd, ((-jumpspeed) / 4))
if (!dashing)
{
    vspd += grav
    vspd = median(-4, vspd, 30)
}
else
    vspd = 0
xaxis = key_right - key_left
hspd += (movespeed * xaxis)
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
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
else if grounded
    hspd = lerp(hspd, 0, 0.3)
else
    hspd = lerp(hspd, 0, 0.1)
if (!dashing)
{
    if (!shooting)
        hspd = median(-3, hspd, 3)
    else
        hspd = median(-2, hspd, 2)
}
if (vspd < -1)
    image_index = 1
else if (vspd > 1)
    image_index = 3
else
    image_index = 2
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    sprite_index = spr_cat_idle
    move_state = 69
}
