// === Parameters ===

// Stub/sleeve
stub_diameter = 1.7;
sleeve_wall = 1;
sleeve_length = 10;

// Arm (straight + curved)
arm_straight_length = 60;
arm_curve_radius = 20;
arm_curve_angle = 80;
arm_width = 3;
arm_thickness = 2;

// Tip
tip_length = 10;
tip_width = 6;
tip_thickness = 3;

$fn = 60;  // Smoothness

module sleeve() {
    difference() {
        cylinder(h = sleeve_length, d = stub_diameter + 2*sleeve_wall);
        cylinder(h = sleeve_length, d = stub_diameter);
    }
}

module straight_arm() {
    translate([-arm_width/2, -arm_thickness/2, sleeve_length])
        cube([arm_width, arm_thickness, arm_straight_length]);
}

module curved_end() {
    translate([-arm_curve_radius - arm_width / 2.0, 0, sleeve_length + arm_straight_length])
        rotate([90, 0, 0])
            rotate_extrude(angle = arm_curve_angle)
                translate([arm_curve_radius, -arm_thickness/2, 0])
                    square([arm_width, arm_thickness], center=false);
}

module flared_tip() {
    // Place at end of curve
    angle_rad = arm_curve_angle * PI / 180;
    tip_z = sleeve_length + arm_straight_length + arm_curve_radius * sin(angle_rad);
    tip_x = -tip_length + arm_curve_radius * sin(angle_rad); //(1 - cos(angle_rad));
    
    translate([tip_x - tip_width/2, -tip_thickness/2, tip_z])
    rotate([0, -arm_curve_angle, 0])
        cube([tip_width, tip_thickness, tip_length]);
}

module full_earpiece() {
    union() {
        sleeve();
        straight_arm();
        curved_end();
        //flared_tip();
    }
}

full_earpiece();
