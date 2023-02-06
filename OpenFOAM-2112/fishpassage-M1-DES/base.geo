dx = 0.06;

originx = -18.5;
originy = 0.0 + (-0.69+0.21)*(originx+18.5)/(17.98+19.01);
originz = -4.6;

lx = 17.5 - originx;
ly = 2.3 + (-0.69+0.21)*(originx+18.5)/(17.98+19.01) - originy;
lz = 4.6 - originz;

Point(1) = {originx, originy, originz};

Extrude {0, ly, 0} {
  Point{1}; Layers{ly/dx}; Recombine;
}

Extrude {lx, (-0.69+0.21)*lx/(17.98+19.01), 0} {
  Line{1}; Layers{lx/dx}; Recombine;
}

Extrude {0, 0, lz} {
  Surface{5}; Layers{lz/dx}; Recombine;
}

Coherence;

Physical Surface("inlet") = {14};
Physical Surface("outlet") = {22};
Physical Surface("atmosphere") = {18};
Physical Surface("sides") = {5,26,27};
Physical Volume(135) = {1};
Coherence;
