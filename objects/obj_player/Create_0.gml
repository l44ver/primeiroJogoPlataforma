// MOVIMENTACAO
inputs = {
	left: ord("A"),
	right: ord("D"),
	jump: ord("W")
}

velh = 0;
velv = 0;
vel = 2.5;

grav = 0.35;

vel_jump = 5;
jump_max = 2;
jump_count = jump_max;

// COMBATE
dano = false;
tempo_dano = room_speed * 0.5; // toma dano e nao pode se mexer
timer_dano = 0;

tempo_inv = room_speed * 1.5; // invencivel, sem poder tomar dano
timer_inv = 0;