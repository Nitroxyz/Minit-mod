if (!debug_commands)
    return;
if (global.vents_cleared == 0)
{
    global.vents_cleared = 1
    var s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.6 + global.vents_cleared / 2))
}
else if (global.vents_cleared == 1)
{
    global.vents_cleared = 2
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.7 + global.vents_cleared / 2))
}
else if (global.vents_cleared == 2)
{
    global.vents_cleared = 3
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.8 + global.vents_cleared / 2))
}
else
{
    global.vents_cleared = 0
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.5 + global.vents_cleared / 2))
}
