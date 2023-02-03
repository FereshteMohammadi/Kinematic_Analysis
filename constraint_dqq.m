%% Jacobian Matrix
function Cqq = constraint_dqq(Q, dQ, i_v, time)
v_phi = variable_phi(-1, time);

    Cqq = [0    0    (i_v(1)/2)*dQ*sin(v_phi)   0   0    0                          0     0   0 
           0    0    (i_v(1)/2)*dQ*cos(v_phi)   0   0    0                          0     0   0
           0    0   -(i_v(1)/2)*dQ*sin(v_phi)   0   0   -(i_v(2)/2)*dQ*sin(Q)    0     0   0
           0    0    (i_v(1)/2)*dQ*cos(v_phi)   0   0    (i_v(2)/2)*dQ*cos(Q)    0     0   0
           0    0    0                          0   0   -(i_v(2)/2)*dQ*sin(Q)    0     0   0
           0    0    0                          0   0    (i_v(2)/2)*dQ*cos(Q)    0     0   0
           0    0    0                          0   0    0                          0     0   0
           0    0    0                          0   0    0                          0     0   0

     ];

end