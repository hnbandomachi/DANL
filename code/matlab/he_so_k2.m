clc; clear; close all;

n = 15;     % So luong nut
% Khoi tao nut va duong day
Nodes = node.empty(0,n);
duongdays = duongday.empty(0,n-1);

% Nhap thong so MA
Udm_cao = 110; Udm_ha = 22; U_cao = Udm_cao; U_ha = Udm_ha; kT = U_cao/U_ha; Upa = Udm_cao;
U_N = 10; P_N = 18; Sdm = 25;

% Tinh RT XT cua MBA
XT = U_N/100*Udm_cao*Udm_cao/Sdm/5;
RT = P_N*Udm_cao*Udm_cao/Sdm/Sdm/1000/5;

% Ma tran kiem chung ket_qua
ket_qua = [];

% Nhap thong so cua nut P = 2000 -3000        PV = >100
Nodes(1).name = 1; Nodes(1).Ptai = 3400; Nodes(1).Q = 1030;        Nodes(1).Udm = 22;  Nodes(1).PV =  2800;
Nodes(2).name = 2; Nodes(2).Ptai = 3600; Nodes(2).Q = 1090;        Nodes(2).Udm = 22;  Nodes(2).PV = 2800;
Nodes(3).name = 3; Nodes(3).Ptai = 3700; Nodes(3).Q = 1040;        Nodes(3).Udm = 22;  Nodes(3).PV = 2820;
Nodes(4).name = 4; Nodes(4).Ptai = 3300; Nodes(4).Q = 1020;        Nodes(4).Udm = 22;  Nodes(4).PV = 2860;
Nodes(5).name = 5; Nodes(5).Ptai = 3800; Nodes(5).Q = 1000;        Nodes(5).Udm = 22;  Nodes(5).PV = 2700;
Nodes(6).name = 6; Nodes(6).Ptai = 3900; Nodes(6).Q = 1060;        Nodes(6).Udm = 22;  Nodes(6).PV = 2700;
Nodes(7).name = 7; Nodes(7).Ptai = 3000; Nodes(7).Q = 1020;        Nodes(7).Udm = 22;  Nodes(7).PV = 2840;
Nodes(8).name = 8; Nodes(8).Ptai = 3500; Nodes(8).Q = 1030;        Nodes(8).Udm = 22;  Nodes(8).PV = 2700;
Nodes(9).name = 9; Nodes(9).Ptai = 3700; Nodes(9).Q = 1050;        Nodes(9).Udm = 22;  Nodes(9).PV = 2840;
Nodes(10).name = 10; Nodes(10).Ptai = 3600; Nodes(10).Q = 1030;    Nodes(10).Udm = 22; Nodes(10).PV = 2800;
Nodes(11).name = 11; Nodes(11).Ptai = 3200; Nodes(11).Q = 1010;    Nodes(11).Udm = 22; Nodes(11).PV = 2840;
Nodes(12).name = 12; Nodes(12).Ptai = 3500; Nodes(12).Q = 1040;    Nodes(12).Udm = 22; Nodes(12).PV = 2700;
Nodes(13).name = 13; Nodes(13).Ptai = 3700; Nodes(13).Q = 980;    Nodes(13).Udm = 22; Nodes(13).PV = 2700;
Nodes(14).name = 14; Nodes(14).Ptai = 3800; Nodes(14).Q = 1000;    Nodes(14).Udm = 22; Nodes(14).PV = 2700;
Nodes(15).name = 15; Nodes(15).Ptai = 3800; Nodes(15).Q = 1000;    Nodes(15).Udm = 22; Nodes(15).PV = 2700;


