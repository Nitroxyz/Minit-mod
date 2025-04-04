if (!global.rumble)
    rumble_mag = 0
if reposition
{
    if (x != repo_xtarget)
        x = approach(x, repo_xtarget, 9.5)
    else if (y != repo_ytarget)
        y = approach(y, repo_ytarget, 6)
    else
        reposition = 0
    __view_set(0, 0, x)
    __view_set(1, 0, y)
}
else if active
{
    if center
    {
        if (!((xmin == -2 && xmax == -2)))
        {
            if instance_exists(obj_player)
            {
                x = approach(x, cameralogic_horizontal(x, __view_get(2, 0)), max(abs(obj_player.hspd), 4))
                x = clamp(x, xmin, xmax)
            }
        }
        else if (!((ymin == -2 && ymax == -2)))
        {
            if instance_exists(obj_player)
            {
                y = approach(y, cameralogic_vertical(y, __view_get(3, 0)), max(abs(obj_player.vspd), 4))
                y = clamp(y, ymin, ymax)
            }
        }
    }
    if (global.shake != 0)
    {
        __view_set(0, 0, (x + (choose(1, -1)) * (random(clamp((global.shake / 4), -3, 3)))))
        __view_set(1, 0, (y + (choose(1, -1)) * (random(clamp((global.shake / 4), -3, 3)))))
        gamepad_set_vibration(global.controller_slot, rumble_mag, rumble_mag)
    }
    else
    {
        gamepad_set_vibration(global.controller_slot, 0, 0)
        __view_set(0, 0, x)
        __view_set(1, 0, y)
    }
}
