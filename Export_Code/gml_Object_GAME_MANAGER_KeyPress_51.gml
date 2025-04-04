if (!debug_commands)
    return;
if get_bitwise_flag(global.abilities, 1)
{
    if (global.rocket_cost < 0.5)
    {
        global.abilities = set_bitwise_flag(global.abilities, 1, 0)
        global.rocket_cost = 0.6
        UI_MANAGER.ui_is_initialized = 0
    }
    else
    {
        global.rocket_cost = 0.4
        UI_MANAGER.ui_is_initialized = 0
    }
}
else
    global.abilities = set_bitwise_flag(global.abilities, 1, 1)
