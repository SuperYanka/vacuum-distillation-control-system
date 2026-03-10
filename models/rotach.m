function Wrg = rotach(Wo, k, Ti, M)

    Wrg = k*tf([Ti 1], [Ti 0]);
    strcat('k = ', num2str(k), ' Ti = ', num2str(Ti), ' k/Ti = ', num2str(k / Ti))
    W = minreal(Wo*Wrg);

    fr = logspace(-1, 2, 80);
    resp = squeeze(freqresp(W, fr));
    plot(real(resp), imag(resp)); 
    hold on;

    mx = M^2/(M^2 - 1);
    mr = M/(M^2 - 1);
    circus(-mx, 0, mr) 

    axis equal
    axis ([-mx 0.2 -mr-0.2 0.2])
    grid on
    hold off
    set (gcf, 'Visible', 'off', 'Visible','on')

    function circus(x, y, r)
        t = linspace(0, 2 * pi, 100); 
        cx = x + r * cos(t); 
        cy = y + r * sin(t); 
        plot(cx, cy); 
    end
end