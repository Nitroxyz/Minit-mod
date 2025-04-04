event_inherited()
if instance_exists(obj_player)
    hspd = (random_range(0.5, 1)) * obj_player.image_xscale
else
    hspd = random_range(-1, 1)
