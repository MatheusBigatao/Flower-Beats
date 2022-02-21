// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_stretched_pos(sprite,index,x,y,scale_origin_x,scale_origin_y,xscale,yscale,alpha){
	///@desc draw_sprite_stretched_pos(sprite,index,x,y,scale_origin_x,scale_origin_y,xscale,yscale,alpha)
///@arg sprite
///@arg index
///@arg x
///@arg y
///@arg scale_origin_x
///@arg scale_origin_y
///@arg xscale
///@arg yscale
///@arg alpha

var spr = sprite
var spr_ind = index;
var xx = x;
var yy = y;
var org_x = scale_origin_x;
var org_y = scale_origin_y;
//var xscale = argument6;
//var yscale = argument7;
//var alpha = argument8;

var w = sprite_get_width(spr);
var h = sprite_get_height(spr);

var x_range_convert = range_convert(1,0,w,org_x,xscale);
var y_range_convert = range_convert(1,0,h,org_y,yscale);

var x1 = xx+(org_x*(1-xscale));
var y1 = yy+(org_y*(1-yscale));

var x2 = xx+w-(w-x_range_convert);
var y2 = yy+(org_y*(1-yscale));

var x3 = xx+w-(w-x_range_convert);
var y3 = yy+h-(h-y_range_convert)

var x4 = xx+(org_x*(1-xscale));
var y4 = yy+h-(h-y_range_convert);

draw_sprite_pos(spr,spr_ind,x1,y1,x2,y2,x3,y3,x4,y4,alpha);
}