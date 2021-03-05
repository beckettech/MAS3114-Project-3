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
x=[];