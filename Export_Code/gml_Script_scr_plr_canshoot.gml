shoot_direction()
if (key_shoot2 || (key_shoot2held && repeater))
{
    shoot_state = 85
    alarm[1] = 7
    var ldx = lengthdir_x(12, shootdir)
    var ldy = lengthdir_y(16, shootdir)
    var bullet = instance_create((x + ldx + image_xscale * 5), (y + 1 + ldy), bullet_object)
    with (bullet)
    {
        bulletdir = ""
        image_angle = other.shootdir
        direction = other.shootdir
        catmood_update(4, 30)
        if (other.shootdir == 0 || other.shootdir == 180)
            target_spd += abs(other.hspd)
        else if place_meeting(x, y, obj_wall)
        {
            if (!(place_meeting((x - 4), y, obj_wall)))
            {
                while place_meeting(x, y, obj_wall)
                    x--
            }
            else if (!(place_meeting((x + 4), y, obj_wall)))
            {
                while place_meeting(x, y, obj_wall)
                    x++
            }
        }
    }
    if instance_exists(obj_gun)
    {
        obj_gun.image_speed = 0.5
        obj_gun.iindex = 0
    }
    var muzzle = instance_create((x + ldx + image_xscale * 5), (y + 2 + ldy), muzzle_obj)
    muzzle.image_angle = shootdir
}
else if key_shoot3
{
    if (global.rocket_heat < 1 && global.rocket_is_ready && get_bitwise_flag(global.abilities, 1))
    {
        shoot_state = 85
        rocket_has_pulsed = 0
        alarm[1] = 10
        global.rocket_heat += global.rocket_cost
        global.rocket_heat = clamp(global.rocket_heat, 0, 1)
        global.rocket_cooldown_wait = 60
        if (global.rocket_heat == 1)
        {
            audio_play_sound(snd_hud_overheat, 10, false)
            global.rocket_is_ready = 0
        }
        audio_play_sound(snd_rocket, 1, false)
        audio_sound_pitch(snd_rocket, random_range(0.5, 1))
        var rocketobj = obj_rocket_new
        var recoil_old = recoil
        if (abs(x - obj_camera.xmin) < 16 || abs(x - (obj_camera.xmax + 304)) < 16)
            recoil = 0
        switch shootdir
        {
            case 0:
                var rocket = instance_create((x + 16), (y + (random_range(-1, 2))), rocketobj)
                with (rocket)
                {
                    rocketdir = "right"
                    image_angle = 0
                    hspd = 0
                }
                hspd -= (recoil * 3)
                muzzle = instance_create(x, (y + 2), obj_muzzle_rocket)
                with (muzzle)
                {
                    muzdir = "right"
                    image_angle = 0
                    offset_x = 16
                    offset_y = 1
                }
                break
            case 180:
                rocket = instance_create((x - 16), (y + (random_range(-1, 2))), rocketobj)
                with (rocket)
                {
                    rocketdir = "left"
                    image_angle = 180
                    hspd = 0
                }
                hspd += (recoil * 3)
                muzzle = instance_create(x, (y + 1), obj_muzzle_rocket)
                with (muzzle)
                {
                    muzdir = "left"
                    image_angle = 180
                    offset_x = -16
                    offset_y = 1
                }
                break
            case 90:
                vspd += (recoil * 3)
                if (facing == 1)
                {
                    rocket = instance_create((x + (random_range(1, 2))), (y - 18), rocketobj)
                    with (rocket)
                    {
                        rocketdir = "up"
                        image_angle = 90
                        vspd = 0
                    }
                    muzzle = instance_create((x + 6), (y - 4), obj_muzzle_rocket)
                    with (muzzle)
                    {
                        image_angle = 90
                        offset_x = 4
                        offset_y = -11
                        muzdir = "upR"
                    }
                }
                else
                {
                    rocket = instance_create((x - (random_range(1, 2))), (y - 18), rocketobj)
                    with (rocket)
                    {
                        rocketdir = "up"
                        image_angle = 90
                        vspd = 0
                    }
                    muzzle = instance_create((x - 6), (y - 4), obj_muzzle_rocket)
                    with (muzzle)
                    {
                        image_angle = 90
                        offset_x = -2
                        offset_y = -11
                        muzdir = "upL"
                    }
                }
                break
            case 270:
                if (!grounded)
                    vspd = min((vspd - recoil), -2)
                if (facing == 1)
                {
                    rocket = instance_create((x + 1), (y + 13), rocketobj)
                    with (rocket)
                    {
                        rocketdir = "down"
                        image_angle = 270
                        vspd = 2
                    }
                    muzzle = instance_create((x + 3), y, obj_muzzle_rocket)
                    with (muzzle)
                    {
                        image_angle = 270
                        muzdir = "downR"
                        offset_x = 2
                        offset_y = 13
                    }
                }
                else
                {
                    rocket = instance_create((x - 1), (y + 13), rocketobj)
                    with (rocket)
                    {
                        rocketdir = "down"
                        image_angle = 270
                        vspd = 2
                    }
                    muzzle = instance_create((x - 3), y, obj_muzzle_rocket)
                    with (muzzle)
                    {
                        image_angle = 270
                        muzdir = "downL"
                        offset_x = -5
                        offset_y = 13
                    }
                }
                break
        }

        if instance_exists(obj_gun)
        {
            obj_gun.image_speed = 0.5
            obj_gun.iindex = 0
        }
        recoil = recoil_old
    }
    else
    {
        audio_play_sound(RocketEmpty, 100, false)
        switch shootdir
        {
            case 0:
                var puff = instance_create((x + 16), (y + 2 + (random_range(-1, 1))), obj_dust_particle_gunempty)
                break
            case 180:
                puff = instance_create((x - 16), (y + 2 + (random_range(-1, 1))), obj_dust_particle_gunempty)
                puff.hspd *= -1
                break
            case 90:
                if (facing == 1)
                    puff = instance_create((x + (random_range(-1, 1)) + 5), (y - 14), obj_dust_particle_gunempty)
                else
                    puff = instance_create((x + (random_range(-1, 1)) - 5), (y - 14), obj_dust_particle_gunempty)
                puff.hspd *= (0.25 * (choose(-1, 1)))
                puff.vspd -= (0.5 * (choose(-1, 1)))
                break
            case 270:
                if (facing == 1)
                    puff = instance_create((x + (random_range(-1, 1)) + 5), (y + 14), obj_dust_particle_gunempty)
                else
                    puff = instance_create((x + (random_range(-1, 1)) - 5), (y + 14), obj_dust_particle_gunempty)
                puff.hspd *= (0.25 * (choose(-1, 1)))
                puff.vspd += (0.5 * (choose(-1, 1)))
                break
        }

    }
}
else
{
    if (rocketstam < (60 * a_rocket_count))
        rocketstam++
    if ((rocketstam % 60) == 0 && rocketstam != 0)
    {
        if (!rocket_has_pulsed)
        {
            rocket_has_pulsed = 1
            rocketpulse = 2
        }
    }
    else
        rocket_has_pulsed = 0
}
rocketpulse = approach(rocketpulse, 0, 0.1)
