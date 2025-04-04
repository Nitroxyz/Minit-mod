sin_ticker += 1
if (sin_ticker >= 360)
    sin_ticker -= 360
float_x = cos(degtorad(sin_ticker)) * 0.25
float_y = sin(degtorad(sin_ticker)) * 0.25
image_xscale = sign(hdir)
vspd = vdir * 0.5 + float_y
hspd = hdir * 0.5 + float_x
if (hp < hp_max && (!stun))
{
    audio_play_sound(FrogBubblePop, 100, false)
    state = 349
    hspd *= -1
    sprite_index = spr_froggo_jump
    if (vspd < 0)
    {
        vspd = 0
        image_index = 1
    }
    else
    {
        vspd = -1
        image_index = 0
    }
}
if place_meeting(xtemp, ytemp, obj_lavatop)
{
    var inst = instance_place(xtemp, ytemp, obj_lavatop)
    if (!inst.water)
    {
        audio_play_sound(FrogBubblePop, 100, false)
        state = 349
        hspd *= -1
        sprite_index = spr_froggo_jump
        image_speed = 0
        if (vspd < 0)
        {
            vspd = 0
            image_index = 1
        }
        else
        {
            vspd = -1
            image_index = 0
        }
    }
}
var hspd_r = round(hspd)
var vspd_r = round(vspd)
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
        xtemp += sign(hspd)
    hspd = 0
    hdir *= -1
    image_xscale = sign(hspd)
}
else
    xtemp += hspd
if place_meeting(xtemp, (ytemp + vspd), obj_wall)
{
    while (!(place_meeting(xtemp, (ytemp + sign(vspd)), obj_wall)))
        ytemp += sign(vspd)
    vspd = 0
    vdir *= -1
}
else
    ytemp += vspd
x = round(xtemp)
y = round(ytemp)
