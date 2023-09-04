title = "";
units = 1;
inputs = 8;
outputs = 8;

text_depth = 1.4;
gap_tolerance = 0.5;

panel_thickness = 2;
panel_height = 101;
panel_width = 25.4 * units - gap_tolerance;

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

input_hole_x = start_x + 1.27;
input_hole_height = 2.54 * inputs + 2.54;

output_hole_x = start_x + 25.4 * units - 2.54 * 3 - 1.27;
output_hole_height = 2.54 * outputs + 2.54;

module generate_panel(){
    $fn = $preview ? 20 : 100;

    difference(){
        cube([panel_width, panel_height, panel_thickness]);
        union(){
            generate_title();
            generate_mounting_holes();
            generate_input_holes();
            generate_output_holes();
        }
    }
}

module generate_input_holes(){
    translate([input_hole_x, panel_height - input_hole_height - 0.86])
    #cube([3, input_hole_height, 4]);
    }

module generate_output_holes(){
    translate([output_hole_x, panel_height - output_hole_height - 0.86])
    #cube([3, output_hole_height, 4]);}

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


generate_panel();