with (all)
{
    if (depth < other.depth)
        other.depth = depth - 1
}
x = obj_anim_editor.stage_x + 2
y = obj_anim_editor.stage_y + 21
if (instance_number(obj_fx3_test) < 3)
    instance_create(0, 0, obj_fx3_test)
vspd = -2
grav = 0.1
hspd = wrap(instance_number(obj_fx3_test), 1, 3.5)
iindex = 0
image_speed = 0.25
destroyontouch = 1
var sfx = audio_play_sound(snd_shot, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
