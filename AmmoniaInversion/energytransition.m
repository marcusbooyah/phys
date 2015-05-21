%Michael Evans
%NH3 inversion
%energy transition calculation

function  y = energytransition(jval, kval, finitial, ffinal)
   % take the difference of the two energy levels
   % and multiply by the published value of
   % the quadrupole coupling constant for NH3
   % which is 4.08 MHz
   
    y = (energylevel(jval,kval, ffinal) - energylevel(jval,kval,finitial)) * 4.08;
end