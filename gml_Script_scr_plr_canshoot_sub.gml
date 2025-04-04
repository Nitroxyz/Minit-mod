if key_shoot2held
{
    if (sub_shoot_timer < sub_shoot_timer_max)
        sub_shoot_timer++
    else
    {
        var bul = instance_create((x + image_xscale * 16), (y + 4 + (min(image_xscale, 0))), obj_torpedo)
        if (image_xscale == 1)
        {
            bul.image_angle = 0
            bul.direction = 0
        }
        else
        {
            bul.image_angle = 180
            bul.direction = 180
        }
        sub_shoot_timer = 0
    }
}
else
    sub_shoot_timer = sub_shoot_timer_max
