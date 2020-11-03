clc; clear; close all;

n = 15;
Nodes = node.empty(0,n);
duongdays = duongday.empty(0,n-1);

% Nhap thong so cua nut
Nodes(1).name = 1; Nodes(1).P = 4; Nodes(1).cosphi = 0.85; Nodes(1).Udm = 22;  Nodes(1).PV = 2;
Nodes(2).name = 2; Nodes(2).P = 6; Nodes(2).cosphi = 0.85; Nodes(2).Udm = 22;  Nodes(2).PV = 3;
Nodes(3).name = 3; Nodes(3).P = 7; Nodes(3).cosphi = 0.85; Nodes(3).Udm = 22; Nodes(3).PV = 3;
Nodes(4).name = 4; Nodes(4).P = 3; Nodes(4).cosphi = 0.85; Nodes(4).Udm = 22;  Nodes(4).PV = 2;
Nodes(5).name = 5; Nodes(5).P = 8; Nodes(5).cosphi = 0.85; Nodes(5).Udm = 22; Nodes(5).PV = 2;
Nodes(6).name = 6; Nodes(6).P = 9; Nodes(6).cosphi = 0.85; Nodes(6).Udm = 22;  Nodes(6).PV = 2;
Nodes(7).name = 7; Nodes(7).P = 10; Nodes(7).cosphi = 0.85; Nodes(7).Udm = 22;  Nodes(7).PV = 2;
Nodes(8).name = 8; Nodes(8).P = 5; Nodes(8).cosphi = 0.85; Nodes(8).Udm = 22;  Nodes(8).PV = 2;
Nodes(9).name = 9; Nodes(9).P = 7; Nodes(9).cosphi = 0.85; Nodes(9).Udm = 22; Nodes(9).PV = 2;
Nodes(10).name = 10; Nodes(10).P = 6; Nodes(10).cosphi = 0.85; Nodes(10).Udm = 22; Nodes(10).PV = 2;
Nodes(11).name = 11; Nodes(11).P = 2; Nodes(11).cosphi = 0.85; Nodes(11).Udm = 22; Nodes(11).PV = 2;
Nodes(12).name = 12; Nodes(12).P = 5; Nodes(12).cosphi = 0.85; Nodes(12).Udm = 22;  Nodes(12).PV = 2;
Nodes(13).name = 13; Nodes(13).P = 7; Nodes(13).cosphi = 0.85; Nodes(13).Udm = 22;  Nodes(13).PV = 2;
Nodes(14).name = 14; Nodes(14).P = 8; Nodes(14).cosphi = 0.85; Nodes(14).Udm = 22;  Nodes(14).PV = 2;
Nodes(15).name = 15; Nodes(15).P = 8; Nodes(15).cosphi = 0.85; Nodes(15).Udm = 22; Nodes(15).PV = 2;


% Nhap thong so duong day
duongdays(1).nut = [1, 3]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).dai = 15;
duongdays(2).nut = [3, 4]; duongdays(2).R = 0.01; duongdays(2).L = 0.02; duongdays(2).X = 0.015; duongdays(2).dai = 15;
duongdays(3).nut = [4, 9]; duongdays(3).R = 0.01; duongdays(3).L = 0.02; duongdays(3).X = 0.015; duongdays(3).dai = 15;
duongdays(4).nut = [9, 10]; duongdays(4).R = 0.01; duongdays(4).L = 0.02; duongdays(4).X = 0.015; duongdays(4).dai = 15;
duongdays(5).nut = [9, 14]; duongdays(5).R = 0.01; duongdays(5).L = 0.02; duongdays(5).X = 0.015; duongdays(5).dai = 15;
duongdays(6).nut = [1, 2]; duongdays(6).R = 0.01; duongdays(6).L = 0.02; duongdays(6).X = 0.015; duongdays(6).dai = 15;
duongdays(7).nut = [2, 6]; duongdays(7).R = 0.01; duongdays(7).L = 0.02; duongdays(7).X = 0.015; duongdays(7).dai = 15;
duongdays(8).nut = [6, 5]; duongdays(8).R = 0.01; duongdays(8).L = 0.02; duongdays(8).X = 0.015; duongdays(8).dai = 15;
duongdays(9).nut = [6, 7]; duongdays(9).R = 0.01; duongdays(9).L = 0.02; duongdays(9).X = 0.015; duongdays(9).dai = 15;
duongdays(10).nut = [7, 11]; duongdays(10).R = 0.01; duongdays(10).L = 0.02; duongdays(10).X = 0.015; duongdays(10).dai = 15;
duongdays(11).nut = [5, 8]; duongdays(11).R = 0.01; duongdays(11).L = 0.02; duongdays(11).X = 0.015; duongdays(11).dai = 15;
duongdays(12).nut = [8, 12]; duongdays(12).R = 0.01; duongdays(12).L = 0.02; duongdays(12).X = 0.015; duongdays(12).dai = 15;
duongdays(13).nut = [8, 13]; duongdays(13).R = 0.01; duongdays(13).L = 0.02; duongdays(13).X = 0.015; duongdays(13).dai = 15;
duongdays(14).nut = [13, 15]; duongdays(14).R = 0.01; duongdays(14).L = 0.02; duongdays(14).X = 0.015; duongdays(14).dai = 15;

% Tinh Q I cua nut
for nut = 1:n
   Nodes(nut).Q = Nodes(nut).P/(1 + Nodes(nut).cosphi*Nodes(nut).cosphi);
   Nodes(nut).Idm = Nodes(nut).P/(sqrt(3)*Nodes(nut).Udm*Nodes(nut).cosphi);
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



















