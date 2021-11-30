function x = Newton(x0, f, eps, maxinter, delta )
	x = x0;
	i = 0;
	while i < maxinter && abs(f(x) > eps)
		x = x - (delta * f(x))/(f(x+delta) - f(x));
		i = i + 1
	end
	if i >= maxinter
		x = NaN;
	end
end



