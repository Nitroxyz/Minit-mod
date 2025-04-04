if (!debug_commands)
    return;
global.water_level = wrap((global.water_level + 1), 0, 4)
var s = audio_play_sound(FrogBubblePop, 100, false)
audio_sound_pitch(s, (1 + global.water_level / 10))
