function b = float2bin(number, dec_length)
    
    % input data modification
	integralPart = floor(number);
    fractionalPart = number - integralPart;
    % convertedFractionalPart = sprintf("%."+dec_length+"f",fractionalPart);
    % convertedTrimmedSecondPart = strrep(convertedFractionalPart,'.','');
    % secondPartInDesiredState = str2double(convertedTrimmedSecondPart);
    
    integralPartTransfered = dec2bin(integralPart); % nevymyslim znova kolo
    integralPartBin = char(integralPartTransfered);
    fractionalPartBin = "";
    
    while (strlength(fractionalPartBin) < dec_length+1) && (fractionalPart ~= 1)
        fractionalPart = fractionalPart * 2;
        if fractionalPart > 1
            fractionalPart = fractionalPart - 1;
            fractionalPartBin = fractionalPartBin + "1";
            continue
        end
        if fractionalPart < 1
            fractionalPartBin = fractionalPartBin + "0";
        end  
    end
    b = integralPartBin;
    if strlength(fractionalPartBin) > 0
        b = b + "." + fractionalPartBin;
    end
end