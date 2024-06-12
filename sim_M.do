vsim Marcapasso

add wave *

force ck 0 0, 1 1 -repeat 2
force clr 0 0
force sa 0 0
force sv 0 0

run 500
