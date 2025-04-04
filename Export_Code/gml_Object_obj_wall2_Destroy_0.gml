if (!c_destroy)
{
    if audio_is_playing(global.crumblesound)
    {
        if (audio_sound_get_track_position(global.crumblesound) > 0.08)
        {
            global.crumblesound = audio_play_sound(rock_crumble, 100, false)
            audio_sound_pitch(global.crumblesound, random_range(0.8, 1.2))
        }
    }
    else
    {
        global.crumblesound = audio_play_sound(rock_crumble, 100, false)
        audio_sound_pitch(global.crumblesound, random_range(0.8, 1.2))
    }
    for (i = 0; i < 16; i++)
    {
        temp = instance_create((x + (random(i) / 4 + 4) * (random_range(-2, 2))), (y + (random(i) / 5 + 4) * (random_range(-2, 2))), choose(63, 63, 62))
        temp.image_index = random_range(0, 1.99)
        temp.image_speed = random_range(0.1, 0.23)
        temp.hspd = (random_range(-0.2, 0.2)) * (choose(1.1, 0.8, 0.9, 1.2, 1.6))
        temp.vspd = (-abs(temp.hspd))
    }
    if (!muteparticles)
    {
        for (i = 0; i < sprite_get_number(particlesprite); i++)
        {
            if (irandom(6) < 3)
            {
                temp = instance_create(x, y, obj_rockpart)
                temp.sprite_index = particlesprite
                temp.image_index = i
                temp.hspd *= random_range((0.3 * (1 + i * 0.1)), (0.55 * (1 + i * 0.1)))
                temp.vspd *= random_range((0.3 * (1 + i * 0.15)), (0.55 * (1 + i * 0.15)))
            }
        }
    }
}
if (!ds_list_empty(children))
{
    for (i = 0; i < ds_list_size(children); i++)
    {
        with (ds_list_find_value(children, i))
            instance_destroy()
    }
}
ds_list_destroy(children)
