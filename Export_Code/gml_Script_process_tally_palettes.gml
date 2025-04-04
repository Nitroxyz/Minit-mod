var pals = 0
for (var iii = 0; iii < 16; iii++)
{
    if (global.palette_unlocked[iii] != 0)
        pals++
}
return (pals - 2);
