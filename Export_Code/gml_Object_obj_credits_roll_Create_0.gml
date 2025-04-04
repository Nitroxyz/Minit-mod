x = floor(room_width / 2)
y = 240
scroll_speed = 1
scroll_header = loc_read_line(592)
scroll_text = string_hash_to_newline("####A game by#DOINKSOFT##Britt Brady#Cullen Dwyer#Joseph Bourgeois###Animations by #Miroko##Key Artwork by#Guillaume Singelin###Published by#Devolver Digital##Fork Parker#Rick Stults#Graeme Struthers#Andrew Parsons#Harry Miller#Mike Wilson#Nigel Lowrie#Anna Sajecka#Kate Ludlow#Kert Gartner#Vieko Franetovic#JM Specht#Jared Stults#Jonathan \"JR\" Rosales#Hazel Yang#Simon Chang#John Bartkiw##Tinsley PR#Stephanie Tinsley#Thomas Schulenberg##Cosmocover#Salima Bessahraoui#Pierre-Louis Barbier#John Tyrrell#Fabian Mario Doehla#Rebeca Velez Minguez#Nyssa Woznicki#Maxence Jacquier##Indigo Pearl#Robbie Paterson##VanessaDouglasComms#Doug Johns##Kakehashi Games#Zach Huntley#Kimitaka Ogawa##BADA Games#Bada Im##Gamenuts#Rodrigo Batelli##Localisation#Loc&Load##Special Thanks#Lionbridge#Testronic#Ritvik Bansal#Zach Calabro#Kyle Baker#Graven Davis#Joel Deskin#AskiiSoft#Riv Hester#Graby")
draw_set_font(fnt_nesultra)
y_min = (-string_height(scroll_text))
music = audio_play_sound(mu_workshop, 5, true)
