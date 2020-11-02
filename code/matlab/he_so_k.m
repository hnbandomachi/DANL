clc; clear;

n = 2;
Nodes = node.empty(0,n);
duongdays = duongday.empty(0,n-1);
% n = input('Nhap so luong so cua he thong: n = ');
% 
for i = 1:n    
    disp(strcat('Nhap gia tri nut - ', num2str(i)));
    Nodes(i).P = input('P = ');
    Nodes(i).Q = input('Q = ');
    Nodes(i).cosphi = input('cosphi = ');
    Nodes(i).PV = input('PV = ');    
end


disp('Nhap thong so cua day')
for i = 1:n-1
    disp(strcat('Day thu -', num2str(i)));
    duongdays(i).nut = input('Nut trai va nut phai: ');
    duongdays(i).R = input('R(ohm/km) = ');
    duongdays(i).L = input('L(ohm/km) = ');
    duongdays(i).X = input('X(ohm/km) = ');
    duongdays(i).dai = input('chieu dai(km) = ');
    
end

% s = node;
% s.P = 10;
% s.Q = 20;
% s.line = 'L05';
% s.degree = 3;


