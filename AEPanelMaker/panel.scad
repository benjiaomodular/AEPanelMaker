use <components/led.scad>
use <components/pot_rv09.scad>
use <components/pin_socket.scad>

title = "";
units = 1;
inputs = 2;
outputs = 2;

text_depth = 1.4;
gap_tolerance = 0.5;

panel_thickness = 2;
panel_height = 101;
panel_width = 25.4 * units - gap_tolerance;

// Set deep components sit inside the panel
component_depth = 1;

// Position of left mounting holes
mount_position_x = 12.3;

// For perfboard builds, align everything to left mounting holes (bottom-left)
start_y = 3.4;
start_x = mount_position_x - 10.16;

title_x = panel_width / 2;
title_y = panel_height - 25;
title_font_size = 3;
title_font = "Liberation Sans:style=bold";
title_rotate = 0;

pin_sockets = []; //  [x, y, rows, cols]
pots_rv09 = [];
leds = [];

pot_label_distance = 12;
pot_label_font_size = 3;
label_font = "Liberation Sans:style=bold";

module generate_panel(){
    $fn = $preview ? 20 : 100;

    difference(){
        cube([panel_width, panel_height, panel_thickness]);
        union(){
            generate_title();
            generate_mounting_holes();
            
            // == Generate Standard AE I/O ==
            for (idx = [0: inputs]) {
                generate_pin_sockets(
                    2 * 2.54,
                    (39 - inputs) * 2.54,
                    [0, 0, 1, inputs]);
            }
            
            for (idx = [0: outputs]) {
                generate_pin_sockets(
                    8 * 2.54,
                    (39 - outputs) * 2.54,
                    [0, 0, 1, outputs]);
            }
            
            // == Generate components ==
            for (idx = [0 : len(pots_rv09)]) {
                if (pots_rv09[idx]) {
                    echo("POTS RD901F:", idx = pots_rv09[idx]);
                    generate_pots_rv09(
                        pots_rv09[idx][0] * 2.54,
                        pots_rv09[idx][1] * 2.54,
                        pots_rv09[idx]);
                }
            }
            
            for (idx = [0 : len(leds)]) {
                if (leds[idx]) {
                    echo("LED:", idx = leds[idx]);
                    generate_leds(
                        leds[idx][0] * 2.54,
                        leds[idx][1] * 2.54);
                }
            }

            for (idx = [0 : len(pin_sockets)]) {
                if (pin_sockets[idx]) {
                    echo("2.54 Pin Sockets:", idx = pin_sockets[idx]);
                    generate_pin_sockets(
                        pin_sockets[idx][0] * 2.54,
                        pin_sockets[idx][1] * 2.54,
                        pin_sockets[idx]);
                }
            }
            
        }
    }
}

module generate_title(){
    translate([title_x, title_y, panel_thickness - text_depth])
    rotate([0, 0, title_rotate])
    linear_extrude(height=text_depth + 1)
    text(title, font=title_font, size=title_font_size, halign="center");     
}

module generate_mounting_holes(){
    
    // Top-Left
    translate([12.3, panel_height - 3.4, 0])
    cylinder(r = 1.6, h = 10, center = true);
   
    // Bottom-Left
    translate([12.3, 3.4, 0])
    cylinder(r = 1.6, h = 10, center = true);
    
    if (units > 1) {
        // Top-Right
        translate([panel_width - 12.3, panel_height - 3.4, 0])
        cylinder(r = 1.6, h = 10, center = true);
       
        // Bottom-Right
        translate([panel_width - 12.3, 3.4, 0])
        cylinder(r = 1.6, h = 10, center = true);
    
    }
}

// == Component generators ==
module generate_pin_sockets(x, y, params){
    translate([x, y, component_depth])
    #pin_socket(params[2], params[3]);
}


module generate_leds(x, y, size=3){
    translate([x, y, component_depth])
    #led(d = size);
}

module generate_pots_rv09(x, y, params) {
    middle_y = 7.5;

    translate([x, y, component_depth])
    rotate([0, 0, params[3] ? params[3] : 0])
        #pot_rv09();

    translate([
        x,
        y + middle_y + pot_label_distance,
        panel_thickness - text_depth])

        linear_extrude(height = text_depth + 2)
        text(
            params[2],
            font=label_font,
            size=pot_label_font_size,
            halign="center",
            valign="center");
}
// ====

generate_panel();