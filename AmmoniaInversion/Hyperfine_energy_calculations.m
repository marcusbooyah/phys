%Michael Evans
%4/22/2015
%Hyperfine energy NH3 Inversion

clear all;
close all;
format short;

I = 1; % for Nitrogen-14, I = 1;
fullJ = [1;2;3;5;6;7;5;4;6;3;13]; % J values
fullK = [1;2;3;5;6;7;3;3;3;2;10]; % K values
J = [1;2;3]; % J values
K = [1;2;3]; % K values

%Einitial = energylevel(3,3,3); %energy level of J=3 K=3 and F=J
%Efinal = energylevel(3,3,2); %energy level of J=3 K=3 and F=J-1

%dE = energytransition(J(1),K(1),J(1),J(1));
dFrequency = zeros(3,length(J));
for i = 1:length(J)
    dFrequency(i,1) = energytransition(J(i), K(i), J(i) - 1,     J(i)       ); % ?F=+1
    dFrequency(i,2) = energytransition(J(i), K(i), J(i) + 1,     J(i)       ); % ?F=-1
    dFrequency(i,3) = energytransition(J(i), K(i), J(i),         J(i)       ); % ?F=0
    dFrequency(i,4) = energytransition(J(i), K(i), J(i),         J(i) + 1   ); % ?F=+1
    dFrequency(i,5) = energytransition(J(i), K(i), J(i),         J(i) - 1   ); % ?F=-1
end
format long;
absFrequency(1,:) = round((100*(dFrequency(1,:) + 23694.4)))/100
absFrequency(2,:) = round((100*(dFrequency(2,:) + 23722.6)))/100
absFrequency(3,:) = round((100*(dFrequency(3,:) + 23870.1)))/100
% OUTPUT
% absFrequency =
% 
%    1.0e+04 *
% 
%    2.369287   2.369378800000000   2.369440000000000   2.369501200000000   2.369593000000000
%    2.372056   2.372128857142857   2.372260000000000   2.372391142857143   2.372464000000000
%    2.386780   2.386840000000000   2.387010000000000   2.387180000000000   2.387239500000000

