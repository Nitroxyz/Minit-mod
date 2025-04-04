if (global.boss_hud_target != id)
    return;
script_execute(state)
if (bubble_timer > 0)
    bubble_timer--
else
{
    var d = point_distance(x, y, xprevious, yprevious)
    repeat ((irandom(d + 1)) + 1)
        instance_create((x + 4 + irandom(d)), (y - 28 - irandom(d)), testobj_bubble)
    bubble_timer = max((bubble_timer_max - d * 6), bubble_timer_min)
}
if (alarm[0] < 0 && sprite_index == stun_sprite)
    sprite_index = boss2_body_sub
if (draw_offset_x != 0)
    draw_offset_x = (approach(draw_offset_x, 0, 0.5)) * -1
if (draw_offset_y != 0)
    draw_offset_y = (approach(draw_offset_y, 0, 0.5)) * -1
if (y != yprevious)
    audio_sound_gain(subsound, clamp(((abs(y - yprevious)) / 2), 0, 0.7), 1)
else
    audio_sound_gain(subsound, 0, 100)
