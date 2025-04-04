if instance_exists(par)
{
    if (!audio_is_playing(snd_lavaflow_hi))
    {
        var t = audio_play_sound(snd_lavaflow_hi, 100, true)
        audio_sound_gain(t, (audio_sound_get_gain(t) * 2), 0)
    }
    x = par.x
    image_yscale = (par.y - y) / 16
    animate_actor()
    if place_meeting(x, y, obj_wall)
    {
        var inst = instance_place(x, y, obj_wall)
        if (inst.destruct == 0 && inst.sprite_index != spr_movingBack)
        {
            with (inst)
            {
                instance_create(x, y, obj_wall2)
                var st = instance_create(x, y, obj_steam_cloud)
                st.hspd = 0
                st.vspd = 0.5
                instance_destroy()
            }
        }
    }
    if (!audio_is_playing(snd_lavaflow))
        flowsound = audio_play_sound(snd_lavaflow, 100, true)
}
else
    instance_destroy()
