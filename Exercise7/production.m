function x = production(C,d)
n=size(C,2);
x=[];

%check if inputs are valid
%check if C has all nonnegative entries
if all(C >= 0)
    %valid
else
    disp('Consumption matrix contains negative values')
    return
end
%check if d has all nonnegative entries
if all(d >= 0)
    %valid
else
    disp('Final demand vector d contains negative values')
    return
end
%check if C's column sums are all less than 1
if all(sum(C) < 1)
    %valid
else
    disp('Each column sum of C should be less than 1')
    return
end

%should be valid inputs
I = eye(n);

%Aaug = [A d]
x = (I-C)\d;
if all(x > 0)
    disp('the unique production vector is')
    x
else
    disp('check the code!')
end

x0=d;
x1=x0;
k=0;
%closetozeroroundoff(x-x1, 1)
while all(closetozeroroundoff(x-x1, 1) ~= 0)
    k = k + 1;
    I = I + C^k;
    x1=inv(I)\d;
end

disp('the production vector calculated by recurrence relation is')
x1
fprintf('the number of iteration to match the output x is %i\n',k)

end