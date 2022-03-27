function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    yi = y0;
    for iter=1:1:maxit
        yip = yi;
        yi = (A * yip')';
        vec(iter) = (max(abs(yi))/max(abs(yip)));
        if length(vec) > 1
            if abs(vec(iter) - vec(iter - 1)) < tol
                break
            end           
        end
    end
    %vec = vec./norm(vec);
    lambda = vec(1);
  end
