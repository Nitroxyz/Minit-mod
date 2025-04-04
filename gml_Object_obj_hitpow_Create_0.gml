image_speed = 0.5
timer = 8
iindex = 0
image_xscale = choose(1, -1)
image_angle = choose(0, 90, 180, 270)
if instance_exists(obj_player)
    depth = obj_player.depth - 1
