function [c, ceq] = mycon(x,Vend)
    Te = 10*60; % en s
    rho = 1000; % en Kg/m3
    C = 4185; % j/Kg
    Ti = 10; % T eau froide
    Tf = 60; % T eau chaude
    phi = 1500;
    C_Te = phi * Te / (rho*C*(Tf-Ti));
    % Calculer le volume du ballon d'eau en fonction des variables de décision
    VecL = calculate_volume(x,Vend);
    
    % Bornes du volume du ballon d'eau
    V_min = zeros(144,1);
    V_max = zeros(144,1);
    V_min(1:144) = 0.04;
    V_max(1:144) = 0.150-C_Te;
    
    % Contrainte d'inégalité : Vec doit être compris entre V_min et V_max
    c = [V_min - VecL; VecL - V_max];
    
    % Pas de contrainte d'égalité
    ceq = [];
end