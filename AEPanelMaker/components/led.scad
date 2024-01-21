tolerance = 0.3;
$fn = $preview ? 20 : 100;

module led(d = 3) {
    translate([0, 1.5, 0]){
        cylinder(d = d + (2 * tolerance), h = 2.5);
        
        translate([0, 0, -4])
        cylinder(d = d + 1 + (2 * tolerance), h = 4);
        
        translate([0, -1.5, -7])
        cube([0.8, 0.8, 7], center=true);
        
        translate([0, 1.5, -5])
        cube([0.8, 0.8, 5], center=true);   
    }
}

led();