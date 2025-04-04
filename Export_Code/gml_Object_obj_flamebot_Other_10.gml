if (!(is_within_view(x, y, 0, 16)))
    return;
grounded = place_meeting(x, (y + 1), obj_wall)
script_execute(state)
