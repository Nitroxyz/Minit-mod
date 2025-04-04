var spd = point_distance(0, 0, (x - xprevious), (y - yprevious))
audio_sound_pitch(enginesound, approach(audio_sound_get_pitch(enginesound), (0.6 + spd * 0.5), 0.005))
audio_sound_gain(enginesound, min(1, (spd + 0.25)), 30)
