function D=determine(a,C)
D=[];
n=size(a,1);
if (rank(a) < n)
    disp('the determinant of the matrix a is')
    D = 0
    return
end
E = zeros(n,2);
for i=1:n
    currSum = 0;
    for j=1:n
        currSum = currSum + (a(i,j).*C(i,j));
    end
    E(i,1) = currSum;
end

for j=1:n
    currSum = 0;
    for i=1:n
        currSum = currSum + (a(i,j).*C(i,j));
    end
    E(j,2) = currSum;
end

d=det(a);

%Checking to make sure E has the right values
if closetozeroroundoff(abs(E-(d*ones(n,2))),7) == zeros(n,2)
    disp('the determinant of the matrix a is')
    D = E(1,1)
else
    disp('Something went wrong!')
end
end  


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        