if hide_duplicates
{
    destroy_me = 0
    with (obj_vacant_sub)
    {
        if (id != other.id)
        {
            if instance_exists(obj_player)
            {
                if (point_distance(x, y, obj_player.x, obj_player.y) <= point_distance(other.x, other.y, obj_player.x, obj_player.y))
                    other.destroy_me = 1
            }
        }
    }
    if destroy_me
        instance_destroy()
}
