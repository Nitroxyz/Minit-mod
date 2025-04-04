if (state == 418)
{
    turretc_off = 2
    var temp = instance_create(x, (y + 16 + turretc_off), obj_bubble)
    temp.vspd = 1
    temp.hspd = 0
    temp.depth = depth - 1
    alarm[2] = 4
    var gren = instance_create((x - 12), (y + 16 + turretc_off), obj_boss1_rail_bullet)
    gren.vspd = 0
    alarm[1] = irandom_range(71, 80)
    var t0 = audio_play_sound(RailGunShoot, 100, false)
    audio_sound_pitch(t0, random_range(0.9, 1.6))
    body_offset = 2
    head.image_index = 1
}
