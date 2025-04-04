hspd += ((0 - hspd) * 0.1)
vspd += ((0 - vspd) * 0.1)
sprite_index = spr_drone_pissed
image_speed = 0.2
animate_actor()
if (iindex == (image_number - 1))
{
    state = 327
    if (flying_audio == undefined)
        flying_audio = audio_play_sound(snd_drone_fly, 10, true)
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.25
    image_xscale *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 0.25
}
if no_screen_exit
{
    y = max((camera_get_view_y(view_camera[0]) + 8), (y + vspd))
    if (vspd < 0 && y == (camera_get_view_y(view_camera[0]) + 8))
        vspd *= -1
}
else
    y += vspd
