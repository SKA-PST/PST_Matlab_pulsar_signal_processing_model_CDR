function StokesPlots(dat, nbins)
% dat is the structure output by matdspsr
% nbins is the number of bins with which the data should be plotted; 
% nbins needs to be an integer factor of the length of dat.phase.

nlen = length(dat.phase);

if nargin == 1,
    nbins = nlen;
end;

phase = dat.phase;
I = mean(dat.I,2);  % averaging over frequency channels
Q = mean(dat.Q,2);
U = mean(dat.U,2);
V = mean(dat.V,2);

if nbins ~= nlen,
    phase = mean(reshape(phase, nlen/nbins, nbins),1)';
    I = mean(reshape(I, nlen/nbins, nbins))';
    Q = mean(reshape(Q, nlen/nbins, nbins))';
    U = mean(reshape(U, nlen/nbins, nbins))';
    V = mean(reshape(V, nlen/nbins, nbins))';    
end;

subplot(2,2,1);
plot(phase, I, 'LineWidth', 1.5);
title('I', 'FontSize', 14, 'FontWeight', 'bold');
axis([min(dat.phase) max(dat.phase) -Inf Inf])
xlabel('Period','FontSize', 12, 'FontWeight', 'bold');
%ylabel('\bf{Amplitude^2}', 'FontSize', 12);
set(gca,'FontSize', 12, 'FontWeight', 'bold');

subplot(2,2,2);
plot(phase, Q, 'LineWidth', 1.5);
title('Q', 'FontSize', 14, 'FontWeight', 'bold');
axis([min(dat.phase) max(dat.phase) -Inf Inf])
xlabel('Period','FontSize', 12, 'FontWeight', 'bold');
set(gca,'FontSize', 12, 'FontWeight', 'bold');

subplot(2,2,3);
plot(phase, U, 'LineWidth', 1.5);
title('U', 'FontSize', 14, 'FontWeight', 'bold');
axis([min(dat.phase) max(dat.phase) -Inf Inf])
xlabel('Period','FontSize', 12, 'FontWeight', 'bold');
%ylabel('\bf{Amplitude^2}', 'FontSize', 12);
set(gca,'FontSize', 12, 'FontWeight', 'bold');

subplot(2,2,4);
plot(phase, V, 'LineWidth', 1.5);
title('V', 'FontSize', 14, 'FontWeight', 'bold');
axis([min(dat.phase) max(dat.phase) -Inf Inf])
xlabel('Period','FontSize', 12, 'FontWeight', 'bold');
set(gca,'FontSize', 12, 'FontWeight', 'bold');

return

end

