armlength_old = floor(armlength)
armlength = min((armlength + armspeed), armlengthmax)
armwave_angle += armwave_rotate_speed
if (armlength == armlengthmax)
{
    if grenade_on_release
    {
        grenade_on_release = 0
        if instance_exists(obj_boss2_sub)
        {
            if (obj_boss2_sub.hp < (obj_boss2_sub.hp_max / 2.2))
            {
                if (y > 150 || y < 50)
                {
                    var ttt = instance_create((armwave_claw.x - 12), armwave_claw.y, obj_boss2_rocket)
                    ttt.hspd = (-armspeed)
                }
                else
                {
                    ttt = instance_create((armwave_claw.x - 10), armwave_claw.y, obj_boss2_mine)
                    ttt.hspd = (-armspeed)
                }
            }
            else
                instance_create((armwave_claw.x - 6), armwave_claw.y, obj_boss2_claw_grenade)
        }
        armwave_claw.iindex = 1
        audio_play_sound(snd_boss2_ClawReleaseBomb, 5, false)
    }
    armspeed = 0
    if (armwave_mag > 0)
    {
        armsegment_stretch = approach(armsegment_stretch, 1.2, 0.007)
        armwave_mag = approach(armwave_mag, 0, 0.19)
        if stretch_sound_ready
        {
            stretch_sound_ready = 0
            audio_play_sound(snd_boss2_ArmEndPoint, 5, false)
        }
    }
    else if (armsegment_stretch > 1)
        armsegment_stretch = approach(armsegment_stretch, 1, 0.01)
    else
        state = 438
}
else
    armwave_mag = approach(armwave_mag, armwave_magstart, 1)
if (armlength_old != floor(armlength))
{
    armsegment[armlength_old].visible = true
    if (armwave_claw.visible == false)
        armwave_claw.visible = true
}
process_boss2_update_arm_segments()
