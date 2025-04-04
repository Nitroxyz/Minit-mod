hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)
spd = approach(spd, target_spd, accel)
if place_meeting(x, y, obj_wall)
{
    var wall = instance_place(x, y, obj_wall)
    audio_play_sound(wall.hitsound, 1, false)
    audio_sound_pitch(wall.hitsound, random_range(0.9, 1.3))
    instance_destroy()
    instance_create(x, y, obj_bulimp)
}
x += hspd
y += vspd
animate_actor()
