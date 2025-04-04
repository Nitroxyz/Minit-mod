draw_self_actor()
if (y != ytether)
{
    for (var i = y - 32; i > (ytether - 16); i -= 16)
        draw_sprite(spr_smasher_rod, 0, x, i)
}
