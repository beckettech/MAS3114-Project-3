function x=nonhomogen(A,b)
format
[~,n]=size(A);
fprintf('reduced echelon form of [A b] is ')
R=rref([A,b])
[nRow,nCol] = size(A);
if(rank(R) ~= rank(A))
    disp('The system is inconsistent')
elseif(nRow == nCol && det(A) ~= 0)
    disp('The system has a unique solution')
    A\b
else
    disp('There are infinitely many solutions')
    homobasis_b(A, b);
end
syms Col(C), syms p
fprintf('the general solution of the non-homogeneous system is\n') 
fprintf('the column space of the matrix C translated by the vector p') 
x=Col(C)+p
x=[];
