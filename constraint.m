%% Constraint Matrix
function C = constraint(q, i_v, time)
v_phi = variable_phi(-1, time);
    
    C = [q(1) - (i_v(1)/2)*cos(v_phi)
         q(2) - (i_v(1)/2)*sin(v_phi)
         q(1) + (i_v(1)/2)*cos(v_phi) - q(4) + (i_v(2)/2)*cos(q(6))
         q(2) + (i_v(1)/2)*sin(v_phi) - q(5) + (i_v(2)/2)*sin(q(6))
         q(4) + (i_v(2)/2)*cos(q(6)) - q(7) 
         q(5) + (i_v(2)/2)*sin(q(6))
         q(8)
         q(9)
     ];

end