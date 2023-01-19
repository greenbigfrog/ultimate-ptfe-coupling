include <socket.scad>
use <Chamfers-for-OpenSCAD/Chamfer.scad>
layer_height=0.25;
bottom_layers=3;
lid_height=socket_height+bottom_layers*layer_height;
lid_diameter=socket_diameter+3;

module lid() {
    // ScrewHole(outer_diam=socket_diameter, height=socket_height, position=[0,0,0], rotation=[0,0,0], pitch=2, tooth_angle=30, tolerance=0.4, tooth_height=0) chamferCylinder(h=lid_height,r=lid_diameter/2, ch=0.5,ch2=1);
    chamferCylinder(h=15,r=3,ch=0,ch2=1);
    difference() {
        coupler_outline();
        magnets();
    }
}
//translate([0,0,0-10]) socket();

//$fn=128;
//lid();
