// COLISAO HORIZONTAL
var _col = instance_place(x + velh, y, obj_chao); // checa se estou colidindo com a parede
if (_col) { // se eu colidi, eu grudo em quem eu colidi
	if (velh > 0) { // checando se estou indo para a direita
		// grudando na parte ESQUERDA da parede
		x = _col.bbox_left + (x - bbox_right)
	}
	if (velh < 0) { // checando se estou indo para a esquerda
		// grudando na parte DIREITA da parede
		x = _col.bbox_right + (x - bbox_left)
	}
	
	velh = 0; // paro a entidade
}
x += velh;

// COLISAO VERTICAL
var _col = instance_place(x, y + velv, obj_chao);
if (_col) {
	if (velv > 0) {
		// grudando no CHAO
		y = _col.bbox_top + (y - bbox_bottom)
	}
	if (velv < 0) {
		// grudando no TETO
		y = _col.bbox_bottom + (y - bbox_top)
	}
	
	velv = 0;
}
y += velv;