sprite_index = spr_driller_chase
image_speed = 0.2
stun_state = 317
var iindex_old = floor(iindex)
animate_actor()
if (iindex_old != floor(iindex))
{
    if (iindex_old == 0)
        audio_play_sound(snd_driller_runstep, 100, false)
    else if (iindex_old == 2)
        audio_play_sound(snd_flamebot_footstep, 100, false)
}
if grounded
    vspd = 0
else
    vspd += 0.2
hspd = 3 * image_xscale
if place_meeting((x + hspd), y, obj_wall)
{
    var obj = instance_place((x + hspd), y, obj_wall)
    if obj.destruct
    {
        with (obj)
            instance_destroy()
    }
    else
    {
        while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        var sfx = audio_play_sound(snd_driller_hitwall0, 5, false)
        instance_create(x, y, obj_shakesmall)
        hspd = 0
        iindex = 0
        if audio_is_playing(drillsound)
            audio_stop_sound(drillsound)
        drillsound = -1
        state = 388
        timer = timer_max
    }
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (x < (obj_camera.xmin + 12) || x > (obj_camera.xmax - 12 + 304))
{
    x = approach(x, (obj_camera.xmin + 150), 4)
    sfx = audio_play_sound(snd_driller_hitwall0, 5, false)
    instance_create(x, y, obj_shakesmall)
    hspd = 0
    iindex = 0
    if audio_is_playing(drillsound)
        audio_stop_sound(drillsound)
    drillsound = -1
    state = 388
    timer = timer_max
}
