switch text_cur
{
    case 1:
        if keyboard_check_pressed(vk_return)
        {
            text_cur++
            text[text_cur] = "dumping"
            room_flag = 1
            write_dir = "CATROID " + string(current_month) + string(current_day) + string(current_year) + " Dump"
            if directory_exists(write_dir)
            {
                var i = 0
                write_dir = "CATROID " + string(current_month) + string(current_day) + string(current_year) + " Dump" + string(i)
                while directory_exists(write_dir)
                {
                    i++
                    write_dir = "CATROID " + string(current_month) + string(current_day) + string(current_year) + " Dump" + string(i)
                }
                directory_create(write_dir)
            }
            else
                directory_create(write_dir)
        }
        break
    case 2:
        if (room_flag == 1)
        {
            dump_room(room_id[room_cur])
            text[text_cur] = "dumping" + room_get_name(room_id[room_cur])
        }
        else
        {
            write_room(room)
            if ((array_length_1d(room_id) - 1) != room_cur)
            {
                room_cur++
                room_flag = 1
            }
            else
            {
                room_goto(r_room_dump)
                text_cur++
                text[text_cur] = "all rooms dumped"
                text[(text_cur + 1)] = "press escape to leave"
                alarm[0] = 30
            }
        }
        break
    case 3:
        break
    case 4:
        if keyboard_check_pressed(vk_escape)
            game_end()
        break
}

