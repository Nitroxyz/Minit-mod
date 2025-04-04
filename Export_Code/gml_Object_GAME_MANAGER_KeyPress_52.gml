if (!debug_commands)
    return;
global.abilities = set_bitwise_flag(global.abilities, 2, (!(get_bitwise_flag(global.abilities, 2))))
ability_update()
show_debug_message(string(window_get_width()) + string("/") + string(window_get_height()))
