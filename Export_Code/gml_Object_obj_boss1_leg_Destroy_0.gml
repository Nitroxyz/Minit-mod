repeat (4)
{
    var temp = instance_create((x + irandom(6) - 3), (y + irandom(6) - 3), obj_bubble)
    temp.depth = depth + (choose(4, -4))
}
instance_destroy(foot)
