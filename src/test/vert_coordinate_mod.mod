V27 0x4 vert_coordinate_mod
19 vert_coordinate.f90 S582 0
04/03/2020  13:41:31
enduse
D 56 21 8 1 3 13 0 0 1 0 0
 0 12 3 3 13 13
D 59 21 8 1 3 15 0 0 1 0 0
 0 14 3 3 15 15
S 582 24 0 0 0 8 1 0 4658 10005 0 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 vert_coordinate_mod
S 583 23 5 0 0 0 590 582 4678 0 0 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 compute_vert_coord
S 584 1 3 1 0 8 1 583 4697 4 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ztop
S 585 1 3 1 0 8 1 583 4702 4 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 zbottom
S 586 6 3 1 0 6 1 583 4710 800004 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nz
S 587 1 3 1 0 28 1 583 4713 4 43000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 grid_dz
S 588 7 3 2 0 56 1 583 4721 800204 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_full
S 589 7 3 2 0 59 1 583 4728 800204 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_half
S 590 14 5 0 0 0 1 583 4678 200 400000 A 0 0 0 0 0 0 0 2 6 0 0 0 0 0 0 0 0 0 0 0 0 3 0 582 0 0 0 0 compute_vert_coord
F 590 6 584 585 586 587 588 589
S 591 6 1 0 0 6 1 583 4735 40800006 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_12
S 592 6 1 0 0 6 1 583 4742 40800006 3000 A 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_14
A 12 1 0 0 0 6 586 0 0 0 0 0 0 0 0 0 0 0 0 0
A 13 1 0 0 0 6 591 0 0 0 0 0 0 0 0 0 0 0 0 0
A 14 4 0 0 0 6 12 0 3 0 0 0 0 1 0 0 0 0 0 0
A 15 1 0 0 0 6 592 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
Z
