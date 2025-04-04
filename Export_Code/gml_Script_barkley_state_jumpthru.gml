vspd += grav
sprite_index = spr_barkley_jump
if (vspd < -0.5)
    iindex = 0
else if (vspd < 0.5)
    iindex = 1
else
    iindex = 2
y += vspd
