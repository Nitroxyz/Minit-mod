var old_height = height
height = lerp(height, 78, 0.15)
if (abs(height - 78) < 1)
{
    height = 78
    arm_l.planted = 0
    arm_r.planted = 0
    scr_wait_state(10, 30, 411)
    shake_screen(12)
    head.image_index = 2
}
scr_boss1_leg_height(height)
var new_y = y + (old_height - height)
scr_boss1_body_move(x, new_y)
