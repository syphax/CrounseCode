include <BOSL2/std.scad>



//cube(100);  
//color("gray")
//
//cube([50,40,20], anchor=TOP+FRONT+LEFT);
//
//color("green")
//
//translate([100, 0, 0])
//
//cube([50,40,20], anchor=FRONT, spin=[15,0,30]);
//
//color("yellow")
//
//cube([50,40,20], orient=UP+BACK+RIGHT);
//
//
//translate([200, 0, 0])
//
//cuboid([100,20,20], rounding=10, edges=RIGHT+FRONT+TOP);
//

// First shot with OpenSCAD in a few years!
// No parametrics yet; just hard-coded

// Base

color("green")
translate([60, 0, 5])
cuboid([120,20,10], rounding=10, edges=RIGHT+LEFT+TOP);

color("green")
translate([60, 80, 5])
cuboid([120,20,10], rounding=10, edges=RIGHT+LEFT+TOP);

color("green")
translate([100, 40, 5])
cuboid([20,120,10], rounding=10, edges=RIGHT+LEFT+TOP);

color("green")
translate([20, 40, 5])
cuboid([20,120,10], rounding=10, edges=RIGHT+LEFT+TOP);


// End 1

color("blue")
translate([20, 0, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([60, 0, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([100, 0, 40])
cyl(d=10, l=80, rounding2=5);

// End 2

color("blue")
translate([20, 80, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([60, 80, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([100, 80, 40])
cyl(d=10, l=80, rounding2=5);

// Mid 1

color("blue")
translate([20, 25, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([100, 25, 40])
cyl(d=10, l=80, rounding2=5);

// Mid 2

color("blue")
translate([20, 55, 40])
cyl(d=10, l=80, rounding2=5);

color("blue")
translate([100, 55, 40])
cyl(d=10, l=80, rounding2=5);


// Supports
//color("grey")
//translate([16, 2, 70])
//cube([80,10,4], spin=[90,60,0]);
