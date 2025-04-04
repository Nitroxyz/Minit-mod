if (median(x, mouse_x, (x + sprite_width)) == mouse_x && median(y, mouse_y, (y + sprite_height)) == mouse_y)
    return 1;
else
    return 0;
