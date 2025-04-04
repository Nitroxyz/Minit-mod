if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    vspd = 0
}
else
    grounded = 0
if (!grounded)
    vspd += grav
sprite_index = spr_punchbot_idle
image_speed = 0.2
hspd = 0
stun_state = 315
animate_actor()
var line_of_sight = collision_rectangle(x, bbox_top, (x + alert_range * image_xscale), (bbox_top + 9), obj_player, 0, 1)
if line_of_sight
{
    if (!alerted)
        alerted = 1
}
if (hp_on_idle_enter != hp)
{
    if (!alerted)
        alerted = 1
}
if (grounded && alerted)
{
    sprite_index = spr_punchbot_alert
    iindex = 0
    image_speed = 0.2
    state = 405
    audio_play_sound(bigpc4, 100, false)
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
