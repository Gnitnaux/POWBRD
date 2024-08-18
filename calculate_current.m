N = [500, 450, 400, 350, 300, 250, 200, 150, 100];  
colors = lines(length(N)); 
  
figure; 
hold on;
  
for j = 1:length(N)
    u1 = 214; u2 = 2.58;  
    i2 = 0.00049; i3 = 0.00049; i4 = 0; i5 = 0; i6 = 0.00042;  
    i1 = i2 + i5 + i6;  
    t = 0:0.0000005:0.0127; 
    I = zeros(size(t)); % 初始化I数组  
    L = 0.0175 * N(j) * N(j) / 250000;  % 以500匝电磁铁的电感为基准，算出不同匝数下的电感
    R = 0.5 + N(j) * 17 / 500; %假设电阻丝及走线电阻为0.5欧，电磁铁电阻以500匝电阻17欧算
    for i = 1:length(t)  
        dt = 0.0000005;
  
        du1 = i1 * dt / (-4.40044 / 1000);
        di5 = (u1 - R * i5 - 2.6) * dt / L;
        du2 = i4 * 100000000 * dt;
        di3 = du2 / 5100;
        di2 = (du1 - du2) / 430000;
        di4 = di2 - di3;
        di6 = du1/510000;
        di1 = di5 + di2 + di6;


        i1 = i1 + di1;
        i2 = i2 + di2;
        i3 = i3 + di3;
        i4 = i4 + di4;
        i5 = i5 + di5;
        i6 = i6 + di6;
        u1 = u1 + du1;
        u2 = u2 + du2;
  

        I(i) = i5;  
    end  
  
    plot(t, I, 'LineWidth', 1.7, 'Color', colors(j,:));  
end  
  
plot(t, 15*ones(size(t)), '--k', 'LineWidth', 1.5);
  
xlabel('$t(s)$','Interpreter','latex');  
ylabel('$I(A)$','Interpreter','latex');  
title('Change of current with time at different turns', 'Interpreter','latex');  
legend(arrayfun(@(x) sprintf('N = %d', N(x)), 1:length(N), 'UniformOutput', false), 'Location', 'best'); % 添加图例，包括参考线  
hold off;  

