/// @description Variables

can_walk = true;

// Cria triangulo no player (Se não estiver no level zero)
if (global.have_triangle)
instance_create_depth(x,y,depth -1, obj_player_triangle);

delta_factor = scr_get_delta_factor()

if (obj_draw_controller.player_white) sprite_index = spr_player_back1;
else sprite_index = spr_player_back_black;
// Acelerações
gravidade = 1.6;
cut_velocity = false; // Parâmetro que faz a altura do pulo ser controlada ao segurar o botão de pular
debug_jump = 0;

aceleracao_chao = 0.15;
aceleracao_ar = 0.1;
aceleracao = aceleracao_chao;

//Velocidades
velocidade_horizontal = 0;

velocidade_vertical = 0;
altura_pulo = 35;
max_velocidade_vertical = 35;

// Variaveis que descrevem o movimento
horizontal_input = 0;
speed_movement = 10;

// Momentum para pulo dado pelo obj_platform_moving_beat
momentum_up = false;
momentum_right = false;
momentum_left = false;
bonus_jump_momentum = 5;
bonus_horizontal_momentum = 5;
buffer_momentum = 20;

esta_no_chao = false;

initial_xscale = image_xscale;
initial_yscale = image_yscale;

xscale = image_xscale;
yscale = image_yscale;
comprime_escala = 0.6;
estica_escala = 1.4;
timer_landing_animation = 20;

// Coyote Time
coyote_time = 8;
steps_restantes_coyote = coyote_time;

// Buffer que guarda ação de pular
buffer_time = 10;
steps_restantes_buffer = buffer_time;


// Estado do player
enum State_player{
	Normal,
	In_air
}

estado = State_player.Normal;

// Posição do player como variavel global
global.x_position_player = x;
global.y_position_player = y;