% Nhap thong so duong day
duongdays(1).nut = [1, 3]; duongdays(1).R = 0.072; duongdays(1).L = 0.32; duongdays(1).X = 0.0; duongdays(1).dai = 2;
duongdays(2).nut = [3, 4]; duongdays(2).R = 0.072; duongdays(2).L = 0.32; duongdays(2).X = 0.0; duongdays(2).dai = 2;
duongdays(3).nut = [4, 9]; duongdays(3).R = 0.072; duongdays(3).L = 0.32; duongdays(3).X = 0.0; duongdays(3).dai = 2;
duongdays(4).nut = [9, 10]; duongdays(4).R = 0.072; duongdays(4).L = 0.32; duongdays(4).X = 0.0; duongdays(4).dai = 2;
duongdays(5).nut = [9, 14]; duongdays(5).R = 0.072; duongdays(5).L = 0.32; duongdays(5).X = 0.0; duongdays(5).dai = 2;
duongdays(6).nut = [1, 2]; duongdays(6).R = 0.072; duongdays(6).L = 0.32; duongdays(6).X = 0.0; duongdays(6).dai = 2;
duongdays(7).nut = [2, 6]; duongdays(7).R = 0.072; duongdays(7).L = 0.32; duongdays(7).X = 0.0; duongdays(7).dai = 2;
duongdays(8).nut = [6, 5]; duongdays(8).R = 0.072; duongdays(8).L = 0.32; duongdays(8).X = 0.0; duongdays(8).dai = 2;
duongdays(9).nut = [6, 7]; duongdays(9).R = 0.072; duongdays(9).L = 0.32; duongdays(9).X = 0.0; duongdays(9).dai = 2;
duongdays(10).nut = [7, 11]; duongdays(10).R = 0.072; duongdays(10).L = 0.32; duongdays(10).X = 0.0; duongdays(10).dai = 2;
duongdays(11).nut = [5, 8]; duongdays(11).R = 0.072; duongdays(11).L = 0.32; duongdays(11).X = 0.0; duongdays(11).dai = 2;
duongdays(12).nut = [8, 12]; duongdays(12).R = 0.072; duongdays(12).L = 0.32; duongdays(12).X = 0.0; duongdays(12).dai = 2;
duongdays(13).nut = [8, 13]; duongdays(13).R = 0.072; duongdays(13).L = 0.32; duongdays(13).X = 0.0; duongdays(13).dai = 2;
duongdays(14).nut = [13, 15]; duongdays(14).R = 0.072; duongdays(14).L = 0.32; duongdays(14).X = 0.0; duongdays(14).dai = 2;

U = [];

row = 0;
for dochieu = 0:0.1:1
    dochieu
%     Pnut = Nodes(12).P
%     cosphi = Nodes(12).cosphi
%     dongday = duongdays(6).I
    row = row + 1; col = 0;  
    
    for nT = 9:-1:-9        
        col = col + 1;
        
        
        % Tinh P, I, cosphi cua nut
        for nut = 1:n
%            Nodes(nut).Q = (Nodes(nut).P - Nodes(nut).PV*dochieu)/(1 + Nodes(nut).cosphi*Nodes(nut).cosphi);
           Nodes(nut).P = Nodes(nut).Ptai - Nodes(nut).PV*dochieu; 
           
           Nodes(nut).cosphi = (Nodes(nut).P)/sqrt((Nodes(nut).P)^2 + (Nodes(nut).Q)^2);
