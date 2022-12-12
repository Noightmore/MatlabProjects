load ('digits_tren.mat') ; %načte soubor se všemi 4 tren. poli
load ('digits_test.mat') ; %načte soubor se všemi 4 test. poli

N = 1000; M = 9000; pocet_pokusu = 0; pocet_spravnych = 0;

for i = 1:N % cyklus pro test. obrázky, N max.1000
    x = test_data (i,:,:); % načti test. obrázek
    x_trida = test_trida(i); % jeho třída
    if(mod(i, 10) == 0)
        uspesnost = pocet_spravnych/pocet_pokusu * 100; % urči úspěšnost
        disp(['Úspěšnost: ', num2str(uspesnost), '%']); % a vypiš ji
    end    
        for j = 1:M % cyklus pro tren. vzory, M max.9000
            v = tren_data (j,:,:); % načti tren. obrázek
            v_trida = tren_trida(j); % jeho třída
            tridy_vzoru(j) = v_trida; % ulož číslo třídy do pole tridy_vzoru
            dist(j)=sum(sum(abs(x-v))); % urči vzdálenost a ulož do pole dist
        end
        [min_dist, index] = min(dist); % nejmenší vzdálenost a její index
        nejblizsi_trida = tridy_vzoru(index); % třída nejbližšího vzoru

        if x_trida == nejblizsi_trida % je shoda?
            pocet_spravnych = pocet_spravnych + 1; % pokud ano, započítej
        end
        pocet_pokusu = pocet_pokusu + 1; % započítej pokus
end

uspesnost = pocet_spravnych/pocet_pokusu * 100; % urči úspěšnost
disp(['Úspěšnost: ', num2str(uspesnost), '%']); % a vypiš ji