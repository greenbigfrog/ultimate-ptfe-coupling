include <coupler.scad>

distance_wall=1;
recess=1;
screwhole_diameter=3;
screw_recess=3;
screw_recess_diameter=6;
socket_seating_tolerance=1.02;

socket_diameter=40;
// $fn=16;

module reducer() {
    for (i=[0:2]) {
        hull() {
            strength=15;
            rotate([0,0,i*120]) cylinder(h=100,r=strength/2);
            rotate([0,0,i*120]) translate([socket_diameter,0,0]) cylinder(h=100,r=strength/2);
        }
    }
}

socket_height=distance_to_wall+magnet_height+distance_wall+recess;
module socket_body() {
    difference() {
        // ScrewHole(outer_diam=socket_diameter, height=socket_height, position=[0,0,0], rotation=[0,0,0], pitch=2, tooth_angle=30, tolerance=0.4, tooth_height=0) cylinder(h=socket_height,r=socket_diameter/2);
        intersection() {
            ScrewThread(outer_diam=socket_diameter, height=socket_height, pitch=2, tooth_angle=30, tolerance=0.4, tip_height=0, tooth_height=0, tip_min_fract=0) cylinder(h=socket_height,r=socket_diameter/2);
            reducer();
        }
        
        scale([socket_seating_tolerance,socket_seating_tolerance,1]) translate([0,0,socket_height-recess]) union() {
            coupler(magnets=false);
            cylinder(h=100,r=5); // gets rid of the artifact of the threads
        }
    }
}

module screw_holes(diameter=0,screw_recess=0) {
    for (i=[0:2]) {
        rotate([0,0,i*120]) translate([12,0,-5]) cylinder(h=100,r=diameter/2);
        rotate([0,0,i*120]) translate([12,0,socket_height-screw_recess]) cylinder(h=10,r=screw_recess_diameter/2);
    }
}

module socket() {
    difference() {
        socket_body();
        screw_holes(screwhole_diameter,screw_recess);
        filament_throughhole();
    }
}

//socket();