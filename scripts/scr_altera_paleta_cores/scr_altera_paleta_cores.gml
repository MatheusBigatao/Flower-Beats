// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_altera_paleta_cores(_numero_paleta){
	// Seleciona aleatoriamente uma paleta se o numero for zero
	if (_numero_paleta ==0)
	{
		_numero_paleta = irandom_range(1,total_paletas);
		
		// Uma paleta de cores especifica para cada room
		switch room 
		{
			case rm_level0:
			_numero_paleta = 11;
			break;
			
			
		}
			
		
	}
	
	
//RGB
//BGR (forma que o gamemaker lê)

switch _numero_paleta
{
	case 1:
		color_background = $d4eff8;
		color_background_2 = $3d6edf;
		player_white = false;
		color_walls = $6344de;
		color_platforms = $521782;
		break;
		
	case 2: // RETIRAR
		color_background = $312822;
		color_background_2 = $918b75;
		player_white = true;
		color_walls = $b5ad00;
		color_platforms = $67752d;
		break;
		
	case 3:
		color_background = $4a2e2b;
		color_background_2 = $4545e8;
		player_white = true;
		color_walls = $493790;
		color_platforms = $5277c3;
		break;

	case 4:
		color_background = $f7f7f9;
		color_background_2 = $a7b085;
		player_white = false;
		color_walls = $af723f;
		color_platforms = $4e2d11;
		break;
		
	case 5:
		color_background = $cc874d;
		color_background_2 = $563536;
		player_white = false;
		color_walls = $f7f7f9;
		color_platforms = $0e5dda;
		break;

		
	case 6:
		color_background = $dde76f;
		color_background_2 = $de9034;
		player_white = false;
		color_walls = $a63966;
		color_platforms = $582189;
		break;
		
		
	case 7:
		color_background = $3b362a;
		color_background_2 = $5f4ae8;
		player_white = true;
		color_walls = $7c84ff;
		color_platforms = $70a3ca;
		break;

	case 8:
		color_background = $413830;
		color_background_2 = $399ceb;
		player_white = true;
		color_walls = $2323d7;
		color_platforms = $689cca;
		break;
		
	case 9:
		color_background = $502814;
		color_background_2 = $e7e1da;
		player_white = true;
		color_walls = $9e9000;
		color_platforms = $6b8351;
		break;
		
		
	case 10:
		color_background = $21100f;
		color_background_2 = $e4ceff;
		player_white = true;
		color_walls = $b790fb;
		color_platforms = $5645c8;
		break;
		
	
		
	case 11:
		color_background = $000000;
		color_background_2 = $404040;
		player_white = true;
		color_walls = $7f7f7f;
		color_platforms = $bfbfbf;
		break;
		
		
	case 12:
		color_background = $cdc7a0;
		color_background_2 = $817654;
		player_white = false;
		color_walls = $312822;
		color_platforms = $351a8a;
		break;
		
	case 13:
		color_background = $c6f5f5;
		color_background_2 = $7ba87d;
		player_white = false;
		color_walls = $656732;
		color_platforms = $3d2527;
		break;
		
}

}