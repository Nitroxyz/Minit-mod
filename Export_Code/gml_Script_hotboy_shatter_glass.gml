for (var i = 0; i < 4; i++)
{
    instance_create((x + 8 * image_xscale), (y - 8 + 16 * i), obj_glass_particle)
    instance_create((x - 8 * image_xscale), (y - 8 + 16 * i), obj_glass_particle)
    instance_create((x - 24 * image_xscale), (y - 8 + 16 * i), obj_glass_particle)
    instance_create((x - 40 * image_xscale), (y - 8 + 16 * i), obj_glass_particle)
}
