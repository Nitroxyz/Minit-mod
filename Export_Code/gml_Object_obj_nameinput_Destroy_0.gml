if backtotitle
    obj_title_menu.state = 5
else
{
    obj_title_menu.state = 3
    obj_title_menu.alarm[0] = 30
    ini_open(global.save_cur)
    ini_write_string("save", "name", global.name)
    ini_close()
}
