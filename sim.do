vsim B_Controle

add wave *

force ck 0 0, 1 1 -repeat 2
force sa 0 0 
force sv 0 0
force tc 0 0, 1 6, 0 8
force tb 0 0, 1 14, 0 16

run 20