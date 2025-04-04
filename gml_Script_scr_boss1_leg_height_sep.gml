with (leg_l)
{
    image_xscale = lerp(image_xscale, (argument0 / sprite_get_width(sprite_index)), 0.5)
    if (image_xscale < 0.4)
        footvis = 0
    else
        footvis = 1
    if ((!footactive) && footvis)
    {
        footactive = 1
        instance_activate_object(foot)
    }
    else if ((!footvis) && footactive)
    {
        footactive = 0
        instance_deactivate_object(foot)
    }
}
with (leg_r)
{
    image_xscale = lerp(image_xscale, (argument1 / sprite_get_width(sprite_index)), 0.5)
    if (image_xscale < 0.4)
        footvis = 0
    else
        footvis = 1
    if ((!footactive) && footvis)
    {
        footactive = 1
        instance_activate_object(foot)
    }
    else if ((!footvis) && footactive)
    {
        footactive = 0
        instance_deactivate_object(foot)
    }
}
