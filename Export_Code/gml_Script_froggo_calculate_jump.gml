if instance_exists(obj_player)
{
    if (abs(obj_player.x - x) < 144)
    {
        var dirtemp = sign(obj_player.x - x)
        var magxtemp = choose(32, 48, 64)
        var magytemp = 0
    }
    else
    {
        dirtemp = choose(1, -1)
        magxtemp = choose(32, 48, 64)
        magytemp = 0
    }
}
else
{
    dirtemp = choose(1, -1)
    magxtemp = choose(32, 48, 64)
    magytemp = 0
}
if place_meeting((x + dirtemp * magxtemp), y, obj_wall)
{
    magytemp = 3
    if (!(place_meeting((x + dirtemp * magxtemp), (y - magytemp), obj_wall)))
        froggo_jump(dirtemp, (-magytemp))
    else
        jump_timer = 3
}
else if place_meeting((x + dirtemp * magxtemp), y, obj_enemy)
{
    if (magxtemp == 72 || magxtemp == 48)
        magxtemp = 24
    else if (magxtemp == 24)
        magxtemp = 48
    if place_meeting((x + dirtemp * magxtemp), y, obj_wall)
    {
        magytemp = 4
        if (!(place_meeting((x + dirtemp * magxtemp), (y - magytemp), obj_wall)))
            froggo_jump(dirtemp, (-magytemp))
        else
            jump_timer = 30
    }
    else
    {
        magytemp = 3
        froggo_jump(dirtemp, (-magytemp))
    }
}
else
{
    magytemp = 3
    froggo_jump(dirtemp, (-magytemp))
}
