% cv_6
clc; clear;close all;clf

fileName = 'insurance.csv';
data = readtable(fileName);

nonsmokers = data(strcmp(data.smoker, 'no'), :);
smokers = data(strcmp(data.smoker, 'yes'), :);

[k_age_smokers, q_age_smokers] = lin_regression(smokers.age, smokers.charges);
[k_age_nonsmokers, q_age_nonsmokers] = lin_regression(nonsmokers.age, nonsmokers.charges);


[k_bmi_smokers, q_bmi_smokers] = lin_regression(smokers.bmi, smokers.charges);
[k_bmi_nonsmokers, q_bmi_nonsmokers] = lin_regression(nonsmokers.bmi, nonsmokers.charges);




hold on;
xlabel("BMI");
ylabel('Náklady');
legend();
scatter(smokers.bmi, smokers.charges, 36, "black", "DisplayName", "Kuřáci");
fplot(@(x) (k_bmi_smokers * x + q_bmi_smokers), [min(smokers.bmi) max(smokers.bmi)], "DisplayName", "Trend y=" + k_bmi_smokers + "x " + q_bmi_smokers);

scatter(nonsmokers.bmi, nonsmokers.charges, 36, "blue", "DisplayName", "Nekuřáci");
fplot(@(x) (k_bmi_nonsmokers * x + q_bmi_nonsmokers), [min(nonsmokers.bmi) max(nonsmokers.bmi)], "DisplayName", "Trend y=" + k_bmi_nonsmokers + "x " + q_bmi_nonsmokers);

saveas(gcf, "graph_bmi.png");

hold off;
clf(gcf);

hold on;
xlabel("Věk");
ylabel('Náklady');
legend();
scatter(smokers.age, smokers.charges, 36, "black", "DisplayName", "Kuřáci");
fplot(@(x) (k_age_smokers * x + q_age_smokers), [min(smokers.age) max(smokers.age)], "DisplayName", "Trend y=" + k_age_smokers + "x " + q_age_smokers);

scatter(nonsmokers.age, nonsmokers.charges, 36, "blue", "DisplayName", "Nekuřáci");
fplot(@(x) (k_age_nonsmokers * x + q_age_nonsmokers), [min(nonsmokers.age) max(nonsmokers.age)], "DisplayName", "Trend y=" + k_age_nonsmokers + "x " +q_age_nonsmokers);

saveas(gcf, "graph_age.png");

