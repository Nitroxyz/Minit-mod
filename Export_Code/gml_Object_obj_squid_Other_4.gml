if place_meeting(x, y, obj_lab_tube)
{
    tube_container = instance_place(x, y, obj_lab_tube)
    state = 343
    init_state = state
    move_dir = 90
    draw_dir = 90
    image_angle = 90
    sprite_index = spr_squid_tubefloat
    image_speed = 0.1
    var tube = instance_place(x, y, obj_lab_tube)
    x = tube.x + 8
    y = tube.y + 32
    float_y = y
}
else if (!(place_meeting(x, y, WATER)))
{
    init_state = 346
    image_speed = 0.05
    move_dir = 90
    draw_dir = 90
}
else
{
    move_dir = (image_angle div 90) * 90
    draw_dir = (move_dir div 45) * 45
}
