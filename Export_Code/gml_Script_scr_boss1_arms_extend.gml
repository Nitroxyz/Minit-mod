if (!audio_is_playing(RailBossExtened))
    extendsound = audio_play_sound(RailBossExtened, 100, true)
var flag = 0
head.image_index = 1
with (arm_l)
{
    if ((!planted) && (!(place_meeting(x, y, obj_wall))))
    {
        image_xscale += 0.33
        flag = 1
        if place_meeting(x, y, obj_wall)
        {
            while place_meeting(x, y, obj_wall)
                image_xscale -= 0.33
            image_xscale -= 0.66
            shake_screen(5)
            planted = 1
        }
    }
    if (image_xscale < 1)
        instance_deactivate_object(claw)
    else
        instance_activate_object(claw)
}
with (arm_r)
{
    if ((!planted) && (!(place_meeting(x, y, obj_wall))))
    {
        image_xscale += 0.33
        flag = 1
        if ((abs(image_xscale) % 1) < 0.1)
            audio_sound_pitch(extendsound, (abs(image_xscale) / 10 + 0.8))
        if place_meeting(x, y, obj_wall)
        {
            while place_meeting(x, y, obj_wall)
                image_xscale -= 0.33
            image_xscale -= 0.66
            shake_screen(5)
            planted = 1
            audio_play_sound(RailBossAttach, 100, false)
        }
    }
    if (image_xscale < 1)
        instance_deactivate_object(claw)
    else
        instance_activate_object(claw)
}
if (!flag)
{
    head.image_index = 0
    body_offset = 1
    scr_wait_state(10, 30, 412)
    if audio_is_playing(extendsound)
        audio_stop_sound(extendsound)
}
