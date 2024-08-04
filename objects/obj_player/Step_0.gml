   // CONTROLANDO O PLAYER
var _chao = place_meeting(x, y + 1, obj_chao);

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

// so posso me movimenhtar se o timer do dano estiver zerado
if (timer_dano <= 0){
	velh = (_right - _left) * vel; // movimentacao
}

// PULANDO
if (_jump) && (jump_count > 1){
	jump_count -= 1;
	velv =- vel_jump;
}

if (_chao) { // estou no chao
	jump_count = jump_max; // ao encostar no chao, a contagem do jump reseta
	
	// TROCA O SPRITE QUANDO CORRE (no chao)
	if (velh != 0) {
		sprite_index = spr_player_run;
		image_xscale = sign(velh) // flipa o sprite quando ele olha pro outro lado
	} else {
		sprite_index = spr_player_idle;
	}

} else { // nao estou no chao
	// APLICO A GRAVIDADE
	velv += grav; 
	
	// MUDA O SPRITE PULANDO E CAINDO
	if (velv < 0) {
		sprite_index = spr_player_jump;
	} else {
		sprite_index = spr_player_fall;
	}
	
	// PULAR NA CABECA DO INIMIGO
	var _inimigo = instance_place(x, y + 4, obj_inimigo_pai);
		
	if (_inimigo){
			
		dano = false; // nao recebe dano ao pular na cabeca do inimigo
			
		if (_inimigo.morto == false){ // consigo apenas se ele nao estiver morto
			velv =- vel_jump; // pula ao cair na cabeca do inimigo
			_inimigo.dano = true; // avisou pro inimigo que ele tomou dano
		}
	}
	
	// TROCA O SPRITE QUANDO CORRE (no ar)
	if (velh != 0) {
		sprite_index = spr_player_run;
		image_xscale = sign(velh); // flipa o sprite quando ele olha pro outro lado
	}
}

// DIMINUIR TIMER DO DANO E DO INVENCIVEL
if (timer_dano > 0){
	timer_dano --;
} else {
	dano = false  // se o timer do dano acabou, dano vira false
}
if (timer_inv > 0){
	timer_inv --;
	image_alpha = 0.5;  // durante o periodo invencivel, fica um pouco invisivel
} else{
	image_alpha = 1;  // quando o periodo de invencivel acaba, volta a ser normal a visibilidade
}

if (dano == true){
	sprite_index = spr_player_dano; // muda a sprite ao receber dano
}

// TOMANDO DANO
var _inimigo = instance_place(x, y, obj_inimigo_pai);
if (_inimigo && timer_inv <= 0 &&_inimigo.morto == false && _inimigo.dano == false){
	dano = true;
	timer_dano = tempo_dano; // ao tomar dano, inicia o timer de nao poder se mexer
	timer_inv = tempo_inv; // ao tomar dano, inicia o timer de nao poder tomar outro dano
}