if (!instance_exists(dad))
    instance_destroy()
if (hp <= 0)
{
    if (obj_boss_vent.state == 618)
        hp = 1
    else
    {
        audio_play_sound(snd_ventboss_shield_destroy, 100, false)
        shake_screen(10)
        enemy_creat_gibs()
        instance_destroy()
    }
}
