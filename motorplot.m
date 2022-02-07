function motorplot(Io,So,Is,Ts,V)
%MOTORPLOT creates a plot of a brushed dc motor characteristics curves
%  It creates a plot containing
%  Speed, Current, Mechanical Power, Efficiency VS Torque
% 
%  Usage user can input selected motor specs and if void 
%  standard argements are used.
%

    arguments % Default args if void
    Io double = 0.18 % No-Load current (A)
    So double = 11646 % No-Load Speed (rpm)
    Is double = 5.55 % Stall current (A)
    Ts double = 51.3 % Stall Torque (mNm)
    V double = 12 % Voltage (V)
    end
    
    close % Closes the current Figure

    R = 12/Is; % Resistance between the terminals (Ohm)
    SMslope = -So/Ts; % Speed/Torque Slope (Rpm/mNm)
    km = Ts/Is; % Torque Constant (mNm/A)
    Ts = -So/SMslope; % Stall Torque (mNm)
    Is = 1/km*Ts; % Stall Current
    FL = km*Io; % Friction Loss (mNm)

    T = [-FL,0,Ts]; % Known Torques
    I = [0,Io,Is];  % Known Currents
    S = [nan,So,0]; % Known Speeds

    Tq = -FL:0.01:Ts; % Torque Sample Size
    Iq = interp1(T,I,Tq);
    Sq = interp1(T,S,Tq);

    Pi = V*Iq; % Power in (W)
    Po = Tq.*Sq*2*pi/(60000); % Power out (W)
    Eff = Po./Pi*100; % Efficiency (%)
    T = -FL:0.001:Ts; % Current Domain (A)
    I = 1/km*(T+FL); % Torque Function (mNm)
    S = SMslope*T+So; % Speed Function (rpm)

    figure
    set(gcf,'Color','w')
    plot(Tq,Sq, 'color','#0072BD','linewidth',2)
    set(gca,'Color','none')
    set(gca,'YColor','#0072BD','linewidth',2)
    set(gca,'YMinorTick',1);
    addaxislabel(1,'Speed (rpm)')

    addaxis(Tq,Iq,'color', '#D95319','linewidth',2);
    addaxislabel(2,'Current (A)')

    addaxis(Tq,Po, 'color', '#7E2F8E','linewidth',2)
    addaxislabel(3,'Mechanical Power (W)')

    AddAxisLeft(Tq,Eff,[0,100],'color','#77AC30','linewidth',2)
    addaxislabel(4,'Efficiency (%)')

    xline(0,'linewidth',2)
    xlim([-FL,Ts])
    xlabel('Torque (mNm)')
    title('Motor Characteristic Curves')
    
end