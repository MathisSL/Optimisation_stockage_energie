function VecL = calculate_volume(x,Vend)
    % Variables
    load('dataCESI.mat','ECS')
    Te = 10*60; % en s
    rho = 1000; % en Kg/m3
    C = 4185; % j/Kg
    Ti = 10; % T eau froide
    Tf = 60; % T eau chaude
    phi = 1500;
    C_Te = phi * Te / (rho*C*(Tf-Ti));
    x=x';
    Vend;
    VecL = zeros(144,1); % Initialisation du vecteur du volume d'eau chaude pour lundi
    VecL(1) = Vend; % m3 
    ECSL = ECS(1:144); 

% Calcul du volume d'eau chaude dans le ballon
    VecL_D = x*C_Te - ECSL; % Le delta Vec
    VecL_D(1) = VecL(1); % Initialisation du 1er élément du vecteur Vec afin qu'il soit plein au début
    VecL = cumsum(VecL_D); % Vec = 0,150 + Vec chauffé - la conso
end