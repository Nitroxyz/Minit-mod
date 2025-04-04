if (!debug_commands)
    return;
var t_index = palette_index + 1
if (t_index == palette_entries)
    t_index = 0
var t_index_o = t_index
while (global.palette_unlocked[t_index] == 1)
{
    t_index++
    if (t_index == palette_entries)
        t_index = 0
    if (t_index == t_index_o)
        break
    else
        continue
}
global.palette_unlocked[t_index] = 1
