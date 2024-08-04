if (morto == true){
	sprite_index = spr_inimigo_pulga_dead;
	
	if (image_speed <= 0){
		image_alpha -= 0.01; // sumindo depois de acabar a animacao de morte, ficando menos visivel a cada segundo
		morto = true
	}
	if (image_alpha <= 0){
		instance_destroy(); // se eu ficar totalmente invisivel, eu me destruo
	}
	
	exit; // se morto for true, tudo abaixo e desconsiderado
}

var _chao = place_meeting(x, y + 1, obj_chao);

if (_chao) {
	tempo_decidir_andar -= 1; // sla pq mas se eu tiro isso ele nao funciona kkkkk
	
	// se o tempo acabou, ele decide se vai andar
	if (tempo_decidir_andar <= 0) {
		andando = choose(true, false);
		
		if (andando) { // se ele decidir andar, ele decide a direcao que vai
			velh = choose(vel, -vel); // de novo, apos a primeira escolha ao rodar o game que esta no create
		} else {
			velh = 0 // se decidir nao andar, ele ira parar
		}
		
		tempo_decidir_andar = room_speed * 3; // depois de decidir andar ou nao, ele reseta o timer
	}
	
	// controlando a animacao do inimigo
	if (velh != 0 && dano = false) {
		sprite_index = spr_inimigo_pulga_run;
		image_xscale = sign(velh); // para olhar pro outro lado caso vire
 	} else {
		sprite_index = spr_inimigo_pulga_idle;	
	}
	
	// se eu bater na parede, eu mudo de posicao
	if (place_meeting(x + velh, y, obj_chao)) {
		velh *= -1; // inverte
	}
	
	// se eu nao posso cair, entao quando eu for cair, eu mudo a direcao
	if (pode_cair == false) {
		if (place_meeting(x + (velh * 8), y + 1, obj_chao) == false) {
			// se eu nao posso cair, e na minha frente nao tem mais chao, eu mudo de direcao
			velh *= -1;
		}
	}
	
} else { // se eu nao estou no chao, eu aplico a gravidade
	velv += grav;
	velh = 0; // quando vai cair, para de se movimentar (opcional)
	
	if (velh != 0) {
		image_xscale = sign(velh);	
	}
}

// CHECA SE TOMOU DANO
if (dano && morto == false){
	sprite_index = spr_inimigo_pulga_dano;
	velh = 0; // quando toma dano, para de se movimentar (opcional)
}