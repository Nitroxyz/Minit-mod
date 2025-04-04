animate_custom()
if (shootcounter > 0)
{
    shootcounter--
    if (shootcounter == 0)
    {
        if (shootcount != 0)
        {
            c_anim_load_anim(anim_shoot_2, anim_clench)
            image_speed = 0.2
        }
        else
        {
            c_anim_load_anim(anim_shoot, anim_talk)
            image_speed = 0.2
        }
    }
}
else if c_anim_loopflag
{
    if (shootcount > 0)
    {
        obj_hotboy1.bullet_multiplier = (obj_hotboy1.bullet_multiplier == 1 ? 0.7 : 1)
        shootcounter = 120
        shootcount--
    }
    else
    {
        shootcounter = 120
        state = 597
    }
}
