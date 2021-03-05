function [C,p] = homobasis_b(A, b) 
format
[m,n]=size(A); 
red_ech_form=rats(rref(A));
num_rref_A = rref(A); 
C=[];
disp('the homogeneous system has non-trivial solutions') 
[~,pivot_c]=rref(A);
S=1:n;
nonpivot_c=setdiff(S,pivot_c);
q=numel(nonpivot_c);
j=1:q;
fprintf('a free variable is x%i\n',nonpivot_c(j)) 
C=zeros(n,q);
% Creating necessary intermediate variable 
identity_for_C = eye(size(nonpivot_c,2));
% Code to RECALCULATE C's rows
for i=1:numel(pivot_c)
    C(pivot_c(1,i),:)=num_rref_A(i,nonpivot_c)*-1; 
end
for i=1:size(nonpivot_c,2)
    C(nonpivot_c(1,i),:)= identity_for_C(i,:); 
end
fprintf('a basis for the solution set of the homogeneous system\n')
fprintf('is formed by the columns of the matrix')
C