if (!debug_commands)
    return;
if (global.cur_hp > 0)
    global.cur_hp--
else
    global.cur_hp = global.max_hp
global.cur_hp = clamp(global.cur_hp, 0, global.max_hp)
