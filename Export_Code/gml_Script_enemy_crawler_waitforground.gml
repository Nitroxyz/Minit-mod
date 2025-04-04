animate_actor()
if (!attached)
{
    if place_meeting(x, (y + 1), obj_wall)
    {
        attached = 1
        dir = choose(-1, 1)
        image_angle = 0
        process_enemy_crawler_update_rotation()
    }
    else if place_meeting((x + 1), y, obj_wall)
    {
        attached = 1
        dir = choose(-1, 1)
        image_angle = 90
        process_enemy_crawler_update_rotation()
    }
    else if place_meeting(x, (y - 1), obj_wall)
    {
        attached = 1
        dir = choose(-1, 1)
        image_angle = 180
        process_enemy_crawler_update_rotation()
    }
    else if place_meeting((x - 1), y, obj_wall)
    {
        attached = 1
        dir = choose(-1, 1)
        image_angle = 270
        process_enemy_crawler_update_rotation()
    }
}
