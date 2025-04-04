var spd = point_distance(0, 0, hspd, vspd)
if instance_exists(obj_player)
{
    audio_sound_pitch(enginesound, approach(audio_sound_get_pitch(enginesound), (0.45 + spd * 0.5), 0.005))
    audio_sound_gain(enginesound, (0.8 - (point_distance(x, y, obj_player.x, obj_player.y)) / 300), 0)
}
