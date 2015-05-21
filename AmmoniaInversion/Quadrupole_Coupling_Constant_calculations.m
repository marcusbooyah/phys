%%Michael Evans
%4/22/2015
%quadrupole coupling constant calculations


clear all;
close all;


HyperfineAbsFrequency = [23693.1, 23693.9, 23694.9, 23695.4;
                    23721.1, 23721.3, 23723.9, 23724.7;
                    23867.9, 23868.6, 23871.6, 23872.2];
HyperfineDFreq = [-1.3,-0.5,0.5,1.0;
                  -1.5,-1.3,1.3,2.1;
                  -2.2,-1.5,1.5,2.1];
HfDFuncertainty = [0.1,0.1,0.1,0.1;
                   0.2,0.2,0.1,0.1;
                   0.1,0.1,0.1,0.1];
J = [1;2;3]; % J values
K = [1;2;3]; % K values

MeasuredQ = zeros(3,4);
MQVariance = zeros(3,4);

%calculate the quadrupole coupling constant
for i = 1:length(J)
    MeasuredQ(i,1) = HyperfineDFreq(i,1) / energytransitionunitless(J(i), K(i), J(i) - 1,     J(i)       ); %F-1 to F
    MeasuredQ(i,2) = HyperfineDFreq(i,2) / energytransitionunitless(J(i), K(i), J(i) + 1,     J(i)       ); %F+1 to F
   % we don't do this for the center frequency because the energy
   % transition here is zero.
    MeasuredQ(i,3) = HyperfineDFreq(i,3) / energytransitionunitless(J(i), K(i), J(i),         J(i) + 1   ); %F to F+1
    MeasuredQ(i,4) = HyperfineDFreq(i,4) / energytransitionunitless(J(i), K(i), J(i),         J(i) - 1   ); %F to F-1
end

MeasuredQ;

%calculate the uncertainty in our values of the quadrupole coupling
%constant
for i = 1:length(J)
    MQVariance(i,1) = ((HfDFuncertainty(i,1)^2 )/ ((energytransitionunitless(J(i), K(i), J(i) - 1,     J(i)       ))^2))^0.5; %F-1 to F
    MQVariance(i,2) = ((HfDFuncertainty(i,2)^2 )/ ((energytransitionunitless(J(i), K(i), J(i) + 1,     J(i)       ))^2))^0.5; %F+1 to F
   % we don't do this for the center frequency because the energy
   % transition here is zero.
    MQVariance(i,3) = ((HfDFuncertainty(i,3)^2 )/ ((energytransitionunitless(J(i), K(i), J(i),         J(i) + 1   ))^2))^0.5; %F to F+1
    MQVariance(i,4) = ((HfDFuncertainty(i,4)^2 )/ ((energytransitionunitless(J(i), K(i), J(i),         J(i) - 1   ))^2))^0.5; %F to F-1
end

MQmax = MeasuredQ + MQVariance; 
MQmin = MeasuredQ - MQVariance;
