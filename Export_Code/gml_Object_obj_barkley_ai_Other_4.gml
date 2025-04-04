if (MAP_MANAGER.map_current == "map6")
{
    if instance_exists(obj_player)
    {
        if (obj_player.x > x)
            instance_destroy()
    }
}
