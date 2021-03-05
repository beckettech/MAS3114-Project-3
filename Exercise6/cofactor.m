function C=cofactor(a)
format
format compact
[~,n]=size(a);
%Create the empty variable 'C'
C = zeros(n,n);
%Populating C with the correct values
for i=1:n
    temp1 = a;
    temp1(i,:) = [];
    for j=1:n
        temp2 = temp1;
        temp2(:,j) = [];
        C(i,j) = ((-1)^(i+j))*(det(temp2));
    end
end
%Displaying the resulting matrix C
disp('the matrix of cofactors of a is')
C
end

