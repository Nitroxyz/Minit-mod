var old_height = height
height = lerp(height, 15, 0.2)
if (abs(height - 15) < 1)
{
    height = 15
    jumpspeed = 2
    state = 422
    head.image_index = 1
}
leg_l.image_xscale = height / 9
leg_r.image_xscale = height / 9
new_y = y + (old_height - height)
scr_boss1_arms_retract(0.33, 0.33)
scr_boss1_body_move(x, new_y)
