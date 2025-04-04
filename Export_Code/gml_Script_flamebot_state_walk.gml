sprite_index = spr_flamebot_walk
image_speed = 0.2
animate_actor()
if grounded
    vspd = 0
else
    vspd += 0.2
hspd = 0.5 * image_xscale
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    image_xscale = (-image_xscale)
    hspd = 0
}
if (!(position_meeting((x + 8 * sign(hspd)), (y + 16), obj_wall)))
{
    image_xscale = (-image_xscale)
    hspd = 0
}
if instance_place((x + hspd), y, obj_flamebot)
{
    var o = instance_place((x + hspd), y, obj_flamebot)
    image_xscale = (-image_xscale)
    hspd = (-hspd)
    o.image_xscale *= -1
    o.hspd *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (hp != hp_old)
{
    hp_old = hp
    if instance_exists(obj_player)
    {
        if (sign(obj_player.x - x) != image_xscale)
        {
            image_xscale *= -1
            hspd = 0
            state = 372
            timer = 60
            return;
        }
    }
}
if (timer > 0)
{
    timer--
    if ((iindex % 4) == 1)
        audio_play_sound(snd_flamebot_footstep, 100, false)
}
else
{
    state = 372
    timer = 90
}
