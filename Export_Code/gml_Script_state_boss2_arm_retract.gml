armlength_old = floor(armlength)
armlength = max((armlength + armspeed), 0)
armspeed = max((armspeed - 0.1), -0.9)
armsegment_stretch = approach(armsegment_stretch, 0.5, 0.01)
armwave_mag = approach(armwave_mag, 0, 0.5)
if (armlength == 0)
{
    armwave_mag = 0
    state = 2
}
if (armlength_old != 0 && armlength_old != floor(armlength))
{
    armlength_old--
    armsegment[armlength_old].visible = false
    armsegment[armlength_old].x = armsegment[armlength_old].xstart
    armsegment[armlength_old].y = armsegment[armlength_old].ystart
    if (armlength_old == 0)
        armwave_claw.visible = false
}
process_boss2_update_arm_segments()
