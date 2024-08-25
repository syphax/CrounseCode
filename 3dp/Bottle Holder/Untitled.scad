include <Bezier/bezier.scad>

LEAF_EDGE_CONTROL_POINTS = [
  [0, 0, 0],
  [2, 20, 0],
  [24, 80, 60],
  [16, 40, 40],
  [0, 60, 75]
];

//bezier(LEAF_EDGE_CONTROL_POINTS, 10, 2) cube([5, 1, 1]);



diameter = 100;
height = 100;


module single_curve(diameter, height, thickness, show_control) {
    LEAF_EDGE_CONTROL_POINTS_2 = [
      [-diameter / 2, 0, 0],
      [0, diameter, height * 2],
      [diameter / 2, 0, 0]
    ];

    

    bezier(LEAF_EDGE_CONTROL_POINTS_2, 10, 2) sphere(thickness);
}


curves = 8;
for (i=[0:360 / curves: 360]) {
  rotate([0, 0, i]) single_curve(diameter, height, 2);
}

