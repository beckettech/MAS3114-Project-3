function E2=ele2(n,i,j)
E2=eye(n);
E2([i j],:) = E2([j i],:);
end