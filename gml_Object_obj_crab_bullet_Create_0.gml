event_inherited()
alarm[0] = 0
vspd = -1
hspd = 0
iindex = 0
angle = 0
angle_speed = 0.15707963267948966
mag = 0
image_speed = 0.5
destroyontouch = 1
var sfx = audio_play_sound(snd_shot, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
