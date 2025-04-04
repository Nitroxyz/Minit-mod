gary_pathfind()
stun_state = 652
sprite_index = spr_gary_shoot_down
image_speed = 0.3
if place_meeting(x, (y + 1), obj_wall)
    grounded = 1
else
    vspd += grav
j_hor = sign(target_x - x)
hspd = approach(hspd, (j_hor * 2), 0.1)
if (hspd != 0)
    image_xscale = sign(hspd)
if (spin_particle_timer > 0)
    spin_particle_timer--
else
{
    spin_particle_timer = 5
    var bul = instance_create(x, (y + 8), obj_gary_bullet)
    bul.dir = 270
    vspd += ((-grav) * 6)
    shootdowns_fired++
    if (shootdowns_fired == max_shootdowns)
    {
        pursuit_state = 657
        state = pursuit_state
        mode_timer = mode_timer_max * 0.5
        next_special = 659
        shootdowns_fired = 0
    }
}
gary_collisions()
animate_actor()
