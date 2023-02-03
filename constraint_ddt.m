function Ctt = constraint_ddt(i_v, time)
v_phi = variable_phi(-1, time);

    Ctt = [-(i_v(1)/2)*cos(v_phi)
           -(i_v(1)/2)*sin(v_phi)
           -(i_v(1)/2)*cos(v_phi)
           -(i_v(1)/2)*sin(v_phi)  
           -(i_v(1)/2)*cos(v_phi)
            0   
            0
            0
     ];

end