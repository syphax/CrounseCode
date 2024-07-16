include <Bezier/bezier.scad>

LEAF_EDGE_CONTROL_POINTS = [
  [0, 0, 0],
  [2, 20, 0],
  [24, 80, 60],
  [16, 40, 40],
  [0, 60, 75]
];


diameter = 100;
height = 100;
bool_show_control_points = false;


module single_curve(diameter, height, thickness, show_control) {
    
    cp_dia = show_control ? thickness : 0;
    
    LEAF_EDGE_CONTROL_POINTS = [
      [-diameter / 2, 0, 0],
      [0, diameter, height * 2],
      [diameter / 2, 0, 0]
    ];
    
    bezier(LEAF_EDGE_CONTROL_POINTS, 10, cp_dia) sphere(thickness);
}


curves = 8;
for (i=[0:360 / curves: 360]) {
  rotate([0, 0, i]) single_curve(diameter, height, 2, bool_show_control_points);
}

