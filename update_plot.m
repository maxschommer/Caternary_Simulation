function[f] = update_plot(A_t)
[x, y] = simulate_Cat(-1, 1, 0, .5, A_t, 4);
f = plot(x, y);
axis([-1, 1, -2, 1])
grid on
