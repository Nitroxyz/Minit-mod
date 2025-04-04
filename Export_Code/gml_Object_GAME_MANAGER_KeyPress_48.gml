if (!debug_commands)
    return;
palette_index++
if (palette_index == palette_entries)
    palette_index = 0
while (global.palette_unlocked[palette_index] == 0)
{
    palette_index++
    if (palette_index == palette_entries)
        palette_index = 0
}
