event_inherited()
creating = 0
pause_creation = 0
override_carryobj = -1
image_speed = 0.2
create_timer = (abs(60 - instance_number(obj_carrybot_fan) * 30)) + 60
y_target = y - (instance_number(obj_carrybot_fan) - 1) * 16
y_move_amt = (y_target - y) / 25
playedsound = 0
