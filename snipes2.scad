side = 40;

// height of equilateral
// faceheight = sqrt(3)/2*side;

// golden ratio
//phi = (1+sqrt(5))/2;

// dihedral angle
// di = 2*asin(phi/sqrt(3));

// distance to vertex
dv = side*0.951056517;

// central angle
ca = 63.4349488;

// this is the angle that an edge makes with
// horizontal when figure is placed upright on vertex
point_angle = 31.71747441;

module node() {
	for ( i = [0 : 4] ) {
		rotate([90+point_angle, 0, i * 360 / 5])
		translate([-1,-1,0])
		cube([2,2,side/2]);

		rotate([180-point_angle, 0, i * 360 / 5+36])
		translate([-1,-1,0])
		#cube([2,2,side]);

	}

	sphere(3);
}

for ( i = [0 : 4] )
{
	rotate([90-ca, 0, i * 360 / 5])
	translate([0, dv, 0]) rotate([-90,0,0]) {
		node();	
	}
	
	rotate([ca-90, 0, (i * 360 / 5)+36])
	translate([0, dv, 0]) rotate([-90,36,0]) {
		node();
	}
}

// top
translate([0, 0, dv]) {
	rotate([0,0,36])
	node();
}
	
// bottom
translate([0, 0, -dv]) {
	//rotate([180,0,0]) {
	rotate([180,0,36]) {
		node();
	}
}
