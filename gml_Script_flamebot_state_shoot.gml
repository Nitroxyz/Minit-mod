sprite_index = spr_flamebot_throwing_flame
image_speed = 0.2
hspd = 0
if grounded
    vspd = 0
else
    vspd += 0.2
animate_actor()
if (timer > 0)
    timer--
else
{
    state = 375
    iindex = 0
    timer = 240
}
if ((timer % 5) == 0)
{
    if ((timer % 10) == 0)
        audio_play_sound(snd_flamebot_flameloop, 100, false)
    var flame = instance_create((x + sign(image_xscale) * 12), (y - 8), obj_flamebot_flame)
    flame.movedir = (point_direction(0, 0, image_xscale, 0)) + (dsin(timer * 4)) * 8
    flame.image_speed = 0.2 + (dsin(timer * 8)) * 0.05
    flame.image_xscale = image_xscale
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    image_xscale = (-image_xscale)
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
