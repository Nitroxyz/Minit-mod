originX = argument0
originY = argument1
width = argument2
height = argument3
borderWidth = sprite_get_width(sprHUDRect9Slice)
borderHeight = sprite_get_height(sprHUDRect9Slice)
xScale = (width - borderWidth * 2) / borderWidth
yScale = (height - borderHeight * 2) / borderHeight
draw_sprite(sprHUDRect9Slice, 0, originX, originY)
draw_sprite_ext(sprHUDRect9Slice, 1, (originX + borderWidth), originY, xScale, 1, 0, c_white, 1)
draw_sprite(sprHUDRect9Slice, 2, (originX + width - borderWidth), originY)
draw_sprite_ext(sprHUDRect9Slice, 3, originX, (originY + borderHeight), 1, yScale, 0, c_white, 1)
draw_sprite_ext(sprHUDRect9Slice, 4, (originX + borderWidth), (originY + borderHeight), xScale, yScale, 0, c_white, 1)
draw_sprite_ext(sprHUDRect9Slice, 5, (originX + width - borderWidth), (originY + borderHeight), 1, yScale, 0, c_white, 1)
draw_sprite(sprHUDRect9Slice, 6, originX, (originY + height - borderHeight))
draw_sprite_ext(sprHUDRect9Slice, 7, (originX + borderWidth), (originY + height - borderHeight), xScale, 1, 0, c_white, 1)
draw_sprite(sprHUDRect9Slice, 8, (originX + width - borderWidth), (originY + height - borderHeight))
