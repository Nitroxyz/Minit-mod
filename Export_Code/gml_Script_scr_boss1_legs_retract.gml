height = lerp(height, 3, 0.1)
scr_boss1_leg_height(height)
if (!audio_is_playing(RailBossExtened))
{
    extendsound = audio_play_sound(RailBossExtened, 100, true)
    audio_sound_pitch(extendsound, (1.5 - abs(height) / 6))
}
else
    audio_sound_pitch(extendsound, (1.5 - abs(height) / 6))
if (abs(height - 3) < 2)
{
    height = 3
    scr_boss1_leg_height(height)
    scr_wait_state(10, 30, 418)
    if audio_is_playing(extendsound)
        audio_stop_sound(extendsound)
    hspd = 0
    turretc_ang = 270
    turretc_vis = 1
    turretc_off = -3
    alarm[1] = 90
    alarm[2] = 4
    alarm[11] = 480
    head.image_index = 2
}
