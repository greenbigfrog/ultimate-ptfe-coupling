use <coupler.scad>
use <socket.scad>
use <lid.scad>
use <counterpiece.scad>

render_coupler=true;
render_socket=true;
render_lid=true;
render_counterpiece=true;
$fn=128;
if (render_coupler) {
    coupler();
}
if (render_socket) {
    socket();
}
if (render_lid) {
    rotate([0,180,0]) lid();
}
if (render_counterpiece) {
    counterpiece();
}
