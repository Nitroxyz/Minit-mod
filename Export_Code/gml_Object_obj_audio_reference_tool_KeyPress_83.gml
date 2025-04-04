audio_level = clamp((audio_level - 0.01), 0, 1)
global.audio_default_volumes[audio_cur] = audio_level
audio_sound_gain(audio_cur, audio_level, 0)
if (!audio_is_playing(audio_cur))
    audio_play_sound(audio_cur, 100, false)
