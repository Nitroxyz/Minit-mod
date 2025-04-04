animate_actor()
if ((iindex + image_speed) >= image_number)
{
    instance_destroy()
    return;
}
if instance_exists(par)
{
    x = par.x + xoff
    y = par.y + yoff
}
else
    instance_destroy()
