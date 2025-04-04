if (vspd < -0.4)
    image_speed = 0.4
else
{
    image_speed = 0
    image_index = 0
}
xaxis = key_right - key_left
vspd = min(6, (vspd + 0.1))
if (vspd > 0)
{
    if (!audio_is_playing(CatSlide))
        audio_play_sound(CatSlide, 100, true)
    else
        audio_sound_pitch(CatSlide, (0.65 + vspd / 8))
}
else if audio_is_playing(CatSlide)
    audio_stop_sound(CatSlide)
if key_shoot_pressed
{
    var seffect = choose(97)
    var s = audio_play_sound(seffect, 5, false)
    audio_sound_pitch(s, random_range(0.9, 1.2))
}
if (key_jump || (!(place_meeting((x + image_xscale), y, obj_wall))))
{
    if key_jump
    {
        create_particles(x, bbox_bottom, particle_dust_land, random_range(1, 2))
        vspd = max((-cat_climbspd))
    }
    audio_play_sound(CatClimb, 1, false)
    audio_sound_pitch(CatClimb, random_range(0.8, 1.1))
    if ((!(place_meeting((x + image_xscale), y, obj_wall))) || (key_jump && xaxis == (-image_xscale)))
    {
        if (xaxis == (-image_xscale))
        {
            hspd = -2.5 * image_xscale
            vspd = (-cat_jumpspd) * 0.75
        }
        else
            hspd = -0.25 * image_xscale
        if audio_is_playing(CatSlide)
            audio_stop_sound(CatSlide)
        move_state = 70
        sprite_index = spr_cat_walk
        mask_index = spr_cat_idle
        return;
    }
}
if place_meeting(x, (y + 1), obj_wall)
{
    vspd = 0
    grounded = 1
    move_state = 69
    sprite_index = spr_cat_idle
    mask_index = spr_cat_idle
    if audio_is_playing(CatSlide)
        audio_stop_sound(CatSlide)
}
else if (vspd < 0 && place_meeting(x, (y - 1), obj_wall))
    vspd *= -0.2
