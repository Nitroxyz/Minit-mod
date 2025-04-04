if place_meeting(x, (y - 1), obj_player)
    obj_player.vspd -= 2
if (!c_destroy)
{
    with (obj_crate)
    {
        state = 1
        vspd = 0
    }
    gibs_sprite = sprite_index
    if (t_dir == -1)
        enemy_creat_gibs()
    else
        enemy_creat_gibs_ext(sin(degtorad(t_dir)), cos(degtorad(t_dir)))
    if (!audio_is_playing(cratebreak))
    {
        var cbsound = audio_play_sound(cratebreak, 100, false)
        audio_sound_pitch(cbsound, random_range(0.8, 1.2))
    }
    for (i = 0; i < 6; i++)
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
            instance_create((x - 4 + 4 * (i % 3)), (y - 2 + 4 * (i div 2)), obj_crate_particle)
    }
}
