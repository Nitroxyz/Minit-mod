event_inherited()
if (!visible)
    return;
if active
{
    if (!audio_is_playing(snd_crusher_move))
        audio_play_sound(snd_crusher_move, 100, false)
    vspd = approach(vspd, (dir * vspd_max), 1)
    y += vspd
    if (dir == 1)
    {
        if place_meeting(x, y, obj_wall)
        {
            if place_meeting(x, y, obj_wall2)
            {
                while place_meeting(x, y, obj_wall2)
                {
                    with (instance_place(x, y, obj_wall2))
                        instance_destroy()
                }
                shake_screen(20)
            }
            else
            {
                audio_play_sound(snd_crusher_crush, 100, false)
                vspd = 0
                instance_deactivate_object(collider)
                collider_active = 0
                while place_meeting(x, y, obj_wall)
                    y--
                active = 0
                dir = -1
                shake_screen(20)
            }
        }
        else if place_meeting(x, (y + 20), obj_wall)
        {
            instance_activate_object(collider)
            collider.x = x
            collider_active = 1
        }
        if collider_active
            collider.y = y
        if place_meeting(x, y, obj_player)
        {
            if (obj_player.y > y)
            {
                with (obj_player)
                {
                    while place_meeting(x, y, other.id)
                    {
                        if (!(place_meeting(x, (y + 1), obj_wall)))
                        {
                            y++
                            continue
                        }
                        else
                            break
                    }
                }
            }
        }
    }
    else if (y < ytether)
    {
        vspd = 0
        y = ytether
        active = 0
        dir = 1
    }
    blocker.y = ytether - 16 + (y - ytether) / 2
    blocker.image_yscale = 1 + (blocker.y - blocker.ytether) / 8
    with (obj_player)
    {
        if place_meeting(x, y, other.blocker)
        {
            if (x == other.blocker.x)
                x--
            while place_meeting(x, y, other.blocker)
                x -= sign(other.blocker.x - x)
        }
    }
}
else
{
    if place_meeting(x, y, obj_player)
    {
        if (obj_player.x < (x + 8))
        {
            with (obj_player)
            {
                while place_meeting(x, y, other.id)
                {
                    if (!(place_meeting((x - 1), y, obj_wall)))
                    {
                        x--
                        continue
                    }
                    else
                        break
                }
            }
        }
        else
        {
            with (obj_player)
            {
                while place_meeting(x, y, other.id)
                {
                    if (!(place_meeting((x + 1), y, obj_wall)))
                    {
                        x++
                        continue
                    }
                    else
                        break
                }
            }
        }
    }
    if (dir == 1)
    {
        if (activation_timer > 0)
            activation_timer--
        else if (detach_timer > 0)
        {
            if (detach_timer == detach_timer_max)
            {
                audio_play_sound(snd_crusher_detach, 100, false)
                y += 4
            }
            y = approach(y, (ytether + 2), 0.2)
            detach_timer--
        }
        else
        {
            instance_activate_object(blocker)
            blocker.ytether = ytether - 16
            blocker.x = x + 8
            blocker.y = blocker.ytether
            detach_timer = detach_timer_max
            active = 1
            activation_timer = activation_timer_max
        }
    }
    else if (cooldown_timer > 0)
        cooldown_timer--
    else
    {
        active = 1
        cooldown_timer = cooldown_timer_max
    }
}
