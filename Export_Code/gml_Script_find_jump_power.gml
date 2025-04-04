var xtemp = argument0
var ytemp = argument1
var xtartemp = argument2
var ytartemp = argument3
var hspdtemp = abs(argument4)
var vspdtemp = 0
var gravtemp = argument5
var steps = ceil((abs(xtartemp - xtemp)) / hspdtemp)
vspdtemp = (ytartemp - ytemp) / steps
var vspdchg = steps * gravtemp
return ((-vspdchg) / 2 + vspdtemp);
