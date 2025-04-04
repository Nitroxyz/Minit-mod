if instance_exists(obj_player)
{
    if (abs(obj_player.x - x) > 6)
        hspd += (0.02 * (sign(obj_player.x - x)))
    var new_x = clamp(((lerp(x, obj_player.x, 0.04)) + hspd), 20, 284)
    if (new_x == 20 || new_x == 284)
    {
        hspd *= -0.5
        shake_screen(15)
    }
    else if (!audio_is_playing(RailBossRailmovement))
    {
        railsound = audio_play_sound(RailBossRailmovement, 100, true)
        audio_sound_pitch(railsound, lerp(abs(hspd), 1, 0.6))
    }
    else
        audio_sound_pitch(railsound, lerp(abs(hspd), 1, 0.6))
}
else
    new_x = lerp(x, ((__view_get(2, 0)) / 2), 0.1)
arm_l.image_xscale += ((new_x - x) / 9)
arm_r.image_xscale -= ((new_x - x) / 9)
scr_boss1_body_move(new_x, y)
if (head.image_index == 1 && alarm[1] < 40)
    head.image_index = choose(0, 2)
if (alarm[1] < 25)
    body_offset = 1
else if (alarm[1] == 35)
{
    var sn = audio_play_sound(RailGunCharge, 100, false)
    audio_sound_pitch(sn, random_range(0.4, 0.6))
}
