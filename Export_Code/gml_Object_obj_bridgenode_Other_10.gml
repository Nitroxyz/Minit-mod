if master
{
    if instance_exists(obj_player)
    {
        if (obj_player.vspd < 0)
        {
            with (obj_bridgenode)
            {
                if (!passthru)
                {
                    passthru = 1
                    instance_deactivate_object(wall)
                }
            }
        }
        else if obj_player.grounded
        {
            with (obj_bridgenode)
            {
                if place_meeting(obj_player.x, (y - 1), obj_player)
                {
                    if obj_player.key_down
                        jumpthru = 1
                    yoff = yoffmax - (min(yoffmax, ((abs(x - obj_player.x)) / 16)))
                }
            }
        }
    }
}
if jumpthru
{
    if instance_exists(obj_player)
    {
        if ((obj_player.grounded && (!obj_player.key_down)) || wall.bbox_bottom < obj_player.bbox_top)
            jumpthru = 0
        else if (obj_player.vspd < -1)
        {
            with (obj_player)
            {
                if (position_meeting(bbox_left, (bbox_bottom + 8), obj_bridgenode) && position_meeting(bbox_right, (bbox_bottom + 8), obj_bridgenode))
                    vspd = -1
            }
        }
    }
}
if passthru
{
    if instance_exists(obj_player)
    {
        if ((!jumpthru) && obj_player.vspd >= 0 && (obj_player.bbox_top > wall.bbox_bottom || obj_player.bbox_bottom < wall.bbox_top))
        {
            passthru = 0
            instance_activate_object(wall)
        }
    }
}
if (yoff != 0)
    yoff = approach(yoff, 0, 0.2)
if (shake != 0)
{
    shake = wrap((shake + id), 0, shake_max)
    rot = random(abs(shake))
    rotx = (choose(2, -2)) * rot
    roty = (choose(2, -2)) * rot
}
if (shake_timer > 0)
    shake_timer--
else
{
    shake_timer = -1
    shake = 0
}
