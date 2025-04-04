music_duck(0, 500)
sprite_index = spr_gary_pod_dead
state = 669
obj_boss_gary_pod.hspd = 0
obj_boss_gary_pod.vspd = -2
machine.visible = false
crusher.visible = false
qu_set(668)
audio_play_sound(snd_gary_deahcry, 100, false)
if audio_is_playing(snd_gary_saw)
    audio_stop_sound(snd_gary_saw)
if audio_is_playing(snd_gary_engine)
    audio_stop_sound(snd_gary_engine)
