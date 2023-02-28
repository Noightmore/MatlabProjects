## binomial coefficient

$$
\binom{n}{k} = \frac{n!}{k!(n-k)!}
$$

## variation where order matters, repetition allowed
V(n,k) = n! / k!* (n-k)!

## variation where order matters, repetition not allowed
V(n,k) = n**k

## combination where order doesn't matter, repetition not allowed
C(n,k) = (n + k -1)! / k!* (n-k)!

## combination where order doesn't matter and repetition allowed
C(n,k) = n! / (k! * (n-k)!)

### priklad:

mame slovo "ABECEDABECE" Kolika zpusoby muzeme provest prehozeni jednotlivych
pismen tohoto slova

pismeno A je v textu 2 krat
pismeno B je v textu 2 krat
pismeno C je v textu 2 krat
pismeno D je v textu 1 krat
pismeno E je v textu 4 krat

pocet pismen v textu je 11

P(n1, n2, ... nk) = 11! / (2! * 2! * 2! * 1! * 4!) = 207900



### sources:
https://en.wikipedia.org/wiki/Binomial_coefficient