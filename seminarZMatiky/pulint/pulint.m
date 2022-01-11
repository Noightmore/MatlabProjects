function x = pulint(a, b, f, eps)
   while (abs(b - a) > eps)
        S = (a + b) / 2;
        if (f(S) == 0)
            x = S;
            return;
        end
        if (f(S) * f(a) < 0)
            b = S;
        else
            a = S;
        end
   end
   x = (a + b) / 2;
end
