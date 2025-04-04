if (!debug_commands)
    return;
if get_bitwise_flag(global.gunEquip, 8)
    global.gunEquip = set_bitwise_flag(global.gunEquip, 8, 0)
else
    global.gunEquip = set_bitwise_flag(global.gunEquip, 8, 1)
ability_update()
