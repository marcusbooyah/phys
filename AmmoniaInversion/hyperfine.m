clear all;
Js = [1;2;3;5;6;7;5;4;6;3;13];
Ks = [1;2;3;5;6;7;3;3;3;2;10];
const = 4.08;
I = 1;
F = @(J) 1+J;
C = @(J) F(J)*(F(J)+1) - I*(I+1) - J*(J+1)

quad = @(J,K) const * (((3*K.^2)/J(J+1))-1) * (((3/4)*C(J)*(C(J)+1)-I*(I+1)*J*(J+1))/(2*(2*J+3)*(2*J-1)*I*(2*I-1)))
blah = quad(Js,Ks)