grounded = 1
inactive = 0
while (!(place_meeting(x, (y + 1), obj_wall)))
    y++
image_speed = 0.25
hspd = 0
vspd = 0
collision_grid = mp_grid_create(0, 0, ((room_width div 8) + 1), ((room_height div 8) + 1), 8, 8)
path = path_add()
grav = 0.2
j_right = 0
j_left = 0
j_jump = 0
target_x = x
target_y = y
target_facing = 1
mp_grid_add_instances(collision_grid, obj_wall, 1)
has_reached_waypoint = 1
