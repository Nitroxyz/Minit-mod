sprite_index = spr_cat_swim_down
in_water = 1
player_start_breath()
move_state = 72
if audio_is_playing(CatSlide)
    audio_stop_sound(CatSlide)
instance_create(x, y, obj_splash)
var snd = audio_play_sound(Splash, 100, false)
audio_sound_pitch(snd, random_range(0.6, 0.7))
if (irandom(6) == 0)
{
    snd = audio_play_sound(CatMeow, 100, false)
    audio_sound_pitch(snd, random_range(0.9, 1.2))
}
