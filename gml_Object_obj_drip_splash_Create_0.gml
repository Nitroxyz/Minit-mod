while place_meeting(x, y, obj_lavatop)
    y--
iindex = 0
image_speed = 0.25
image_xscale = choose(-1, 1)
if is_within_view(x, y, 0, 32)
{
    var t = audio_play_sound(choose(165, 166, 167), 5, false)
    audio_sound_pitch(t, random_range(0.93, 1.05))
}
