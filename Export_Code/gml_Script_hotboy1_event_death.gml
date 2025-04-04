qu_set(254)
with (obj_hotboy1)
{
    c_anim_load_anim(anim_talk, anim_idle, 4)
    state = 591
}
if instance_exists(obj_custom9.exploit_blocker)
{
    with (obj_custom9.exploit_blocker)
        instance_destroy()
}
