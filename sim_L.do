vsim Lab_10

add wave *

force ck 0 0, 1 1 -repeat 2
force clr 0 0
force SW0 0 0, 1 2, 0 80, 1 180, 0 400, 1 500
force SW1 0 0, 1 2, 0 140, 1 200, 0 400, 1 500

run 600
