if (!audio_is_playing(snd_gary_engine))
    enginesound = audio_play_sound(snd_gary_engine, 100, true)
if (abs(y - 100) > 1)
{
    with (obj_boss_gary_pod)
    {
        hspd = approach(hspd, (2 * (sign(obj_gary_in_tube.x - x))), 0.07)
        vspd = approach(vspd, 1, 0.01)
        x = max((x + hspd), obj_gary_in_tube.x)
        y = approach(y, 120, vspd)
        gary.x = x
        gary.y = y - 20
        sprite_index = spr_gary_pod_idle_empty
    }
}
else if (obj_boss_gary_pod.sprite_index != spr_gary_pod_closing)
{
    if (abs(y - obj_gary_in_tube.y) < 2)
    {
        obj_boss_gary_pod.sprite_index = spr_gary_pod_closing
        obj_boss_gary_pod.iindex = 0
    }
}
else if ((obj_boss_gary_pod.iindex + obj_boss_gary_pod.image_speed) >= sprite_get_number(spr_gary_pod_closing))
{
    obj_boss_gary_pod.sprite_index = spr_gary_pod_idle
    with (obj_gary_in_tube)
        y -= 1000
    visible = true
    y = obj_boss_gary_pod.y - 20
    state = 663
    obj_controller.state_step = 59
    x_hover = x
    y_hover = y
    pod = 443
    global.boss_hud_active = 1
    global.boss_hud_target = id
    player_play()
    music_duck(1, 0)
    music_xfade(mu_garypod_boss, 0)
}
