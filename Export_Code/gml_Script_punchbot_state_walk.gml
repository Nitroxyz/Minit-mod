sprite_index = spr_punchbot_walk
image_speed = 0.2
stun_state = 407
var iindex_old = floor(iindex)
animate_actor()
if (iindex_old != floor(iindex) && (iindex_old == 0 || iindex_old == 4))
{
    var stepsnd = audio_play_sound(snd_driller_footstep, 100, false)
    audio_sound_pitch(stepsnd, 0.45)
}
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    vspd = 0
}
else
    grounded = 0
if (!grounded)
    vspd += grav
if instance_exists(obj_player)
{
    p = obj_player
    if (p.x < x)
        hspd = approach(hspd, (-spd), 0.1)
    else if (p.x > x)
        hspd = approach(hspd, spd, 0.1)
    image_xscale = sign(hspd)
    if (point_distance(x, y, p.x, p.y) < punch_range)
    {
        sprite_index = spr_punchbot_punch
        iindex = 0
        state = 403
    }
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
