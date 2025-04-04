master = 0
if (instance_number(obj_bridgenode) == 1)
    master = 1
jumpthru = 0
passthru = 0
yoff = 0
yoffmax = 2
wall = instance_create(x, y, obj_wall)
wall.visible = false
instance_deactivate_object(wall)
shake = 0
shake_hold = 0
shake_timer = 0
shake_max = 10
depth = 5
rot = 0
rotx = rot
roty = rot
