if new_game
{
    room_goto(r_cutscene)
    init_savefile()
}
else
    load_savefile()
