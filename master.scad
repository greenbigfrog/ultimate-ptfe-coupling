use <coupler.scad>
use <socket.scad>
use <lid.scad>

render_coupler=true;
render_socket=true;
render_lid=true;

if (render_coupler) {
    coupler();
}
if (render_socket) {
    socket();
}
if (render_lid) {
    lid();
}
