script_execute(state)
if (hp != hplast)
{
    hp_lost_since_last_rocket += abs(hplast - hp)
    hplast = hp
}
if (x != xprevious)
{
    gear_frame = (x / 4) % 4
    if (!audio_is_playing(snd_guardian_gear_clank))
    {
        audio_play_sound(snd_guardian_gear_clank, 5, false)
        audio_sound_pitch(snd_guardian_gear_clank, clamp(((abs(x - xprevious)) / 3), 0.7, 1.3))
    }
}
else
    gear_frame = 0
if (state != stun_state && hp < 40 && irandom(18) == 0)
{
    previous_state = state
    state = stun_state
    alarm[0] = 2
    var tt = instance_create((x - 16 + irandom(32)), (y + irandom(10)), obj_dust_cloud_land)
    tt.depth = depth - 1
}
