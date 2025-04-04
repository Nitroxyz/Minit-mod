image_speed = 0.05
method[0] = -1
arguments[0] = -1
c_destroy = 0
destroyontouch = 0
water = 1
var sprct = sprite_get_number(sprite_index)
if (sprct > 1)
    image_index = (((x - 8) div 16) + ((y - 8) div 16)) % sprct
else
    image_speed = 0
iindex = image_index
