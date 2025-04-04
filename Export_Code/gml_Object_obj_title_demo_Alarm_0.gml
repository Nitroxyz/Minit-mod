room_goto(roomto)
if (global.save_cur == "save0.ini")
{
    init_savefile()
    load_savefile()
}
else
{
    load_savefile()
    global.save_cur = "save0.ini"
    global.save_preset = 1
}
