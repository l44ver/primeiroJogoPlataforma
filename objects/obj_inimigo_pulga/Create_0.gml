event_inherited();
/* depois de erdar do pai, criei um inherited para add mais coisas que nao quero que tenha no obj_entidade
e esse comando assima, veio sozinho, no qual ainda esta puxando oq tem no pai, e funciona normalmente
e oq teraa abaixo, funcionara apenas nesse objeto */

// PERSONALIZANDO AS VARIAVEIS para ser diferente do pai
vel = choose(1, -1) // ele ira escolher se vai andar pra direita ou esquerda aleatoriamente assim que inicia

andando = choose(true, false);

if (andando) {
	if (andando) { // se ele decidir andar, ele decide a direcao que vai
		velh = choose(vel, -vel);
	} else {
		velh = 0 // se decidir nao andar, ele ira parar
	}
}

tempo_decidir_andar = room_speed * 3; // 3 segundos