event_inherited()
alarm[0] = -1
stuntimer = 1
vspd = 0
hspd = 0
iindex = 0
image_speed = 0.3
var sfx = audio_play_sound(snd_rocket, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
hum = audio_play_sound(snd_guardian_missile_hum, 5, true)
destroyontouch = 1
hitsound = 112
cloud_timer = 5
targetdir = 270
actualdir = 270
