%% Jacobian Matrix
function Cq = constraint_dq(q, i_v, time)
v_phi = variable_phi(-1, time);

    Cq = [1    0     (i_v(1)/2)*sin(v_phi)    0    0    0                       0     0   0 
          0    1     (i_v(1)/2)*cos(v_phi)    0    0    0                       0     0   0
          1    0    -(i_v(1)/2)*sin(v_phi)   -1    0   -(i_v(2)/2)*sin(q(6))    0     0   0
          0    1     (i_v(1)/2)*cos(v_phi)    0   -1    (i_v(2)/2)*cos(q(6))    0     0   0
          0    0     0                        1    0   -(i_v(2)/2)*sin(q(6))   -1     0   0
          0    0     0                        0    1    (i_v(2)/2)*cos(q(6))    0     0   0
          0    0     0                        0    0    0                       0     0   0
          0    0     0                        0    0    0                       0     0   0

     ];

end