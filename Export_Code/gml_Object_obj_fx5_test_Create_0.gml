with (all)
{
    if (depth < other.depth)
        other.depth = depth - 1
}
x = obj_anim_editor.stage_x - 24
y = obj_anim_editor.stage_y - 36
alarm[0] = 0
vspd = -1
hspd = 0
iindex = 0
angle = 0
angle_speed = 0.3141592653589793
image_speed = 0.5
destroyontouch = 1
var sfx = audio_play_sound(snd_shot, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
