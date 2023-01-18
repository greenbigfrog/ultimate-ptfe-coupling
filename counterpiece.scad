include <socket.scad>
include <coupler.scad>

// diameter for hole size in counterpiece, allows using/trying to use plastic threads
screw_hole_counterpiece=2.7;
counter_piece_thickness=2;

module counterpiece() {
    difference() {
        intersection() {
            chamferCylinder(h=counter_piece_thickness, r=socket_diameter/2-3, ch=0,ch2=1);
            reducer();
        }
        screw_holes(diameter=screw_hole_counterpiece);
        filament_throughhole();
    }
}

$fn=128;
counterpiece();
