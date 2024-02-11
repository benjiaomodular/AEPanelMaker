// 2.54mm pin header sockets

tolerance = 0.6;
$fn = $preview ? 20 : 100;

z_offset = -8; // 8mm spacer for AE systems
socket_width = 2.54 + tolerance * 2;
socket_height = 10;

module pin_socket(row=1, col=1) {
    translate([-socket_width/2, -socket_width/2, z_offset])
    for (x=[0:row-1], y=[0:col-1])
        translate([x * socket_width, y * socket_width, 0]){
            cube([socket_width, socket_width, 10]);
        }
}

#pin_socket(2, 5);