if (!is_active)
{
    if (active_timer > 0)
        active_timer--
    else if (x < (obj_camera.xmax + 10))
    {
        mousesprite = 573
        is_active = 1
        shake_screen(30)
    }
    else
        mousesprite = 0
}
else
{
    x += spd
    spikes.x += spd
    var sndflag = 0
    if place_meeting(x, y, obj_wall)
    {
        sndflag = 1
        while place_meeting(x, y, obj_wall)
        {
            with (instance_place(x, y, obj_wall))
            {
                instance_create(x, y, obj_dustcloud)
                instance_destroy()
            }
        }
        if (mousesprite == 573)
            mousesprite = 574
        else
            mousesprite = 573
        if (!instance_exists(obj_shake))
            shake_screen(5)
    }
    else if place_meeting(x, y, obj_foreground)
    {
        sndflag = 1
        while place_meeting(x, y, obj_foreground)
        {
            with (instance_place(x, y, obj_foreground))
            {
                instance_create(x, y, obj_dustcloud)
                instance_destroy()
            }
        }
        if (!instance_exists(obj_shake))
            shake_screen(5)
    }
    else if place_meeting(x, y, obj_enemy)
    {
        sndflag = 1
        while place_meeting(x, y, obj_enemy)
        {
            with (instance_place(x, y, obj_enemy))
                instance_destroy()
        }
    }
    else if place_meeting(x, y, WATER)
    {
        sndflag = 1
        while place_meeting(x, y, WATER)
        {
            with (instance_place(x, y, WATER))
            {
                var t = instance_create(x, y, obj_water_bubble)
                t.hspd = abs(t.hspd)
                instance_destroy()
            }
        }
    }
    if sndflag
    {
        var snd_t = audio_play_sound(rock_crumble, 100, false)
        var snd_g = clamp((1 - (max((obj_camera.x + 152 - x), 0)) / 304), 0.3, 1)
        audio_sound_gain(snd_t, (snd_g * global.SOUND_MASTER_GAIN), 0)
    }
    if place_meeting(x, y, obj_player)
    {
        while place_meeting(x, y, obj_player)
            obj_player.x++
    }
    if (x >= (obj_camera.xmax + 10))
    {
        audio_stop_sound(snd_spikewall_loop)
        mousesprite = 0
        instance_create((x - 24), (y - 24), obj_hidecloud)
        x = obj_camera.xmax + 10
        music_play_main(1)
        is_active = 0
        shake_screen(30)
        audio_play_sound(snd_torpedo_explode, 100, false)
    }
}
