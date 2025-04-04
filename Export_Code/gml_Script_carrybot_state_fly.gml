sprite_index = spr_carrybot_holding
image_speed = 0.2
hspd = approach(hspd, (flyspeed[hasObject] * image_xscale), 0.1)
vspd = (dsin(sin_timer * 4)) * 0.3
sin_timer++
animate_actor()
if (flying_audio == undefined)
    flying_audio = audio_play_sound(snd_drone_fly, 10, true)
else if (instance_exists(obj_player) && audio_is_playing(flying_audio))
{
    audio_sound_pitch(flying_audio, ((point_distance(0, 0, hspd, 0)) / flyspeed[0] + 0.3))
    audio_sound_gain(flying_audio, (0.6 - (point_distance(x, y, obj_player.x, obj_player.y)) / 300), 0)
}
if place_meeting((x + hspd), y, obj_wall)
{
    if place_meeting((x + 8 * sign(hspd)), y, obj_wall)
    {
        while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        hspd *= -1
        image_xscale *= -1
    }
    else if (hspd != 0)
        image_xscale = sign(hspd)
    while place_meeting(x, y, obj_wall)
        x += sign(hspd)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
else if (vspd < 0 && (y + vspd) < (obj_camera.y + 8))
{
    vspd *= -1
    sin_timer += 45
}
y += vspd
if hasObject
{
    if instance_exists(obj_player)
    {
        if (point_distance(x, 0, obj_player.x, 0) < trigger_distance)
        {
            iindex = 0
            state = 383
            audio_play_sound(snd_carrybot_release, 100, false)
            dropped_obj = instance_create(x, (y + 8), holdingObject)
            if (dropped_obj.object_index == obj_frog)
                dropped_obj.state = 322
            dropped_obj.image_xscale = image_xscale
            hasObject = 0
        }
    }
}
else if (regen_timer > 0)
    regen_timer--
else
{
    regen_timer = 10
    if (!instance_exists(dropped_obj))
    {
        state = 384
        iindex = 0
        image_speed = 0.1
    }
}
