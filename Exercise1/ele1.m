function E1=ele1(n,r,i,j)
E1=eye(n);
E1(j,:) = E1(j,:) + E1(i,:).*r;
end