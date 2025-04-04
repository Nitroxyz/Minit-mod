if ((instance_number(obj_enemy) - instance_number(eny_null)) <= 0)
{
    if instance_exists(obj_player)
    {
        if (obj_player.grounded || obj_player.vehicle == 2 || (!instance_exists(obj_enemydeath_explosion)))
        {
            flag = 1
            catmood_update(2, 60)
            if minit_music_inactive()
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
