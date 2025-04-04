if (!debug_commands)
    return;
if (global.flows_cleared == 0)
{
    global.flows_cleared = 1
    var s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.6 + global.lava_cooled / 2))
}
else if (global.flows_cleared == 1)
{
    global.flows_cleared = 2
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.7 + global.lava_cooled / 2))
}
else if (global.flows_cleared == 2 && (!global.lava_cooled))
{
    global.lava_cooled = 1
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.8 + global.lava_cooled / 2))
}
else
{
    global.lava_cooled = 0
    global.flows_cleared = 0
    s = audio_play_sound(FrogBubblePop, 100, false)
    audio_sound_pitch(s, (0.5 + global.lava_cooled / 2))
}
