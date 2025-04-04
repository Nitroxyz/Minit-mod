event_inherited()
if c_destroy
{
    with (obj_boss2_arm_socket)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_arm_segment)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_claw)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_body_seg)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_sub_holder)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_claw_grenade)
    {
        c_destroy = 1
        instance_destroy()
    }
    with (obj_boss2_bullet)
    {
        c_destroy = 1
        instance_destroy()
    }
}
else
{
    audio_play_sound(snd_mouse_deathcry, 100, false)
    instance_create(x, y, obj_boss2_sub_dummy)
}
if audio_is_playing(subsound)
    audio_stop_sound(subsound)
global.boss_hud_active = 0
global.boss_hud_target = -1
