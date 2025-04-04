if (!debug_commands)
    return;
if get_bitwise_flag(global.gunEquip, 1)
    global.gunEquip = set_bitwise_flag(global.gunEquip, 1, 0)
else
    global.gunEquip = set_bitwise_flag(global.gunEquip, 1, 1)
ability_update()
