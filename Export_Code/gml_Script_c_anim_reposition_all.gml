for (var i = 0; i < c_anim_asset_count; i++)
{
    c_anim_inst[i].x = x + image_xscale * (c_anim_x[c_anim_cur, i])
    c_anim_inst[i].y = y + (c_anim_y[c_anim_cur, i])
    c_anim_inst[i].image_angle = image_xscale * (c_anim_rotation[c_anim_cur, i])
    c_anim_inst[i].image_xscale = image_xscale * (c_anim_flip[c_anim_cur, i])
    c_anim_inst[i].iindex = c_anim_iindex[c_anim_cur, i]
}
