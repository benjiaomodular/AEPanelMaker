// 2.54mm pin header sockets

tolerance = 0.8;
$fn = $preview ? 20 : 100;

z_offset = -8; // 8mm spacer for AE systems
socket_width = 2.54;
socket_height = 10;

module pin_socket(row=1, col=1) {
    translate([-socket_width/2-tolerance, -socket_width/2-tolerance, z_offset])
    for (x=[0:col-1], y=[0:row-1])
        translate([x * socket_width, y * socket_width, 0]){
            cube([socket_width + tolerance * 2, socket_width+ tolerance * 2, 10]);
        }
}

#pin_socket(2, 4);