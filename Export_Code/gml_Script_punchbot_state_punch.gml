sprite_index = spr_punchbot_punch
image_speed = 0.2
stun_state = 317
animate_actor()
hspd = approach(hspd, 0, 0.2)
if (iindex == 8)
{
    fist = instance_create((x + image_xscale * 16), (y - 4), obj_punchbot_fist)
    fist.dad = id
    fist.image_xscale = image_xscale
    hspd = 2 * image_xscale
}
else if (iindex == 7)
    audio_play_sound(GrenadeLaunch, 100, false)
if ((iindex + image_speed) >= image_number)
{
    sprite_index = spr_punchbot_reload
    iindex = 0
    state = 402
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
