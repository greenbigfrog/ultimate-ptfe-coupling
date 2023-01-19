use <Chamfers-for-OpenSCAD/Chamfer.scad>
use <threads-scad/threads.scad>

magnet_diameter=6.2;
magnet_height=3.5;
distance_to_wall=0.7;

// max_magnet_height=5; simply scale height, till they fit inside
// design is currently built to fit max diameter of 8mm magnets
max_magnet_diameter=8;
assert(magnet_diameter<max_magnet_diameter, "Design accomadates magnets up to a diameter of 8mm");
min_wall_thickness=1;

// pneumatic fitting (default PC4-M6(?))
thread_diameter=6;
thread_height=4.5;

filament_throughhole_size=3;

// TODO: increase magnet size for easy insertion
module magnet(diameter=magnet_diameter, height=magnet_height) {
    cylinder(h=height,r=diameter/2);
}

distance_magnets_center=10;
module magnets() {
    for (i=[0:2]) {
        rotate([0,0,i*120]) translate([distance_magnets_center,0,distance_to_wall]) magnet();
    }
}

base_height = magnet_height+distance_to_wall+min_wall_thickness;
// account for thread height, if magnet smaller thread height
height = (thread_height > magnet_height) ? base_height - magnet_height + thread_height : base_height;

h=height;
r=(max_magnet_diameter+min_wall_thickness*2)/2;
module c(i) {
    rotate([0,0,i*120]) translate([distance_magnets_center,0,0]) chamferCylinder(h=h,r=r,ch=0,ch2=1.5);
}
module e(i) {
    rotate([0,0,i*120+60]) translate([distance_magnets_center/4,0,0]) chamferCylinder(h=h,r=r,ch=0,ch2=1.5);
}
module coupler_outline() {
    hull() {
        c(0);
        e(0);
        e(2);
    }
    hull() {
        c(1);
        e(1);
        e(0);
    }
    hull() {
        c(2);
        e(2);
        e(1);
    }
}

module filament_throughhole() {
    translate([0,0,-10]) cylinder(h=100,filament_throughhole_size/2);
}

module coupler_shape() {
    difference() {
        coupler_outline();
        filament_throughhole();
    }
}

module coupler(magnets=true) {
    difference() {
        ScrewHole(outer_diam=thread_diameter, height=thread_height, position=[0,0,height], rotation=[0,180,0], pitch=0, tooth_angle=30, tolerance=0.4, tooth_height=0) coupler_shape();
        if (magnets) {
            magnets();
        }
    }
}

//$fn=128;
//coupler();