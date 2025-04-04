var _hspd = argument1
var _vspd = argument2
if (stun_state == 317)
{
    if (state != stun_state)
    {
        previous_state = state
        state = stun_state
    }
    return;
}
if (state != stun_state)
{
    hp_old = hp
    hp -= argument0
    alarm[0] = stuntimer
    if makesound
    {
        var ss = audio_play_sound(hitsound, 100, false)
        audio_sound_pitch(ss, (random(0.2) + 0.9))
    }
    previous_state = state
    state = stun_state
    hurt_hspd = sign(_hspd)
    hurt_vspd = sign(_vspd)
}
