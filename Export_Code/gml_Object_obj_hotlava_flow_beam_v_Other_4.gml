if instance_exists(par)
{
    depth = par.depth + 1
    x = par.x
    y = 16
    image_yscale = (par.y - y) / 16
}
else
    instance_destroy()
