if (!debug_commands)
    return;
if (global.controller_type == 0)
    global.controller_type = 4
else if (global.controller_type == 4)
    global.controller_type = 2
else if (global.controller_type == 2)
    global.controller_type = 1
else if (global.controller_type == 1)
    global.controller_type = 0
