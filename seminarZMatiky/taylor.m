function y = taylor(x,d)
	for i=1:length(d)
		a(length(d) - i = d(i + 1))/factorial(i);
	end
	y=polynom(x,a);
end
