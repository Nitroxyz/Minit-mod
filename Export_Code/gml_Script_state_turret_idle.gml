sprite_index = spr_turret_shoot
if key_dismount
{
    player_exit_turret()
    return;
}
if (iindex == 0)
{
    if key_shoot
    {
        if (turret_shoot_energy < turret_shoot_energy_max)
        {
            turret_shoot_energy += 2
            if ((turret_shoot_energy % 5) == 0)
                audio_play_sound(snd_boss2_TimerBeep, 5, false)
            if (turret_shoot_energy == turret_shoot_energy_max)
                var snd = audio_play_sound(snd_hud_cooled, 5, false)
        }
    }
    else if key_shoot_release
    {
        if (turret_shoot_energy >= turret_shoot_energy_max)
        {
            turret_shoot_energy = 0
            image_speed = 1
            iindex = 0.1
            image_index = 0.1
            var b = instance_create((x + (lengthdir_x(8, turret_shoot_direction)) + image_xscale * 5), (y + (lengthdir_y(8, turret_shoot_direction)) - image_yscale * 5), obj_turret_bullet)
            b.image_angle = turret_shoot_direction
        }
    }
    else
        turret_shoot_energy = approach(turret_shoot_energy, 0, 1)
}
else if ((iindex + image_speed) >= image_number)
{
    image_speed = 0
    image_index = 0
    iindex = 0
}
iindex_set()
