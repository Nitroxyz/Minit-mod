xtar += hspd
ytar += vspd
vspd += 0.28
vspd = median(-8, vspd, 8)
height = lerp(height, 5, 0.18)
scr_boss1_leg_height_sep(height, height)
if (round(ytar) != y || round(xtar) != x)
{
    scr_boss1_body_move(round(xtar), round(ytar))
    if scr_boss1_legs_check()
    {
        shake_screen(14)
        create_particles(x, bbox_bottom, obj_dust_cloud_land, random_range(4, 6))
        var snd = audio_play_sound(snd_land, 100, false)
        audio_sound_pitch(snd, random_range(0.9, 1))
        audio_sound_gain(snd, 1, 0)
        instance_create(x, (y + 4 + leg_l.sprite_width), obj_hidecloud)
        while scr_boss1_legs_check()
        {
            ytar--
            scr_boss1_body_move(round(xtar), round(ytar))
            state = 419
            head.image_index = 0
        }
    }
}
