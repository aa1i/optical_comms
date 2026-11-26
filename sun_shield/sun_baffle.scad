diameter = 106.5;
radius = diameter/2.0;

height = 105.0;
base = 100.0;
wall=2.0;

$fn=180;

outer_radius = radius + wall;

spine_width = wall;
spine_length = (height + base) - 2 * 20;

/* main cylinder */
difference()
{

union () {
/* main cylinder */
cylinder(h=height+base,r=outer_radius);
    
 /* spine */
 //translate([0,outer_radius-1,20])
 //cube([wall,20,spine_length]);   
}
translate([0,0,-0.5])
cylinder(h=height+base+1.0,r=radius);


/* negative space */
translate([0,0,base+diameter])
difference()
{
union()
{
cube([diameter*2,diameter*2,diameter],center=true);

rotate([0,90,0])
translate([radius,-radius,-2*radius])
cylinder(r=radius,h=diameter*2);
}

rotate([0,90,0])
translate([radius,radius,-diameter-0.5])
cylinder(r=radius,h=diameter*2+1.0);
}
}