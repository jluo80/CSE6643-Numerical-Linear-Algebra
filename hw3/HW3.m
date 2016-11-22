function [LU_time, Max_number, growth_order] = HW3()
    m = [32, 64, 128, 256, 512];
    [row, col] = size(m);
    count = 100;
    LU_time = zeros(col, count);
    size_of_entries = zeros(col, count);
    growth_order = zeros(col, count);
    for i = 1 : col
        for j = 1 : count
            ND = normrnd(0, sqrt(m(i)), [m(i) m(i)]); % Normal distribution matrix
            % Computation time
            tic;
            % LU decompositon
            [L, U] = LU(ND);
            LU_time(i, j) = toc; % 3-by-1
            % size of entries of L^-1
            L_inverse = inv(L) > 1;
            size_of_entries(i, j) = sum(L_inverse(:));
            % Growth order 
            growth_order(i, j) = abs(max(U(:)) / max(ND(:)));           
        end
%         ND = normrnd(0, sqrt(m(i)), [m(i) m(i)]); % Normal distribution matrix
%         tic;
%         [L, U] = LU(ND); % LU decompositon
%         LUtime(i) = toc;
%         growth_order(i) = abs(max(U(:)) / max(ND(:))); % Growth order
    end
    LU_time = mean(LU_time, 2);
    Max_number = max(size_of_entries, [], 2);
    display(LU_time);
    display(Max_number);
    display(size_of_entries);
    display(growth_order);
        
    hold on;
    for i = 1 : col
        for j = 1 : count,
            scatter(m(i), growth_order(i, j), '*');
        end    
    end

    figure
    subplot(2, 1, 1);
    plot(m, LU_time);
    title('Computation Time in Different Size');

    
    subplot(2, 1, 2)
    plot(m, Max_number);
    title('Size of Entries(L_{ij}^{-1} > 1) in Different Size');
    
%     A = [2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8];
%     [L, U, P] = LU(A);
%     display(L);
%     display(U);
%     display(P);

end