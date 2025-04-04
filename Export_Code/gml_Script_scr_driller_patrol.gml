if (abs(hspd) < 0.1)
{
    hspd = lerp(hspd, (dir * 0.2), 0.1)
    if (abs(hspd) >= 0.1)
    {
        image_xscale = dir
        while place_meeting(x, y, obj_wall)
            x += sign(dir)
    }
}
else
{
    hspd = lerp(hspd, (dir * patrolspd), 0.1)
    image_speed = abs(hspd) / 5
}
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
        xtemp += sign(hspd)
    dir *= -1
    image_index = 0
    image_speed = 0
    hspd = 0
}
else
    xtemp += hspd
if (!(place_meeting((xtemp + 9 * dir), (ytemp + 1), obj_wall)))
{
    dir *= -1
    hspd = 0
    image_index = 0
    image_speed = 0
}
x = round(xtemp)
y = round(ytemp)
if instance_exists(obj_player)
{
    if (alert_ready && place_meeting(obj_player.x, y, obj_player))
    {
        state = 363
        audio_play_sound(DrillerAlerted, 100, false)
        image_index = 0
        image_speed = 0.1
        sprite_index = spr_driller_alert
        if (obj_player.x != x)
            dir = sign(obj_player.x - x)
        image_xscale = sign(dir)
    }
}
