function j_d = variable_phi(omega, t)

    j_d = zeros(length(t),1);

    for i =1:length(t)
        j_d(i,1) = omega*t(i) +pi/6;
    end

end
