sprite_index = spr_driller_stunned
var iindex_old = iindex
animate_actor()
if (!(place_meeting(x, (y + 1), obj_wall)))
    vspd += grav
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
if (iindex < iindex_old)
{
    hitsound = 330
    stun_state = 315
    iindex = iindex_old
    if (timer == timer_max || timer == (timer_max - 4) || timer == (timer_max - 8))
    {
        var t = instance_create((x - image_xscale * 2), (y - 10), obj_steam_cloud)
        t.hspd = sign(hspd) * (random_range(0.4, 0.8))
        t.vspd = 0
        t.sinemag = 1.5
    }
    if (timer > 0)
        timer--
    else
    {
        hitsound = 331
        timer = timer_max
        state = 387
    }
}
