gary_pathfind()
stun_state = 652
if (x < next_x)
    j_hor = 1
else if (x > next_x)
    j_hor = -1
if (burst_timer == 0)
{
    if (shots < (max_shots - 1))
    {
        if (shoot_timer > 0)
            shoot_timer--
        else
        {
            var bullet = instance_create(x, (y + 3), obj_gary_bullet)
            bullet.dir = point_direction(0, 0, image_xscale, 0)
            var flash = instance_create((x + 17 * image_xscale), (y + 3), obj_gary_muzzle)
            flash.image_xscale = image_xscale
            shoot_timer = shoot_timer_max
            shots++
            hspd = (-image_xscale) * 2
        }
    }
    else
    {
        shots = 0
        burst_timer = burst_timer_max
    }
}
else
    burst_timer--
if (!grounded)
{
    if place_meeting(x, (y + 1), obj_wall)
    {
        grounded = 1
        vspd = 0
    }
}
else if (!(place_meeting(x, (y + 1), obj_wall)))
    grounded = 0
if grounded
{
    if (y > (target_y + 38))
        vspd = (-jump_height)
    if (point_distance(x, y, target_x, y) < 80)
    {
        if (y > (target_y + 28))
            vspd = (-jump_height) - 1
        else
            hspd = approach(hspd, 0, acc)
    }
    else
        hspd = approach(hspd, (j_hor * walk_spd), acc)
    image_xscale = sign(target_x - x)
    if (hspd != 0)
    {
        sprite_index = spr_gary_run
        image_speed = 0.2 * abs(hspd)
    }
    else
    {
        sprite_index = spr_gary_idle
        image_speed = 0.25
    }
}
else
{
    sprite_index = spr_gary_jump
    image_speed = 0
    hspd = approach(hspd, j_hor, acc)
    vspd += grav
    if (vspd < -0.6)
        iindex = 0
    else if (vspd < 0.6)
        iindex = 1
    else
        iindex = 2
}
gary_collisions()
animate_actor()
if (mode_timer > 0)
    mode_timer--
else
{
    mode_timer = mode_timer_max
    has_thrown = 0
    pursuit_state = 657
    state = 657
}
if (state == 656 && burst_timer && burst_timer < 16)
{
    hspd = approach(hspd, 0, (acc * 2))
    if (sprite_index == spr_gary_run)
    {
        sprite_index = spr_gary_gun_prep
        iindex = 0
    }
    else if (sprite_index == spr_gary_idle)
    {
        sprite_index = spr_gary_gun_prep
        iindex = 0
    }
}
