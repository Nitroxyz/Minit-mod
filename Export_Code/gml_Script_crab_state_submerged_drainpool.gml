animate_custom()
if (!audio_is_playing(snd_drain_lavapool))
    audio_play_sound(snd_drain_lavapool, 100, true)
if place_meeting(x, (y - 24), obj_hotlava)
{
    vspd = approach(vspd, (-floatspeed), floatacc)
    y += vspd
}
else
{
    vspd = approach(vspd, fallspeed, grav)
    y += vspd
    if place_meeting(x, (y - 24), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
y = min((ystart + 3), y)
if (!(place_meeting((x - image_xscale * 32), y, obj_wall)))
    x -= image_xscale
else
    image_xscale *= -1
var lavaclear_flag = 1
if instance_exists(obj_hotlava)
{
    with (obj_hotlava)
    {
        if (sprite_index == spr_hotlava_fill || sprite_index == spr_hotlava_top)
        {
            lavaclear_flag = 0
            y += 0.125
            if place_meeting(x, y, obj_wall)
            {
                with (instance_place(x, y, obj_wall))
                {
                    if (depth > other.depth)
                        depth = other.depth - 1
                }
            }
            if ((y + 8) >= 196)
                instance_destroy()
        }
    }
    if (!instance_exists(obj_shake))
        shake_screen(10)
}
if lavaclear_flag
{
    if instance_exists(obj_hotlava_flow_beam_v)
    {
        with (obj_hotlava_flow_beam_v)
            instance_destroy()
        with (obj_wall2)
            instance_destroy()
        shake_screen(30)
        image_speed = 0.25
        c_anim_load_anim("anim_crab_ground_handsup_idle")
        state = 605
        state_timer = 10
        if audio_is_playing(snd_drain_lavapool)
            audio_stop_sound(snd_drain_lavapool)
    }
}