%            cosphi = Nodes(nut).cosphi
           Nodes(nut).Idm = (Nodes(nut).P)/(sqrt(3)*Nodes(nut).Udm*Nodes(nut).cosphi);
        end
        
        
        % Tinh nut trai va phai cua day
        nut_trai = [];
        nut_phai = [];
        for i = 1 : n-1
            nut_trai(length(nut_trai)+1) = duongdays(i).nut(1); 
            nut_phai(length(nut_phai)+1) = duongdays(i).nut(2); 
        end
        

        % Tinh bac 1 cua nut
        for nut = 1 : n
            warn = false;
            for day = 1 : n -1
                if nut == nut_trai(day)
                   warn = true; 
                end
            end
            if warn == false
                Nodes(nut).bac = 1;
            end
        end
        
            
        % Tinh bac 1 cua day
        for day = 1 : n-1
           if Nodes(duongdays(day).nut(2)).bac == 1
               duongdays(day).bac = 1;
           end
        end
        

        % Tinh dong day bac 1
        for day = 1 : n-1
           if duongdays(day).bac == 1
               duongdays(day).I = Nodes(duongdays(day).nut(2)).Idm;     
           end
        end
        

        % Tinh dong day
        for chay = 1:(n-1)*1
           for day = 1:n-1
                duongdays(day).I = Nodes(duongdays(day).nut(2)).Idm; 
                phai = duongdays(day).nut(2);
                for i = 1:n-1
                  if phai == duongdays(i).nut(1)
                      if duongdays(i).I > 0
                         duongdays(day).I = duongdays(day).I + duongdays(i).I; 
                      end
                  end
                end      
           end
        end


        % Tinh sut ap va P,Q roi tren tung doan day
        for day = 1 : n-1
        %    deltaU = duongdays(day).delta;
           I = duongdays(day).I/1000;       % doi sang kA
           R = duongdays(day).R*duongdays(day).dai;
           zL = duongdays(day).L*duongdays(day).dai;
           zX = duongdays(day).X*duongdays(day).dai;
           duongdays(day).deltaU = I*sqrt(R*R + (zL-zX)*(zL-zX));
           duongdays(day).P = I*I*R*1000;
           duongdays(day).Q = I*I*zL*1000;
        end
        
        % Tinh tong PL va QL
        PL = 0; QL = 0;
        for i = 1 : n
            PL = PL + Nodes(i).P;
            QL = QL + Nodes(i).Q;
        end
        
        for i = 1 : (n-1)
            PL = PL + duongdays(i).P;
            QL = QL + duongdays(i).Q;
        end
        
        % Tinh Upa => Uha
        PT = PL + RT*(PL*PL + QL*QL)/110/110/1000;
        QT = QL + XT*(PL*PL + QL*QL)/110/110/1000;
        Udm_cao = sqrt((U_cao - 1/110*PT*RT/1000-1/110*QT*XT/1000)^2 + (1/110*PT*RT/1000-1/110*QT*XT/1000)^2);        
        Upa = Udm_cao*(1+ nT*0.0178);
        kT = Upa/Udm_ha;
        U_ha = Udm_cao/kT;

        % Tinh lai Udm tai cac nut va cho Udm = U_ha
        for i = 1:n
           Nodes(i).U = U_ha; 
        end        

        % Tinh dien ap tai cac nut
        for chay = 1:n
            % Xet day co nut 1 la nut trai -> tinh nut phai cua day do
            for day = 1:n-1
                if Nodes(duongdays(day).nut(1)).U < U_ha || duongdays(day).nut(1) == 1
                    Nodes(duongdays(day).nut(2)).U = Nodes(duongdays(day).nut(1)).U - duongdays(day).deltaU;
                end
            end

        end

        % Tinh phan tram sut ap lon nhat va nho nhat: maxDrop, minDrop
        maxDrop = 0;
        minDrop = 100;
        for i = 1:n 
            if(maxDrop < abs((Nodes(i).U - Udm_ha)/Udm_ha)*100)
                maxDrop = abs((Nodes(i).U - Udm_ha)/Udm_ha)*100;
            end            
        end
        
        if (maxDrop < 5)
            ket_qua(row, col) = 1;            
        else
            ket_qua(row, col) = 0;
        end
        
    end
    
    for kU = 1:n
        U(kU,row) = Nodes(kU).U; 
    end
    
end
ket_qua

num1 = 0; num1_max = 0; dauphanap = 0;
for col = 1 : size(ket_qua, 2)
    for row = 1 : size(ket_qua, 1)
        if ket_qua(row, col) == 1
            num1 = num1 + 1;
        end
    end
    if num1 > num1_max
        num1_max = num1;
        dauphanap = 10 - col;
    end
end

disp('Ban nen chon dau phan ap so: ');
disp(dauphanap);