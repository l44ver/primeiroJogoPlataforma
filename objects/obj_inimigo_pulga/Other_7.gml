// se eu estou usando a sprite de dano e a animacao acabou, eu morro
if (sprite_index == spr_inimigo_pulga_dano){
	morto = true;
}

if (sprite_index == spr_inimigo_pulga_dead){
	image_speed = 0; // quando morrer, para a animacao
	image_index = 3; // no quarto frame dela (index 3, quarto e ultimo frame da animacao)
} 