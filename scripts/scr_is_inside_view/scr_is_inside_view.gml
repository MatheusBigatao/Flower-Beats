/// @description scr_is_inside_view ()
function scr_is_inside_view() {
	//var offset = (global.right_border_camera - global.left_border_camera)*0.1;
	var is_inside_view = (x > global.left_border_camera and x < global.right_border_camera) and (y < global.bottom_border_camera and y > global.top_border_camera);

	return is_inside_view;


}
