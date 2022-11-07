% radkovy vektor
b=[3,4,4,3];
% sloupcovy vektor
a = [3;4;4;3];
% sloupcova matice
A = [2,1,1,0;2,3,4,5;1,1,1,2;3,5,4,2];

% v normalni matice nelze delit matici vektorem....
x=A\a

% inverzni matice B
B = inv(A)

% inverzni matice krat matice puvodni vytvori vzdy matici jednotkovou
X=B*A 

