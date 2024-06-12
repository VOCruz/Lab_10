vsim Coracao

add wave *

force ck 0 0, 1 1 -repeat 2
force clr 0 0, 0 2
force SW0 1 0, 0 200, 1 340
force SW1 1 0, 0 260, 1 380
force pa 0 0, 0 210, 0 212
force pv 0 0, 0 280, 0 282

run 500