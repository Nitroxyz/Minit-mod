if ((!(position_meeting((x - 16), y, obj_bridgenode))) || (!(position_meeting((x + 16), y, obj_bridgenode))))
    yoffmax = 0
else if ((!(position_meeting((x - 32), y, obj_bridgenode))) || (!(position_meeting((x + 32), y, obj_bridgenode))))
    yoffmax = 1
instance_activate_object(wall)
