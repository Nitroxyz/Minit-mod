animate_actor()
if (ds_list_size(myFlies) < maxFlies)
{
    if is_within_view(x, y, 0, 16)
    {
        if (spawn_timer > 0)
            spawn_timer--
        else
        {
            spawn_timer = spawn_timer_max
            state = 329
            sprite_index = spr_hive_birth
            image_speed = 0.2
            iindex = 0
            var _sfx = audio_play_sound(birth_sound, 10, false)
            audio_sound_pitch(_sfx, random_range(0.9, 1.1))
        }
    }
}
