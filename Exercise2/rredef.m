function R = rredef(A)

[m,n] = size(A);


if (n >= m)
    for p = 1:n
        if any(A(:,p))
            index = p;
            [max_val, max_row] = max(abs(A(:,p)));
            A([1 max_row],:) = A([max_row 1],:);
            A(1,:) = A(1,:) ./ A(1,p);
            if (A(1,p) == -1)
                A(1,p) = A(1,p) * -1;
            end
            break
        end 
    end

    

    for j = 1:(n-1)
        for p = j:(m-1)
            A(p+1,:) = A(p+1,:) - ( A(j,:) .* A(p+1,index) );
        end
        A = closetozeroroundoff(A,7);
        if (index < m-1)
            index = index + 1;
        else  
            if (A(p+1,index+1) == 0)
                for v = (index+1):n
                    if (A(p+1,v) ~= 0)
                        A(p+1,:) = A(p+1,:) ./ A(p+1,v);
                    end
                end
                break
            else
                A(p+1,:) = A(p+1,:) ./ A(p+1,index+1);
                break
            end
        end

        for u=1:n
            if (A(j+1,u) ~= 0)
                A(j+1,:) = A(j+1,:) ./ A(j+1, index);
            end
        end
    end

    

    rows = m;
    for j = 1:(n-1)
        for p = 1:(rows-1)
            A(rows - p,:) = A(rows - p, :) - A(rows,:) .* A(rows - p,index + 2 -j);
        end
        A = closetozeroroundoff(A,7);
        rows = m - j;
        if (rows <= 1)
            break
        end

    end
else
    for p = 1:n
        if any(A(:,p))
            index = p;
            [max_val, max_row] = max(abs(A(:,p)));
            A([1 max_row],:) = A([max_row 1],:);
            A(1,:) = A(1,:) ./ A(1,p);
            if (A(1,p) == -1)
                A(1,p) = A(1,p) * -1;
            end
            break
        end 
    end

    

    for j = 1:(n-1)
        for p = j:(m-1)
            A(p+1,:) = A(p+1,:) - ( A(j,:) .* A(p+1,index) );
        end
        A = closetozeroroundoff(A,7);
        if (index < n-1)
            index = index + 1;
        else  
            if (A(p+1,index+1) == 0)
                for v = (index+1):n
                    if (A(p+1,v) ~= 0)
                        A(p+1,:) = A(p+1,:) ./ A(p+1,v);
                    end
                end
                break
            else
                A(p+1,:) = A(p+1,:) ./ A(p+1,index+1);
                break
            end
        end

        for u=1:n
            if (A(j+1,u) ~= 0)
                A(j+1,:) = A(j+1,:) ./ A(j+1, index);
            end
        end
    end

    index = 0;
    for p=m:-1:1
        for j=1:n
            if (A(p,j) ~= 0)
                index = j;
                rows = p;
                break
            end
        end
        if (index ~= 0)
            break
        end
    end
    
    for j = 1:(n-1)
        for p = 1:(rows-1)
            A(rows - p,:) = A(rows - p, :) - A(rows,:) .* A(rows - p,index + 1 -j);
        end
        A = closetozeroroundoff(A,7);
        rows = rows - j;
        if (rows <= 1)
            break
        end
    end
end

for p=1:(m-1)
    if (A(p,:) == 0)
        A([p m],:) = A([m p],:);
    end
end

R=[A];
r=rref(A);
if (closetozeroroundoff(R-r,7) == 0)
    disp('the reduced echelon form of A is')
    R
else
    disp('Something is wrong!')
end
    