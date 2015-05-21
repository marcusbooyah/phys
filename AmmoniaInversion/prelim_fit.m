% Marcus Bowyer
%
% find linear least square fit for ammonia inversion 
% spectrum data

clear all;
format long;
J = [1;2;3;5;6;7;5;4;6;3;13]; % J values
K = [1;2;3;5;6;7;3;3;3;2;10]; % K values

% A is the matrix such that Ax=B
% B is the matrix containing our measurements
% x will be the matrix containing the coefficients v0,c1,c2,c3,c4,c5 for 
% v_inv = v0 - c1 J(J+1) + c2 K^2 + c3 (J(J+1))^2 - c4 J(J+1)K^2 + c5 K^4
A = ones(11,6);
a1 = J.*(J+1);
a2 = K.^2;
a3 = (J.*(J+1)).^2;
a4 = J.*(J+1).*K.^2;
a5 = K.^4;
A(:,2) = a1;
A(:,3) = a2;
A(:,4) = a3;
A(:,5) = a4;
A(:,6) = a5;
b = [23694.4;23722.6;23870.1;
    24532.9;25056.0;25715.1;
    21285.3;22688.2;19757.6;
    22834.1;18178.0];
% u is the uncertainty, w is the weighted matrix.
u = [0.9,1.1,1.0,0.9,0.8,1.2,0.9,0.9,1.0,0.8,1.0]

w = diag(1./u.^2,0);
% calculate constants v0,c1,c2,c3,c4,c5 including uncertainty
x = inv(transpose(A)*w*A)*transpose(A)*w*b
M = inv(transpose(A)*w*A);
uncert = diag(M)
% OUTPUT

% x =
% 
%    1.0e+04 *
% 
%    2.378762084511574
%   -0.015214506179679
%    0.021220069086984
%    0.000051605061177
%   -0.000143241318608
%    0.000098369694108