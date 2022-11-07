% cv_6
clc;clear;close all

drawGraph("data0");
drawGraph("data1");
drawGraph("data2");
drawGraph("data3");

function [] = drawGraph(dataFile)
   
    data = load(dataFile + ".mat", '-ascii');
    x = data(:, 1);
    y = data(:, 2);
    
    
    hold on;
    title('Interpolation of dataset ' + dataFile);
    xlabel('input');
    ylabel('Interpolated function values');
    legend('Location','bestoutside');
    ylim([-15 15])

    xq = -10:0.1:10;
    yq = lagrange(data(:, 1), data(:, 2), xq);

    l_yq = interp1(x, y, xq, "linear");
    s_yq = interp1(x, y, xq, "spline");
    p_yq = interp1(x, y, xq, "pchip");
    m_yq = interp1(x, y, xq, "makima");
    
    plot(xq, yq, "DisplayName", "Lagrangian interpolation");
    plot(xq, l_yq, "DisplayName", "Linear interpolation");
    plot(xq, s_yq, "DisplayName", "Spline");
    plot(xq, p_yq, "DisplayName", "PCHIP");
    plot(xq, m_yq, "DisplayName", "Makima");

    saveas(gcf, "graph_"+ dataFile +".png");

    hold off;
    clf;

end


