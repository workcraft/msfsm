# STG file generated by Workcraft 3 (Return of the Hazard), version 3.2.0
.model dining_philosophers_5
.internal t0 t1 t2 t3 t4 t5 t6 t7 t9 t8
.graph
t0 p0 p2
t1 p1
t2 p2 p4
t3 p3
t4 p4 p6
t5 p5
t6 p6 p8
t7 p7
t9 p9
t8 p0 p8
p2 t1 t3
p1 t0
p0 t1 t9
p4 t3 t5
p3 t2
p5 t4
p6 t5 t7
p8 t7 t9
p7 t6
p9 t8
.marking {p1 p4 p7}
.end
