missilecopter_enginesound_mod()
sprite_index = spr_missilecopter_shoot
image_speed = 0.2
animate_actor()
if (iindex == 3)
{
    var bullet = instance_create((x + image_xscale * 4), y, obj_guardian_rocket)
    hspd = (-image_xscale) * 2
}
if ((iindex + image_speed) >= image_number)
{
    sprite_index = spr_missilecopter_fly
    state = 397
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.5
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 0.5
}
y += vspd
