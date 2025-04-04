spin_angle += spin_speed
spin_angle = wrap(spin_angle, 0, 360)
spin_angle = round(spin_angle)
spin_speed = approach(spin_speed, (20 * image_xscale), 0.25)
if instance_exists(obj_player)
    image_xscale = sign(obj_player.x - x)
if instance_exists(obj_player)
    hover_x = lerp(hover_x, obj_player.x, 0.3)
hover_angle += hover_spd
hspd = approach(hspd, sign(hover_x - x), 0.1)
if (!(place_meeting((x + sign(hspd) * 16), y, obj_wall)))
    x += hspd
else
{
    var t = instance_place((x + sign(hspd) * 16), y, obj_wall)
    with (t)
    {
        if place_meeting(x, y, obj_bridgenode)
            other.x += other.hspd
        else
        {
            other.hspd *= -1
            audio_play_sound(snd_ventboss_bounce, 100, false)
            shake_screen(10)
        }
    }
}
vspd = approach(vspd, sign(ystart + 16 - y), 0.1)
if (!(place_meeting(x, (y + sign(vspd) * 16), obj_wall)))
    y += vspd
else
{
    t = instance_place(x, (y + sign(vspd) * 16), obj_wall)
    with (t)
    {
        if place_meeting(x, y, obj_bridgenode)
            other.y += other.vspd
        else
        {
            other.vspd *= -1
            audio_play_sound(snd_ventboss_bounce, 100, false)
            shake_screen(10)
        }
    }
}
if (stopped_timer > 0)
{
    stopped_timer -= 0.5
    if ((stopped_timer % 8) == 0)
    {
        bullet_hell_angle = choose(random_range(240, 300), (270 + sin(stopped_timer) * 30))
        var bul = instance_create((x + (lengthdir_x(16, bullet_hell_angle))), (y + (lengthdir_y(16, bullet_hell_angle))), obj_boss_vent_bullet)
        bul.dir = bullet_hell_angle
    }
}
else
{
    stopped_timer = stopped_timer_max
    state = 621
    spin_speed = 30 * image_xscale
    chosen_stop_angle = choose(360, 90, 180, 270)
}
var shieldcount = 0
for (var i = 0; i < 4; i++)
{
    var d = 90 * i + spin_angle
    if instance_exists(shields[i])
    {
        shieldcount++
        shields[i].image_angle = d
        shields[i].x = x
        shields[i].y = y
    }
}
if (shieldcount > 0)
{
    if audio_is_playing(snd_ventboss_spin_state)
    {
        audio_sound_pitch(snd_ventboss_spin_state, (spin_speed / 60 + 0.5))
        audio_sound_gain(snd_ventboss_spin_state, (spin_speed / 40), 1)
    }
    else
        audio_play_sound(snd_ventboss_spin_state, 100, true)
}
else if audio_is_playing(snd_ventboss_spin_state)
    audio_stop_sound(snd_ventboss_spin_state)
