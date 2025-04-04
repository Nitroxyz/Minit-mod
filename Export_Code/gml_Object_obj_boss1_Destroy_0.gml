with (head)
{
    ant.visible = false
    visible = false
}
if instance_exists(arm_l)
{
    instance_activate_object(arm_l)
    if instance_exists(arm_l.claw)
        instance_activate_object(arm_l.claw)
    with (arm_l)
        instance_destroy()
}
if instance_exists(arm_r)
{
    instance_activate_object(arm_r)
    if instance_exists(arm_r.claw)
        instance_activate_object(arm_r.claw)
    with (arm_r)
        instance_destroy()
}
if instance_exists(leg_l)
{
    instance_activate_object(leg_l)
    if instance_exists(leg_l.foot)
        instance_activate_object(leg_l.foot)
    with (leg_l)
        instance_destroy()
}
if instance_exists(leg_r)
{
    instance_activate_object(leg_r)
    if instance_exists(leg_r.foot)
        instance_activate_object(leg_r.foot)
    with (leg_r)
        instance_destroy()
}
if audio_is_playing(RailBossRailmovement)
    audio_stop_sound(RailBossRailmovement)
if audio_is_playing(RailBossExtened)
    audio_stop_sound(RailBossExtened)
