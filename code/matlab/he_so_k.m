clc; clear;

% n = 2;
% Nodes = node.empty(0,n);
% duongdays = duongday.empty(0,n-1);
% % n = input('Nhap so luong so cua he thong: n = ');
% % 
% for i = 1:n    
%     disp(strcat('Nhap gia tri nut - ', num2str(i)));
%     Nodes(i).P = input('P = ');
%     Nodes(i).Q = input('Q = ');
%     Nodes(i).cosphi = input('cosphi = ');
%     Nodes(i).PV = input('PV = ');    
% end
% 
% 
% disp('Nhap thong so cua day')
% for i = 1:n-1
%     disp(strcat('Day thu -', num2str(i)));
%     duongdays(i).nut = input('Nut trai va nut phai: ');
%     duongdays(i).R = input('R(ohm/km) = ');
%     duongdays(i).L = input('L(ohm/km) = ');
%     duongdays(i).X = input('X(ohm/km) = ');
%     duongdays(i).dai = input('chieu dai(km) = ');
%     
% end

n = 15;
Nodes = node.empty(0,n);
duongdays = duongday.empty(0,n-1);
tempNutDuongday = randperm(n);
for i = 1: n-2
    tempNutDuongday(size(tempNutDuongday,2)+1) = int8(rand()*n);
end

NutForFindMost = [];



for i = 1:n    
%     disp(strcat('Nhap gia tri nut - ', num2str(i)));
    Nodes(i).name = i;
    Nodes(i).P = 1*rand();
    Nodes(i).Q = 1*rand();
    Nodes(i).cosphi = 1*rand();
    Nodes(i).PV = 0.1*rand();    
end

for i = 1:n-1
%     disp(strcat('Day thu -', num2str(i)));  
    
    duongdays(i).nut = [tempNutDuongday(i), tempNutDuongday(i+1)];
    NutForFindMost(size(NutForFindMost,2)+1) = duongdays(i).nut(1);
    NutForFindMost(size(NutForFindMost,2)+1) = duongdays(i).nut(2);
    duongdays(i).R = 0.01*rand();
    duongdays(i).L = 0.01*rand();
    duongdays(i).X = 0.01*rand();
    duongdays(i).dai =  int16(rand()*50);
    
end

% Find the node containing the most line
mostNode1 = 0;
mostNode2 = 0;
for i = 1:length(NutForFindMost)
    temp = NutForFindMost(i);
    for j = 1:length(NutForFindMost)
        if temp == NutForFindMost(j)
            mostNode1 = mostNode1 + 1;
        end
    end
    
    if mostNode1 > mostNode2
        mostNode2 = mostNode1;        
    end
    mostNode1 = 0;
    
end

% Calculating the current on the line
for i = 1:mostNode2
        
end

% s = node;
% s.P = 10;
% s.Q = 20;
% s.line = 'L05';
% s.degree = 3;


