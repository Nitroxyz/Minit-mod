event_inherited()
global.boss_hud_active = 0
global.boss_hud_target = -1
if audio_is_playing(snd_drain_lavapool)
    audio_stop_sound(snd_drain_lavapool)
