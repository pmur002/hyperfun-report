
library(hyperfun)
library(rgl)

plane <- function(a=0, b=0, c=0, d=0) {
    function(xyz) {
        x <- xyz[1]
        y <- xyz[2]
        z <- xyz[3]
        a*x + b*y + c*z + d
    }
}

axis1 <- hfCylinder(r=1, axis="Z")
axis2 <- hfCylinder(r=1, axis="Y")
axis3 <- hfCylinder(r=1, axis="X")

xyPlane <- hfR(plane(c=1))
xzPlane <- hfR(plane(b=1))
yzPlane <- hfR(plane(a=1))

c1 <- hfR(plane(-3, -5, -2, 60))
c2 <- hfR(plane(-1, -1, -2, 18))
c3 <- hfR(plane(-10, -4, -5, 100))

s1 <- c1 - !c2 - ! c3

bbox <- c(-.1, -.1, -.1, 30, 30, 30)
res <- 150

clear3d()

hfp(axis1, bbox=bbox, density=res,
    color="black", specular="black")
hfp(axis2, bbox=bbox, density=res,
    color="black", specular="black")
hfp(axis3, bbox=bbox, density=res,
    color="black", specular="black")

hfp(c1, bbox=bbox, density=res,
    color="red", alpha=.3, specular="black")
hfp(c2, bbox=bbox, density=res,
    color="blue", alpha=.3, specular="black")
hfp(c3, bbox=bbox, density=res,
    color="green", alpha=.3, specular="black")

hfp(s1, bbox=bbox, density=res,
    color="white", specular="black")

text3d(0, 0, 31, "Z")
text3d(0, 31, 0, "Y")
text3d(31, 0, 0, "X")
