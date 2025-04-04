if (armlength > 0)
    state = 438
else
{
    armwave_claw.iindex = 0
    process_boss2_arm_reset_segments()
    state = 439
    armwave_angle = random((2 * pi))
    armspeed = 0.34
    armsegment_stretch = 0.8
    armwave_mag = 0
    armwave_mag = armwave_magstart
    armlengthmax = 8
    grenade_on_release = 1
    stretch_sound_ready = 1
    audio_play_sound(snd_boss2_ArmShootRelease, 5, false)
}
