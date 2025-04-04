event_inherited()
hp = 160
hp_max = hp
hp_last = hp
death_event = 667
stun_state = 312
stun_sprite = 633
hitsound = 389
visible = false
stuntimer = 5
state = 2
init_state = 2
crusher = instance_create(x, y, obj_smasher)
crusher.depth = 10
crusher.visible = false
crusher.cooldown_timer = 5
crusher.cooldown_timer_max = 5
crusher.activation_timer = 30
crusher.activation_timer_max = 30
instance_deactivate_object(crusher.blocker)
pod = instance_create(x, (y + 8), obj_boss_gary_pod)
pod.gary = id
pod.depth = 7
depth = 8
with (pod)
{
    while place_meeting(x, y, obj_wall)
        y--
}
machine = instance_create(x, y, obj_pod_machine)
angle = 0
angle_speed = 0.12566370614359174
y_hover = 0
hp_lost_this_state = 0
muzzle_l = -1
muzzle_r = -1
shoot_timer = 150
shoot_timer_max = 150
