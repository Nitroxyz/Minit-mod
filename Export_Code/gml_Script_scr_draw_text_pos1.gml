var fr = -1
for (var i = 0; i < 26; i++)
{
    var temp = glyphs[i]
    switch temp
    {
        case "a":
            fr = 10
            break
        case "b":
            fr = 11
            break
        case "c":
            fr = 12
            break
        case "d":
            fr = 13
            break
        case "e":
            fr = 14
            break
        case "f":
            fr = 15
            break
        case "g":
            fr = 16
            break
        case "h":
            fr = 17
            break
        case "i":
            fr = 18
            break
        case "j":
            fr = 19
            break
        case "k":
            fr = 20
            break
        case "l":
            fr = 21
            break
        case "m":
            fr = 22
            break
        case "n":
            fr = 23
            break
        case "o":
            fr = 24
            break
        case "p":
            fr = 25
            break
        case "q":
            fr = 26
            break
        case "r":
            fr = 27
            break
        case "s":
            fr = 28
            break
        case "t":
            fr = 29
            break
        case "u":
            fr = 30
            break
        case "v":
            fr = 31
            break
        case "w":
            fr = 32
            break
        case "x":
            fr = 33
            break
        case "y":
            fr = 34
            break
        case "z":
            fr = 35
            break
        case "!":
            fr = 36
            break
        case ".":
            fr = 37
            break
        case "@":
            fr = 38
            break
        case "$":
            fr = 39
            break
        case "#":
            fr = 40
            break
        case " ":
            fr = 41
            break
        case "?":
            fr = 42
            break
        case "0":
            fr = 0
            break
        case "1":
            fr = 1
            break
        case "2":
            fr = 2
            break
        case "3":
            fr = 3
            break
        case "4":
            fr = 4
            break
        case "5":
            fr = 5
            break
        case "6":
            fr = 6
            break
        case "7":
            fr = 7
            break
        case "8":
            fr = 8
            break
        case "9":
            fr = 9
            break
    }

    draw_sprite(spr_font1, (fr + case_offset), (x + ((fr - 10) % 9) * 24), (y + ((fr - 10) div 9) * 24))
}
