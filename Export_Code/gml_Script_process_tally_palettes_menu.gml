var pals = 0
for (var iii = 0; iii < 16; iii++)
{
    if (ds_map_find_value(argument0, ("palette" + string(iii))) != 0)
        pals++
}
return (pals - 2);
