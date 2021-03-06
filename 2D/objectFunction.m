function G = objectFunction( u_lambda, p, D_in, D_out, vertWeights)
%objectFunction Computes the object function
u = u_lambda(1:end-1);
lambda = u_lambda(end);

numTri = size(D_in,1)/2;
u_abs = abs(u);

% compute the p-Laplacian
u_in = D_in * u;
u_scale = vecnorm([u_in(1:numTri) u_in(numTri+1:end)],2,2);
u_lap = D_out * ([u_scale;u_scale].^(p-2) .* u_in);

% compute the norm
u_norm = sum(vertWeights.*(u_abs.^ p))/(3*p);

% put together the object function
G = [u_lap + lambda * u_abs.^(p-2) .* u;
     u_norm - 1];
end

