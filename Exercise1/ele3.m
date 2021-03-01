function E3=ele3(n,j,k)
E3=eye(n);
E3(j,:)=E3(j,:).*k;
end