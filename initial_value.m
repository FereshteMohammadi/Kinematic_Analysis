function i_v = initial_value()

    i_v = zeros(4,1);
    i_v(1,1) = input("length of the crank: ");          %0.1(m)  
    i_v(2,1) = input("length of the link: ");          %0.2(m)
    i_v(3,1) = input("Omega: ");      %-1(rad/s)
    i_v(4,1) = input("Initial phi: ");      %deg2rad(30); %rad
    i_v(5,1) = input("Initial time: ");
    i_v(6,1) = input("Final time: ");   
    i_v(7,1) = input("Number of time steps: ");
end