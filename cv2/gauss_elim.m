function [x, U] = gauss_elim(A,b)
    
n = size(A, 1);  
v = zeros(n, 1); 

for i = 1 : 1 : n    
   v(i) = i;
end

x = zeros(n, 1);

for elem_i = 1 : 1 : n
    max = abs(A(v(elem_i), v(elem_i)));    
    max_pos = elem_i;    
    for l =  elem_i : 1 : n        
        if abs(A(v(l), v(elem_i))) > max            
            max = abs(A(v(l), v(elem_i)));            
            max_pos = l;            
        end
    end
    
    tmp_v = v;
    v(elem_i) = tmp_v(max_pos);
    v(max_pos) = tmp_v(elem_i);
    
          
    for i = 1 : 1 : n
        if i ~= elem_i
            tau = A(v(i), elem_i) / A(v(elem_i), elem_i);
            for j = elem_i : 1 : n
                A(v(i), j) = A(v(i), j) - A(v(elem_i), j) * tau;                       
            end
            b(v(i)) = b(v(i)) - b(v(elem_i)) * tau;
        end
    end
end

for i = 1 : 1 : n
    x(i) = b(v(i)) / A(v(i), i);
end

U = A;
end