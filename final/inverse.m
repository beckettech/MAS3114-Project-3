function B=inverse(a,C,D)
B=[];
if D == 0
    disp('a is not invertible!')
    return
else
    disp('a is invertible!')
    B = (1/D) .* transpose(C)
end

F = inv(a)

if closetozeroroundoff(abs(F-B),7) == zeros(size(a))
    disp('the inverse is calculated correctly and it is matrix')
    B
else
    disp('Something went wrong!')
end

end

