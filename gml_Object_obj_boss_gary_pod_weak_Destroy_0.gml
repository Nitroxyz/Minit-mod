event_inherited()
global.boss_hud_active = 0
global.boss_hud_target = -1
with (machine)
    instance_destroy()
with (crusher)
    instance_destroy()
if audio_is_playing(snd_gary_saw)
    audio_stop_sound(snd_gary_saw)
if audio_is_playing(snd_gary_engine)
    audio_stop_sound(snd_gary_engine)
