if (!debug_commands)
    return;
if (!(get_bitwise_flag(global.abilities, 4)))
    global.abilities = set_bitwise_flag(global.abilities, 4, 1)
else if (!(get_bitwise_flag(global.abilities, 16)))
    global.abilities = set_bitwise_flag(global.abilities, 16, 1)
else
{
    global.abilities = set_bitwise_flag(global.abilities, 16, 0)
    global.abilities = set_bitwise_flag(global.abilities, 4, 0)
}
ability_update()
