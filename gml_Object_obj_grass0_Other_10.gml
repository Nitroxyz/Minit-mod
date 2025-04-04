animate_actor()
ang += angspd
if (xoffset != 0)
{
    xoffset -= (sign(xoffset) / 8)
    xoffset = lerp(xoffset, 0, 0.02)
    if (abs(xoffset) < 0.5)
        xoffset = 0
}
if (angspd > 0.032)
    angspd -= 0.0003
angspd = approach(angspd, 0.032, 0.0003)
if (alarm[0] == stuntimer)
{
    stun = 1
    xoffset += (hurt_hspd + abs(hurt_vspd) * alarm[0] * 0.4)
    angspd += 0.2
    if (hp <= 0)
        angspd += 0.1
    sprite_index = stun_sprite
}
else if (alarm[0] == 0)
{
    alarm[0] = -1
    stun = 0
    state = 2
    sprite_index = idle_sprite
}
else if (alarm[0] > 0)
{
}
if (hp <= 0)
{
    if (state != 315)
        enemy_event_die()
}
enemy_tick_stun_timer()
