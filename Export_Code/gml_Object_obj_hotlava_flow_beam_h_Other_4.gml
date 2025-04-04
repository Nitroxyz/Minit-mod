if instance_exists(par)
{
    depth = par.depth + 1
    if (dir == -1)
    {
        x = 16
        y = par.y
        image_xscale = (par.x - x) / 16
    }
    else
    {
        x = par.x
        y = par.y
        image_xscale = (288 - par.x) / 16
    }
}
else
    instance_destroy()
