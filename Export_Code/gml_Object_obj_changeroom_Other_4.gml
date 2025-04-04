if (__view_get(0, 0) < -4)
    x = -304
else if (__view_get(0, 0) > 0)
    x = 304
if (__view_get(1, 0) > 0)
    y = 192
else if (__view_get(1, 0) < -4)
    y = -192
__view_set(0, 0, (x - 2))
__view_set(1, 0, (y - 2))
if instance_exists(obj_player)
{
    GAME_MANAGER.state = 2
    player_auto()
    scr_pause_enemies()
    obj_player.x += x
    obj_player.y += y
    if instance_exists(obj_rocketboom)
    {
        with (obj_rocketboom)
        {
            x += other.x
            y += other.y
        }
    }
    if instance_exists(obj_door_auto_U)
        scr_hide_enemies()
}
depth = 100
