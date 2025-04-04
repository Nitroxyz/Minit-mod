hspd = lerp(hspd, (dir * chasespd), 0.015)
image_speed = abs(hspd) / 20
audio_sound_pitch(DrillerDrilling, (abs(hspd) / 4 + 0.6))
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    var temp = instance_place((xtemp + hspd), ytemp, obj_wall)
    if (temp.destruct == 1)
    {
        with (temp)
            instance_destroy()
        xtemp += hspd
    }
    else
    {
        while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
            xtemp += sign(hspd)
        audio_stop_sound(DrillerDrilling)
        audio_play_sound(choose(47, 67), 100, false)
        state = 365
        sprite_index = spr_driller_stunned
        instance_create(0, 0, obj_shakesmall2)
        hspd = 0
        alarm[1] = 120
        for (i = 0; i < 4; i++)
        {
            temp = instance_create((x + (random(i) + 4) * (choose(-2, 2))), (y + (random(i) + 4) * (choose(-2, 2))), obj_bubble)
            temp.image_index = 1.2 * i + 0.6
            temp.hspd = (abs(6 - 4 * i)) * (sign(temp.x - x))
        }
    }
}
else
    xtemp += hspd
if (!(place_meeting(xtemp, (ytemp + 1), obj_wall)))
{
    grounded = 0
    vspd += 0.2
    image_index = 1
    image_speed = 0
}
else
{
    grounded = 1
    vspd = 0
    image_speed = abs(hspd) / 5
}
if place_meeting(xtemp, (ytemp + vspd), obj_wall)
{
    while (!(place_meeting(xtemp, (ytemp + sign(vspd)), obj_wall)))
        ytemp += sign(vspd)
}
else
    ytemp += vspd
x = round(xtemp)
y = round(ytemp)
