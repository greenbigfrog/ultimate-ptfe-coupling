include <coupler.scad>

recess=1;
screwhole_diameter=3.1;
screw_recess=2.9;
screw_recess_diameter=6;
socket_seating_tolerance=1.03;

socket_diameter=25;
socket_height=distance_to_wall+screw_recess;
module socket_body(height=socket_height) {
    for (i=[0:2]) {
        hull() {
            strength=9;
            rotate([0,0,i*120]) cylinder(h=height,r=strength);
            rotate([0,0,i*120]) translate([socket_diameter/2,0,0]) cylinder(h=height,r=strength-3);
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

//translate([0,0,3]) coupler();

//$fn=128;
//socket();