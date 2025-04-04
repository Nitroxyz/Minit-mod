event_inherited()
with (ACTOR)
{
    if (depth < other.depth)
        other.depth = depth - 1
}
var multiplier = 1
if instance_exists(obj_hotboy1)
    multiplier = obj_hotboy1.bullet_multiplier
vspd = -3
grav = 0.08
hspd = wrap((multiplier * instance_number(obj_hotboy_bullet)), 0.8, 2.5)
iindex = 0
image_speed = 0.25
destroyontouch = 1
if is_within_view(x, y, 0, 5)
{
    var sfx = audio_play_sound(snd_shot, 5, false)
    audio_sound_pitch(sfx, random_range(0.9, 1.1))
}
