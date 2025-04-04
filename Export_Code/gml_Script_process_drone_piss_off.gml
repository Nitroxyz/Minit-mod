iindex = 0
sprite_index = spr_drone_pissed
image_speed = 0.2
state = 326
var _sfx = audio_play_sound(snd_drone_siren, 10, false)
audio_sound_pitch(_sfx, random_range(0.9, 1.1))
