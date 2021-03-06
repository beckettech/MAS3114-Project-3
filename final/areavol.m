function D=areavol(A)
format
D=0;

%find (rows x col) = (m,n)
[m,n]=size(A);

%parallelogram (2x2)
if m == 2 && n==2
    %check if linearly independent
    if rank(A) == 2
        %Area = b*h
        D = A(1,1) * A(2,2);
        fprintf('The area of the parallelogram is\n')
        D    
    else
        fprintf('The parallelogram cannot be built')
    end
    
%parallelepiped (3x3)    
else
    %check if linearly independent
    if rank(A) == 3
        %Area = b*h*w
        D = A(1,1) * A(2,2) * A(3,3);
        fprintf('The area of the parallelepiped is\n')
        D    
    else
        fprintf('The parallelepiped cannot be built')
    end
end

end

