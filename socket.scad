include <coupler.scad>

distance_wall=1;
recess=1;
screwhole_diameter=2;
screw_recess=2;
screw_recess_diameter=3;

socket_diameter=40;

socket_height=distance_to_wall+magnet_height+distance_wall+recess;
module socket_body() {
    difference() {
        ScrewThread(outer_diam=socket_diameter, height=socket_height, pitch=2, tooth_angle=30, tolerance=0.4, tip_height=0, tooth_height=0, tip_min_fract=0) 
        cylinder(h=socket_height,r=socket_diameter/2);
        
        translate([0,0,socket_height-recess]) union() {
            coupler(magnets=false);
            cylinder(h=100,r=5);
        }
        magnets();
    }
}

module screw_holes() {
    for (i=[0:2]) {
        rotate([0,0,60+i*120]) translate([12,0,0]) cylinder(h=100,r=screwhole_diameter/2);
        rotate([0,0,60+i*120]) translate([12,0,socket_height-screw_recess]) cylinder(h=10,r=screw_recess_diameter/2);
    }
}

module socket() {
    difference() {
        socket_body();
        screw_holes();
    }
}

// socket();