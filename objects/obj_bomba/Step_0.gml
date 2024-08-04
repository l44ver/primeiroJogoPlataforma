velv += grav;  // apliquei a gravidade

if (momento == "off"){
	sprite_index = spr_bomba_off;
	
} else if (momento == "on"){
	sprite_index = spr_bomba_on;
	if (timer_boom > 0){  // rodando o timer do boom
		timer_boom --;
	} else {  // se o boom timer zerar
		momento = "boom"
	}
	
} else if (momento == "boom"){
	sprite_index = spr_bomba_boom;
}