gary_pathfind()
stun_state = 317
sprite_index = spr_gary_spin
image_speed = 0.3
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    state = pursuit_state
}
else
    vspd += grav
j_hor = sign(target_x - x)
hspd = approach(hspd, j_hor, 0.02)
if (hspd != 0)
    image_xscale = sign(hspd)
if (spin_particle_timer > 0)
    spin_particle_timer--
else
{
    spin_particle_timer = 2
    var _trail = instance_create(x, y, obj_spin_trail)
    _trail.image_xscale = image_xscale
}
gary_collisions()
animate_actor()
