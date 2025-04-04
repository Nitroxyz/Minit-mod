event_inherited()
if (!c_destroy)
{
    instance_create(x, y, obj_grenade_explosion_big)
    instance_create(x, y, obj_bubble)
    instance_create(x, y, obj_shakesmall2)
    var t0 = audio_play_sound(GrenadeExplode, 100, false)
    var t1 = audio_play_sound(GrenadeBlowup_Layer2, 100, false)
    audio_sound_pitch(t0, random_range(0.5, 0.6))
    audio_sound_pitch(t1, random_range(0.4, 0.6))
    audio_sound_gain(t1, random_range(0.5, 0.6), 3)
}
