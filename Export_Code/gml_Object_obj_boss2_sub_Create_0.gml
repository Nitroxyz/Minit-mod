event_inherited()
state = 2
depth -= 10
iindex = 0
image_speed = 0
sub_holder = instance_create(x, y, obj_boss2_sub_holder)
sub_holder.depth = depth + 1
segcount = 10
sprite_index = boss2_body_sub
stun_sprite = 468
gibs_sprite = 471
visible = false
x -= 21
hp = 170
hp_max = hp
stuntimer = 2
draw_offset_x = 0
draw_offset_y = 0
hitsound = 246
dir = 0
dir_old = 0
spd = 0
xbegin = x
ybegin = y
xmin = x - 156
xnod = x + 14
ynod = y + 6
segment = self
circle_x = 182
circle_xstart = circle_x
circle_y = 84
circle_ystart = circle_y
circle_r = 28
circle_rstart = circle_r
circle_angle = 0
circle_angle_speed = degtorad(3.8)
circle_angle_speed_o = circle_angle_speed
bubble_timer = 15
bubble_timer_min = 4
bubble_timer_max = 15
shoot_repeat = 30
shoot_repeat_max = 20
shoot_stop_counter = 4
shoot_stop_counter_max = 4
arm0 = instance_create(280, 24, obj_boss2_arm_socket)
arm1 = instance_create(280, 56, obj_boss2_arm_socket)
arm2 = instance_create(280, 136, obj_boss2_arm_socket)
arm3 = instance_create(280, 168, obj_boss2_arm_socket)
for (var i = 0; i < 10; i++)
{
    segment[i] = instance_create(xnod, ynod, obj_boss2_body_seg)
    segment[i].depth = depth + 2 + i
}
process_boss2_begin_sub_barrage1()
state = 2
audio_sound_gain(snd_boss2_SubMovementLoop, 0, 0)
subsound = audio_play_sound(snd_boss2_SubMovementLoop, 100, true)
