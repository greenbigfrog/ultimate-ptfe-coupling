include <socket.scad>
include <coupler.scad>

// diameter for hole size in counterpiece, allows using/trying to use plastic threads
screw_hole_counterpiece=2.7;
counter_piece_thickness=2;

module counterpiece() {
    difference() {
        socket_body(height=counter_piece_thickness);
        screw_holes(diameter=screw_hole_counterpiece);
        filament_throughhole();
    }
}

$fn=128;
counterpiece();
