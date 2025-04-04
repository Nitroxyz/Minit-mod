garypod_enginesound_mod()
if (shoot_timer > 0)
    shoot_timer--
with (obj_boss_gary_pod)
{
    if (!(place_meeting((x + gary.hspd), y, obj_wall)))
    {
        x += gary.hspd
        gary.x = x
    }
    else
    {
        audio_play_sound(snd_gary_podbounce, 100, false)
        gary.hspd *= -1
        shake_screen(20)
    }
    if (gary.vspd < 0)
    {
        if (!(place_meeting(x, (gary.y + gary.vspd - 12), obj_wall)))
        {
            y += gary.vspd
            gary.y = y - 20
            gary.vspd += 0.2
        }
        else
        {
            audio_play_sound(snd_gary_podbounce, 100, false)
            gary.vspd *= -0.95
            shake_screen(20)
        }
    }
    else if (gary.vspd > 0)
    {
        if place_meeting(x, (y + vspd), obj_wall)
        {
            while (!(place_meeting(x, (y + 1), obj_wall)))
                y++
            audio_play_sound(snd_gary_podbounce, 100, false)
            gary.y = y - 20
            gary.vspd *= -0.95
            shake_screen(20)
            if (other.shoot_timer == 0)
            {
                y = 154
                gary.vspd = 0
            }
        }
        else
        {
            y += gary.vspd
            gary.y = y - 20
            gary.vspd += 0.2
        }
    }
    else if (y == 154)
    {
        gary.hp_lost_this_state = 0
        gary.state = 674
        if (!audio_is_playing(snd_gary_saw))
            audio_play_sound(snd_gary_saw, 100, true)
        sprite_index = spr_gary_pod_transform_buzz
        mask_index = spr_gary_pod_empty
        while place_meeting(x, y, obj_wall)
            y--
        gary.y = y - 20
        iindex = 0
    }
    else
        gary.vspd += 0.2
}
