garypod_enginesound_mod()
if (hspd != 0)
{
    hspd = approach(hspd, (3 * sign(hspd)), 0.1)
    if (!(place_meeting((x + hspd + sign(hspd) * 16), y, obj_wall)))
        x += hspd
    else
    {
        hspd *= -0.5
        shake_screen(20)
    }
    machine.x = x
    pod.x = x
}
if (hp_last != hp)
{
    hp_lost_this_state += (hp_last - hp)
    hp_last = hp
}
if (shoot_timer > 0)
{
    if (shoot_timer <= 400)
    {
        machine.iindex = wrap((machine.iindex + 1), 0, 10)
        if (machine.iindex == 1)
        {
            var bul = instance_create(x, (y + 60), obj_guardian_bullet)
            bul.vspd = 2
        }
    }
    else
        machine.iindex = 0
    shoot_timer--
}
else
{
    machine.sprite_index = spr_transform_machine
    machine.iindex = sprite_get_number(sprite_index) - 0.1
    machine.image_speed = 0
    state = 673
    vspd = y - yprevious
    hspd = abs(hspd * 0.5)
    hp_last = hp
    hp_lost_this_state = 0
}
