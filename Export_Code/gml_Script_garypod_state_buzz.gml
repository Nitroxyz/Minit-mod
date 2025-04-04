garypod_enginesound_mod()
with (obj_boss_gary_pod)
{
    if (sprite_index == spr_gary_pod_transform_buzz)
    {
        if ((iindex + image_speed) >= sprite_get_number(spr_gary_pod_transform_buzz))
        {
            sprite_index = spr_gary_pod_buzz_idle
            gary.hspd = 0
        }
    }
    else if (!(place_meeting((x + gary.hspd), y, obj_wall)))
    {
        x += gary.hspd
        gary.x = x
        if instance_exists(obj_player)
            gary.hspd = approach(gary.hspd, (4 * (sign(obj_player.x - obj_player.image_xscale * 24 - x))), 0.1)
    }
    else
    {
        gary.hspd *= -0.5
        shake_screen(20)
    }
}
if (hp_last != hp)
{
    hp_lost_this_state += (hp_last - hp)
    hp_last = hp
}
if (hp_lost_this_state >= 20)
{
    hp_lost_this_state = 0
    state = 671
    if audio_is_playing(snd_gary_saw)
        audio_stop_sound(snd_gary_saw)
    pod.sprite_index = spr_gary_pod_transform_buzz
    pod.iindex = sprite_get_number(spr_gary_pod_transform_buzz) - 0.1
    pod.image_speed *= -1
    vspd = 0
    hspd = 0
}
