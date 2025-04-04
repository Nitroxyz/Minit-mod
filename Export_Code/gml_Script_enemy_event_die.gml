if (!destroyontouch)
{
    instance_create(x, y, obj_enemydeath_explosion)
    instance_create(x, y, obj_shakesmall2)
    if makesound
    {
        if audio_is_playing(snd_enemy_death)
            audio_stop_sound(snd_enemy_death)
        var _sfx = audio_play_sound(snd_enemy_death, 10, false)
        audio_sound_pitch(_sfx, random_range(0.9, 1.1))
    }
    enemy_creat_gibs()
}
else
{
    instance_create(x, y, obj_splosion)
    instance_create(x, y, obj_shakesmall2)
    instance_create(x, y, obj_bulimp)
    if makesound
    {
        audio_play_sound(GrenadeExplode, 100, false)
        audio_play_sound(GrenadeBlowup_Layer2, 100, false)
    }
}
instance_destroy()
