event_inherited()
hspd = 0
hp = 1
stun_sprite = 334
gibs_sprite = 278
state = 331
init_state = state
acc = 0.05
dad = undefined
hitsound = 65
fly_sound = snd_fly_fly
flying_sfx = undefined
flying_sfx = audio_play_sound(fly_sound, 10, true)
audio_sound_pitch(flying_sfx, random_range(0.9, 1.1))
try_to_align_timer = 120
