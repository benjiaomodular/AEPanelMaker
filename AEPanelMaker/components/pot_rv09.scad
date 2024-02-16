// Based on Alpha RV09
tolerance = 0.3;
$fn = $preview ? 20 : 100;

module pot_rv09() {
    
    translate([0, 7.5, 0]){
        translate([0, 0, 0])
        cylinder(r = 3.5 + tolerance, h = 8);

        //translate([-1, -6.5, 0])
        //cube([2, 3, 1]);
        
        translate([0, 0, -10])
            union() {
                translate([-5, -7.5, 0])
                cube([10, 14, 10]);
            }
    }
}

pot_rv09();