
%Michael Evans
%PHYS 432
%NH3 inversion energy levels


function y = energylevel(jval, kval, fval)
    cval = (fval * (fval + 1)) - 2 - (jval * (jval + 1));   %calculates C
    %the following is the expression broken down into smaller bits
    numerator1 = 3 * kval * kval;
    denominator1 = jval * (jval + 1);
    numerator2 = (((0.75 * cval) * (cval + 1)) - (2 * jval * (jval + 1)));
    denominator2 = 2 * ((2 * jval) + 3) * ((2 * jval) - 1);
    y = ((numerator1 / denominator1) - 1) * (numerator2 / denominator2);
    %y = (((3 * kval * kval) / (jval * (jval + 1))) - 1) * 
    % ((0.75 * cval * (cval + 1)) - (2 * jval * (jval + 1))) 
    % / ((4 * jval + 6) * (2 * jval - 1) * (2 - 1)));
end
