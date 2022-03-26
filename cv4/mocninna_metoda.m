function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    yi = y0;
    for iter=1:1:maxit
        yip = yi;
        yi = A * yip
        vec(iter) = yi(2)/yip(2)
    end
    vec = vec./norm(vec);
    lambda = vec(1);
  end
