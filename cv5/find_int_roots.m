function [x, M] = find_int_roots(p)

    x=0;
    mi=1;
    M(mi,:)=p;
    foo=1;   
    delka_polynomu = length(p);
    
    mi=mi+1;

	if delka_polynomu ~= 1
       if delka_polynomu ~= 2
              for i=1:delka_polynomu
                   if p(delka_polynomu-i+1)==0
                       x(foo,1)=0;
                       foo=foo+1;
                       M(mi,:)=p;
                       mi=mi+1;
                    end
               end

                for i=-10:10
                    p_elem = p(1);
                    A(1,1) = p_elem;
                    for j = 2:delka_polynomu
                        p_elem = p_elem * i + p(j);
                        A(j,1)=p_elem;
                    end

                    if A(length(A))==0 && i~=0
                        
                        p=A;
                        M(mi,:)=p;
                        mi=mi+1;
                        x(foo,1)=i;
                        foo=foo+1;
                        p_elem = p(1);
                        A(1,1) = p_elem;
                        delka_polynomu = length(p);
                        
                        for j = 2:delka_polynomu
                            p_elem = p_elem * i + p(j);
                            A(j,1)=p_elem;
                        end
                        
                        if A(length(A)) == 0 && i~=0
                            p=A;
                            M(mi,:)=p;
                            mi=mi+1;
                            x(foo,1)=i;
                            foo=foo+1;                           
                            p_elem = p(1);
                            A(1,1)=p_elem;
                            delka_polynomu = length(p);
                            for j = 2:delka_polynomu
                                p_elem = p_elem * i + p(j);
                                A(j,1)=p_elem;
                            end	
                            if A(length(A))==0 && i~=0
                                p=A;
                                M(mi,:)=p;
                                mi=mi+1;
                                x(foo,1)=i;
                                foo=foo+1;
                            end
                        end
                    end
                end
       else
        x=(p(2)/p(1))*(-1);
       end
    else
        x=p(1);
    end
end



