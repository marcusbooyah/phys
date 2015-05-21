% Marcus Bowyer
% Phys 432
% Rb pumping

clear all;
A = [296.9,268.3,241.2,212.9,184.3,155.5,127.5,99.5,74.2];
A = [A;A;A;A;A;A;A;A;A]
b = linspace(-3,1,9);

% measured frequencies for Rb 85
%f = [296.9;268.3;241.2;212.9;184.3;155.5;127.5;99.5;74.2];
f = ones(9,1);

b1 = f;
a = [b'];


x = linprog(f,A,b)
y1 = polyfit(a, b1, 1) % gives offset where Fres is 0 and the frequency for Rb85
%y2 = polyfit(a, b2, 1) % gives offset where Fres is 0 and the frequency for Rb87