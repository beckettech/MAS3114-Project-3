function B=closetozeroroundoff(A,p)
A(abs(A)<10^-p)=0;
B=A;
end
