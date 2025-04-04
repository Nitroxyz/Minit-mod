sprite_index = spr_trashcan_shoot
image_speed = 0.2
animate_actor()
if (iindex == 2)
{
    var bullet = instance_create((x + sign(image_xscale) * 6), (y + 6), obj_trashcan_bullet)
    bullet.hspd = sign(image_xscale) * 3
}
if ((iindex + image_speed) >= image_number)
{
    timer++
    if (timer == 3)
    {
        state = 391
        sprite_index = spr_trashcan_close
        iindex = 0
        image_speed = 0
        timer = 30
    }
}
