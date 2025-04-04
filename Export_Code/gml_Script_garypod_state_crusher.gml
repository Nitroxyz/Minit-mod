garypod_enginesound_mod()
if ((!crusher.active) && crusher.dir == 1)
{
    angle += (2 * angle_speed)
    var t_x = x
    if instance_exists(obj_player)
        t_x = obj_player.x
    x = x_hover + 110 * (sin(angle / 6))
    if (crusher.detach_timer < 2)
    {
        if (abs(t_x - x) < 12)
        {
            y = (round(y / 8)) * 8
            angle -= (2 * angle_speed)
        }
        else
            crusher.detach_timer++
    }
    else
        crusher.blocker.y = -1000
    crusher.x = x - 8
    crusher.y = y + 56
    crusher.ytether = crusher.y
    pod.x = x
    pod.y = y + 20
    y_hover = approach(y_hover, 60, 0.25)
    if (shoot_timer > 0)
        shoot_timer--
    else
    {
        crusher.visible = false
        instance_deactivate_object(crusher.blocker)
        state = 672
        audio_play_sound(snd_guardian_transform_machinegun, 100, false)
        machine.visible = true
        machine.x = x
        machine.y = y + 49
        vspd = y - yprevious
        hspd = x - xprevious
        obj_boss_gary_pod.mask_index = spr_gary_pod_empty
    }
}
