if steam_initialised()
{
    if steam_stats_ready()
    {
        if (!steam_get_achievement(argument0))
            steam_set_achievement(argument0)
    }
}
