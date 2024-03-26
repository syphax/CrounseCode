include <BOSL2/std.scad>

length = 118;
width = 40;
height = 100;
thickness = 5;
rounding = 5;

spacing_x = 10;
spacing_z = 6;
height_hole_offset = 12;

hole_size = 6;

// Ribs
rib_length = 6;
rib_spacing_x = spacing_x * 1;
rib_height = height_hole_offset;
rib_count = floor(length / rib_spacing_x);

// Floor

thickness_bottom = thickness * 1.5;

translate([0, 0, -thickness_bottom / 4])
cuboid([length, width, thickness_bottom], rounding=rounding, edges="Z");

// Add ribs

for (i = [1:1:rib_count]) {
    translate([
        -length / 2 + i * rib_spacing_x, 
        0, 
        rib_height / 2])
    cuboid([rib_length, width, rib_height], rounding=3, edges="Y", except=BOTTOM);
}


difference() {
    
    
    // Maim shape
        
    rect_tube(size=[length,width], isize=[length-thickness, width-thickness], h=height, rounding=rounding);

    // Screw mounts [brute force]
    
    translate([-length/3, -thickness * 2, height * 0.8])
    cuboid([4, width, 20], rounding=2, edges="Y");
    
    translate([-length/3, -thickness * 2, height * 0.8 - 6])
    cuboid([8, width, 10], rounding=3, edges="Y");
    
    translate([+length/3, -thickness * 2, height * 0.8])
    cuboid([4, width, 20], rounding=2, edges="Y");

    translate([+length/3, -thickness * 2, height * 0.8 - 6])
    cuboid([8, width, 10], rounding=3, edges="Y");
    // Cut-outs

    hole_count_x = floor(length / spacing_x);
    hole_count_z = floor((height - height_hole_offset) / spacing_z) - 1;

    //echo(hole_count_vert);

    // i is the vertical loop
    // j is the across loop
        
    for (i = [1:1:hole_count_z]) {
        flag_x_offset = i % 2;
        hole_count_x = hole_count_x - (flag_x_offset);
        
        for (j = [1:1:hole_count_x]) {
            
            translate([-length / 2  + j * spacing_x + flag_x_offset * (spacing_x / 2), 
            thickness * 1, 
            height_hole_offset + i * spacing_z])
            
            // Face
            cuboid([hole_size, width * 1.2, hole_size], 
            rounding=2, 
            spin=[0, 45, 0]);
            
        }
        
        // Ends
        
        hole_count_y = floor(width / spacing_x) - 1;
        
        for (j = [1:1:hole_count_y]) {
            
            translate([0, 
            -width / 2 + (j + flag_x_offset/2) * spacing_x - spacing_x/4, 
            height_hole_offset + i * spacing_z])
            cuboid([length * 1.2, hole_size, hole_size], 
            rounding = 2,
            spin=[45, 0, 0]);

            }
    }
}