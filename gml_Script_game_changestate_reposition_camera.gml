with (GAME_MANAGER)
    state = 18
with (obj_camera)
{
    var pp_x = clamp(((floor((obj_player.x + 2) / 304)) * 304), xmin, xmax)
    var pp_y = clamp(((floor((obj_player.y + 2) / 192)) * 192), ymin, ymax)
    reposition = 1
    if (xmin != xmax)
        repo_xtarget = pp_x
    else
        repo_xtarget = -2
    if (ymin != ymax)
        repo_ytarget = pp_y
    else
        repo_ytarget = -2
}
return;
