var t_flag = 1
with (obj_hot_tube)
{
    if (iindex != 2)
        t_flag = 0
}
if t_flag
{
    if instance_exists(obj_player)
    {
        if (obj_player.grounded || obj_player.vehicle == 2 || (!instance_exists(obj_enemydeath_explosion)))
        {
            flag = 1
            catmood_update(2, 60)
            music_duck(0, 0)
            if (get_room_state() == 2)
            {
                if (!override_enemy_destroy)
                    set_room_state(3)
            }
            else if (!override_enemy_destroy)
                set_room_state(1)
            else
                set_room_state(4)
        }
    }
}
