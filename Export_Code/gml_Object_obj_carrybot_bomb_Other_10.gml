iindex_old = iindex
animate_actor()
if (sprite_index == spr_carrybot_bomb_open)
{
    vspd = 0
    if ((iindex + image_speed) >= image_number)
    {
        sprite_index = spr_carrybot_bomb_fall
        iindex = 0
    }
}
else
{
    if (iindex_old > iindex)
        audio_play_sound(snd_carrybomb_spin, 100, false)
    vspd += grav
    image_speed = (abs(point_distance(0, 0, hspd, vspd))) * 0.1
}
var bullet = instance_place((x + hspd), (y + vspd), obj_bullet_sm)
if bullet
{
    var pd = point_direction(bullet.x, bullet.y, x, y)
    hspd = lengthdir_x(3, pd)
    vspd = lengthdir_y(3, pd)
    with (bullet)
        instance_destroy()
}
else
{
    bullet = instance_place((x + hspd), (y + vspd), obj_rocket_new)
    if bullet
    {
        pd = point_direction(bullet.x, bullet.y, x, y)
        hspd = lengthdir_x(3, pd)
        vspd = lengthdir_y(3, pd)
        with (bullet)
        {
            var t = instance_create(x, y, obj_rocketboom)
            t.pushplayer = 1
            t.atk = atk
            instance_destroy()
        }
    }
    else
    {
        bullet = instance_place((x + hspd), (y + vspd), obj_player)
        if bullet
        {
            if (bullet.move_state == 67)
            {
                pd = point_direction(bullet.x, bullet.y, x, y)
                hspd = lengthdir_x(3, pd)
                vspd = lengthdir_y(3, pd)
                with (bullet)
                {
                    pd += 180
                    vspd = lengthdir_y((mech_jumpspd * 1.25), pd)
                    hspd = lengthdir_x((mech_jumpspd * 0.75), pd)
                    alarm[6] = 10
                }
            }
        }
    }
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd)
}
x += hspd
if (place_meeting(x, (y + vspd), obj_wall) || place_meeting(x, (y + vspd), obj_bridgenode))
{
    while ((!(place_meeting(x, (y + sign(vspd)), obj_wall))) && (!(place_meeting(x, (y + sign(vspd)), obj_bridgenode))))
        y += sign(vspd)
    vspd = 0
    explode = 1
}
y += vspd
if explode
{
    instance_destroy()
    var ztz = instance_create(x, (y + 16), obj_grenade_explosion)
    ztz.y -= 6
    var tsound = audio_play_sound(snd_rocket_explosion, 100, false)
    audio_sound_pitch(tsound, 0.6)
    audio_sound_gain(tsound, 0.8, 70)
    shake_screen(15)
    var _obj = instance_create(x, y, obj_bombflame)
    _obj.hspd = -1
    _obj = instance_create(x, y, obj_bombflame)
    _obj.hspd = 1
}
