function u = gaussSeidel(a,b,u,rhs);

% number entries in x- and y-direction
Nx= length(u(:,1))-1;
Ny= length(u(1,:))-1;
% mesh size in x- and y-direction
hx= 1/Nx;
hy= 1/Ny;

% throw error, if we obtain an invalid factor
if (a/hx^2+b/hy^2 == 0)
    disp('Error! a/hx^2+b/hy^2=0!')
end

% prefactors in GS-iteration
facA = a/hx^2/(2*a/hx^2 + 2*b/hy^2);
facB = b/hy^2/(2*a/hx^2 + 2*b/hy^2);

% Gauss-Seidel; loop over inner points only
for j=2 : 1 : Ny
    for i = 2 : 1 : Nx
        u(i,j) = facA*(u(i+1,j)+u(i-1,j)) + facB*(u(i,j-1)+u(i,j+1)) ...
               - 1/(2*a/hx^2 + 2*b/hy^2)*rhs(i,j);
    end
end

return
