length_l = argument0
length_r = argument1
var flag = 0
with (arm_l)
{
    var t_len = other.length_l
    if (image_xscale != t_len)
    {
        image_xscale = lerp(image_xscale, t_len, 0.1)
        if (abs(image_xscale - t_len) < (abs(t_len) / 90))
            image_xscale = t_len
        if (image_xscale < 1)
            instance_deactivate_object(claw)
        else
            instance_activate_object(claw)
    }
    else
    {
        planted = 1
        shake_screen(2)
    }
}
with (arm_r)
{
    t_len = other.length_r
    if (image_xscale != t_len)
    {
        image_xscale = lerp(image_xscale, t_len, 0.1)
        if (abs(image_xscale - t_len) < (abs(t_len) / 90))
            image_xscale = t_len
        if (image_xscale < 1)
            instance_deactivate_object(claw)
        else
            instance_activate_object(claw)
    }
    else
    {
        planted = 1
        shake_screen(2)
    }
}
