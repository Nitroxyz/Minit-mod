sprite_index = spr_punchbot_reload
image_speed = 0.4
stun_state = 317
animate_actor()
hspd = approach(hspd, 0, 0.05)
if ((iindex + image_speed) >= image_number)
{
    sprite_index = spr_punchbot_idle
    image_speed = 0.2
    state = 406
    hp_on_idle_enter = hp
    alerted = 0
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
