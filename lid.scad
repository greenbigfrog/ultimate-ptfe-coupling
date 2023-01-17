include <socket.scad>
use <Chamfers-for-OpenSCAD/Chamfer.scad>
layer_height=0.25;
bottom_layers=3;
lid_height=socket_height+bottom_layers*layer_height;
lid_diameter=socket_diameter+3;

module lid() {
    difference() {
        chamferCylinder(h=lid_height,r=lid_diameter/2, ch=0.5,ch2=1);
        socket();
        cylinder(h=socket_height,r=socket_diameter/2-3);
    }
}
