event_inherited()
if (!c_destroy)
{
    instance_create(x, y, obj_grenade_explosion)
    instance_create(x, y, obj_bubble)
    if instance_exists(obj_shakesmall2)
        instance_create(x, y, obj_shakesmall2)
    var t0 = audio_play_sound(GrenadeBlowup, 100, false)
    audio_sound_pitch(t0, random_range(0.8, 1))
    audio_sound_gain(t0, random_range(0.5, 0.6), 3)
}
