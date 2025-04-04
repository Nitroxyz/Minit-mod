instance_create(x, y, obj_bulimp)
var au = audio_play_sound(snd_bulletimpact, 1, false)
audio_sound_pitch(au, random_range(0.5, 0.4))
audio_sound_gain(au, 0.3, 0)
var t = instance_create(x, y, obj_rocketboom)
instance_create(x, y, obj_rocketboom_rockdamage)
t.pushplayer = 1
instance_create(x, y, obj_shakesmall)
flag = 1
