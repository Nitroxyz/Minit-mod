if (!debug_commands)
    return;
if (global.max_hp < 16)
    global.max_hp++
else
    global.max_hp = 1
global.cur_hp = global.max_hp
