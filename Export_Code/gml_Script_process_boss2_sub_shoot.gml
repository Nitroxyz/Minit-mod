var t = instance_create((x - 23), (y + 10), obj_boss2_bullet)
t.depth = depth - 1
draw_offset_x = irandom(2) + 2
shoot_repeat = shoot_repeat_max
sprite_index = boss2_body_sub_shooting
audio_play_sound(snd_boss2_SubCannonShoot, 5, false)
repeat (3)
{
    t = instance_create((x - 23 + (random_range(-2, 2))), (y + 10 + (random_range(-2, 2))), obj_bubble)
    t.depth = choose((depth - 1), (depth + 1))
}
