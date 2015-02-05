side = 30;
phi = (1+sqrt(5))/2;
// dihedral angle
di = 2*asin(phi/sqrt(3));

// distance to vertex
dv = side*0.951056517;
// central angle
ca = 63.4349488;

module triangle(radius)
{
	o=radius/2; //equivalent to radius*sin(30)
	a=radius*sqrt(3)/2; //equivalent to radius*cos(30)
	polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
}

module reg_polygon(sides,radius)
{
function dia(r) = sqrt(pow(r*2,2)/2); //sqrt(r*2^2/2) if only we had an exponention op
if(sides<2) square([radius,0]);
if(sides==3) triangle(radius);
if(sides==4) square([dia(radius),dia(radius)],center=true);
if(sides>4) circle(r=radius,$fn=sides);
}
module pentagon(radius)
{
	reg_polygon(5,radius);
}

module node() {
	for ( i = [0 : 4] ) {
		rotate([120, 0, i * 360 / 5])
		translate([-1,-1,0])
		cube([2,2,16]);
	}
	sphere(3);
}

for ( i = [0 : 4] )
{
	rotate([ca/2, 0, i * 360 / 5])
	translate([0, dv, 0]) rotate([-(ca/2+ca),0,0]) {
		node();	
	}

	rotate([-ca/2, 0, (i * 360 / 5)+36])
	translate([0, dv, 0]) rotate([-(ca/2+ca),0,0]) {
		node();
	}
}

// top
translate([0, 0, dv]) {
	node();
}
	
// bottom
translate([0, 0, -dv]) {
	rotate([180,0,0]) {
		node();
	}
}
