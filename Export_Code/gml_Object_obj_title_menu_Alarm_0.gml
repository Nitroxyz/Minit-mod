switch state
{
    case 1.5:
        state = 2
        cur_index = 0
        shake_screen(10)
        break
    case 3:
        if (roomto == r_cutscene)
            room_goto(roomto)
        if init_file
            init_savefile()
        else
            load_savefile()
        break
    case 4:
        scr_flash(0.34, 6)
        break
}

