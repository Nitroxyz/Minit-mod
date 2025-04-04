garypod_enginesound_mod()
with (obj_boss_gary_pod)
{
    if (sprite_index == spr_gary_pod_transform_buzz)
    {
        if (floor(iindex) == 0)
        {
            image_speed *= -1
            sprite_index = spr_gary_pod_idle
        }
    }
    else
    {
        gary.hspd = approach(gary.hspd, 2, 0.05)
        x = approach(x, gary.x_hover, gary.hspd)
        gary.x = x
        if (gary.vspd < 1 && ((10 * gary.vspd) % 1) == 0)
            instance_create((x - 24 + irandom(48)), (y + 24), obj_steam_cloud)
        gary.vspd = approach(gary.vspd, 3, 0.05)
        y = approach(y, (gary.y_hover + 20), gary.vspd)
        gary.y = y - 20
        if (gary.x == gary.x_hover && gary.y == gary.y_hover)
        {
            gary.angle = choose(0, 18.84955592153876)
            if (gary.hp < (gary.hp_max / 1.5))
            {
                if (irandom(1) == 0)
                {
                    gary.shoot_timer = gary.shoot_timer_max * 3
                    gary.state = 664
                    gary.crusher.visible = true
                    gary.crusher.active = 0
                    gary.crusher.activation_timer = gary.crusher.activation_timer_max
                    gary.crusher.cooldown_timer = gary.crusher.cooldown_timer_max
                    gary.crusher.detach_timer = gary.crusher.detach_timer_max
                    gary.crusher.x = gary.x - 8
                    gary.crusher.y = gary.y + 56
                    gary.crusher.ytether = gary.crusher.y
                }
                else
                {
                    hspd = 0.1
                    other.machine.visible = true
                    gary.state = 672
                }
            }
            else
                gary.state = 663
            gary.hp_lost_this_state = 0
        }
    }
}
