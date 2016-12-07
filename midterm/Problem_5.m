function [p_A_100, sigma_min_100] = Problem_5()
    m = [8, 16, 32, 64, 128, 256];
%     m = [32, 64];
    [row, col] = size(m);
    count = 100;
    temp = [1/2, 1/4, 1/8, 1/16, 1/32, 1/64];
    p_A_sum = zeros(1, col);
    n_sum = zeros(1, col);
    diff_sum = zeros(1, col);
    sigma_min_sum = zeros(1, col);
    total = zeros(col, size(temp, 2));

    for i = 1 : col
%         total = zeros(i, size(temp, 2));
        for j = 1 : count
            % Generate real normal distribution matrix
%             A = randn(m(i), m(i)) / sqrt(m(i));
            A = triu(randn(m(i), m(i)) / sqrt(m(i)));
            % Eigen value of A
            e_v = real(eig(A));
            % Spectral radius of A
            p_A = max(abs(e_v));
            % 2-norm of A
            n = norm(A);
            diff = n - p_A;
            % Smallest singular values of A
            sigma_min = min(svd(A));

            p_A_sum(i) = p_A_sum(i) + p_A;
            n_sum(i) = n_sum(i) + n;
            diff_sum(i) = diff_sum(i) + diff;
            sigma_min_sum(i) = sigma_min_sum(i) + sigma_min;

            % Question a 
            figure(1)
            hold on;
            for k = 1 : m(i)
                scatter(m(i), e_v(k, 1), '*');
            end
            title('Eigen value of 100 random matrices');

            % Question c
            for r = 1 : size(temp, 2)
                if sigma_min <= temp(r);
                    total(i, r) = total(i, r) + 1;
                end
            end
        end
        
        % Question c
        figure(6)
        plot(temp, total(i,:) / 100);
        hold on;
        title('Proportion of \sigma_{min}');
    end
    
        % Question a
        figure(2)
        plot(m, p_A_sum / count, 'b');
        title('Spectral radius of 100 random matrices');

        % Question b
        figure(3)
        plot(m, n_sum / count, 'k');
        title('2-norm of 100 random matrices');
        
        % Question b
        figure(4)
        plot(m, p_A_sum / count, 'b');
%         title('Spectral radius of 100 random matrices');
        hold on;
        
        % Question b
        plot(m, n_sum / count, 'k');
%         title('2-norm of 100 random matrices', '*');
        hold on;
        
        % Question b
        plot(m, diff_sum / count, 'r');
%         title('Comparision of spectral radius, 2-norm and their difference', 'x');
        legend('\rho(A)', '||A||', '||A|| - \rho(A)');
        hold off;
        
        % Question c
        figure(5)
        plot(m, sigma_min_sum / count);
        title('\sigma_{min} of 100 random matrices');
        
%       p_A_100 = zeros(2, 100);
%       sigma_min_100 = zeros(2, 100);
%       %%%%%% Addtion (7 significant digits) %%%%%% 
%       for i = 1 : col
% %         total = zeros(i, size(temp, 2));
%         for j = 1 : count
%             % Generate real normal distribution matrix
%             A = randn(m(i), m(i)) / sqrt(m(i));
% %             A = triu(randn(m(i), m(i)) / sqrt(m(i)));
%             % Eigen value of A
%             e_v = real(eig(A));
%             % Spectral radius of A
%             p_A_100(i, j) = max(abs(e_v));
%             % Smallest singular values of A
%             sigma_min_100(i, j) = min(svd(A));
%         end
%       end
%             % 7 significant digits. Since there might be 0.001000000
%             % thus we need to round to 9 significant digits at least.
%             sigma_min_100 = round(sort(sigma_min_100)', 9);
%             p_A_100 = round(p_A_100', 9);
end