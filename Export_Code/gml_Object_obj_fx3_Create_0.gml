with (ACTOR)
{
    if (depth < other.depth)
        other.depth = depth - 1
}
var inst = instance_create((obj_custom9.x + 2 * obj_custom9.image_xscale), (obj_custom9.y + 21), obj_hotboy_bullet)
inst.hspd *= obj_custom9.image_xscale
instance_destroy()
