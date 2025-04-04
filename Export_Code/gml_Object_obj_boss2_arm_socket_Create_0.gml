event_inherited()
c_destroy = 0
state = 2
image_speed = 0
iindex = 0
armlength = 0
armlengthmax = 28
armlengthmax_start = 28
armspeed = 0
armsegment = self
armsegment_stretch = 1
armsegments_active = 0
armwave_angle = 0
armwave_mag = 0
armwave_magstart = 8
armwave_rotate_speed = 0.1
armwave_segment_rotate = 0.3
grenade_on_release = 0
for (var i = 0; i < 28; i++)
{
    armsegment[i] = instance_create((x + 8), y, obj_boss2_arm_segment)
    armsegment[i].visible = false
    armsegment[i].depth = depth + 2 - i / 32
}
armwave_claw = instance_create((x + 8), y, obj_boss2_claw)
armwave_claw.visible = false
armwave_claw.depth = depth + 1
