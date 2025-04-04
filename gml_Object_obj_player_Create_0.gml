event_inherited()
vehicle = 0
show_debug_message("Cat Create: Happened!")
red = merge_color(c_red, c_white, 0.45)
blue = merge_color(c_blue, c_white, 0.45)
green = merge_color(c_green, c_white, 0.45)
key_shoot_pressed = 0
ability_update()
player_consts()
depth = -6
global.catmood = 0
max_hp = global.max_hp
global.cur_hp = max_hp
hp = max_hp
imgspd = 0.2
hspd = 0
vspd = 0
movespeed = 0.24
jumpspeed = 4.5
grav = 0.235
grounded = 0
in_water = 0
shooting = 0
shootdir = 0
facing = 1
sliptimer = 0
sprite_index = spr_player_C
recoil = 1
dj = 2
dpress = 0
dashing = 0
dash_return_state = 2
if (!instance_exists(obj_gun))
{
    instance_create(x, y, obj_gun)
    obj_gun.depth = depth - 1
}
else
{
    obj_gun.visible = true
    obj_gun.depth = depth - 1
}
step = 0
air = 0
landed = 0
dashcool = 0
rocketheat = 0
rocketstam = 16 * a_rocket_count
rocketstam_timer = 0
stun = 0
on_treadmill = 0
plat_id = -1
p_type = -1
p_x = -1
var savebig = 0
if instance_exists(obj_save_point)
{
    if (obj_save_point.object_index != obj_save_point_mini)
        savebig = 1
}
else if (global.vehicle != 0 && global.vehicle != 3)
    savebig = 1
var itemroom = instance_exists(obj_item_altar)
if (global.gary_defeated || (global.editor && global.editor_start_cat == 1) || global.hassuit == "no" || (MAP_MANAGER.map_current == "map4" && (!savebig)) || (MAP_MANAGER.map_current == "map2" && (!savebig)) || (itemroom && (!savebig)))
{
    player_cat_only()
    vehicle = 0
    old_image_speed = image_speed
    default_image_speed = 0.1
}
else
{
    hassuit = 1
    cat = 0
    vehicle = 1
    stopped = 0
    UI_entermech()
    old_image_speed = image_speed
    default_image_speed = 0.1
    shoot_state = 84
    old_shoot_state = shoot_state
    move_state = 65
    old_move_state = move_state
    control_state = 87
    collision_state = 58
}
particle_dust_land = 78
particle_dust_jump = 67
particle_dust_walk = 55
takes_water_damage = 0
effect_timer[0] = 0
rocketpulse = 0
rocket_has_pulsed = 0
last_step = 0
spin_particle_timer = 5
sub_shoot_timer = 0
sub_shoot_timer_max = 10
turret_shoot_direction = 0
turret_shoot_energy = 0
turret_shoot_energy_max = 30
spinhit = 0
