clc; close all; echo off;

% 1) Uvažujte funkci 𝑓(𝑥) = tan^-1((x+1)/(x-1))
% S využitím Matlabu analyzujte definiční obor této funkce 
% a její limity v kritických bodech tj. pro 𝑥 = ±∞ a pro 𝑥 = 1. Analogicky proveďte analýzu 
% pro funkce 𝑓(𝑥) = x^x a funkce y = x/(sqrt(x^2-1))

x = -10:0.01:10;

%y =(atan((x+1)./(x-1)));

% limita pomoci symbolic toolkitu
syms x;
limit(atan((x+1)./(x-1)), x, 1, 'left')
limit(atan((x+1)./(x-1)), x, 1, 'right')

%plot(x,y);

%y = x.^x;
% syms x;
% limit(x.^x, x, 1, 'left')
% limit(x.^x, x, 1, 'right')

%plot(x,y);

%y = x./(sqrt(x.^2 - 1));
% syms x;
% limit(x./(sqrt(x.^2 - 1)), x, 1, 'left')
% limit(x./(sqrt(x.^2 - 1)), x, 1, 'right')
% 
%plot(x,y)

% Napište v LaTeXu krátkou zprávu o těchto funkcích (maximálně na dvě stránky, minimálně 
% na jednu stránku). Do zprávy vložte popsané grafy. Formát dokumentu bude PDF. Obrázky
% nesmí být vložené v bitmap formátech nýbrž ve vektorových formátech (EPS, PDF)

% TODO doma + definicni obory, tim, ze se podivam na grafy fce