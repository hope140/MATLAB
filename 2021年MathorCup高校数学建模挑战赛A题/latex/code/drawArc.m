function drawArc(p1, p2, c)


    r = sqrt((p1(2) - c(2))^2 + (p1(1) - c(1))^2);
    [alpha] = cart2pol(p1(1) - c(1), p1(2) - c(2));
    [beta] = cart2pol(p2(1) - c(1), p2(2) - c(2));

    t = linspace(alpha, beta);
    x = c(1) + r * cos(t);
    y = c(2) + r * sin(t);
    plot(x, y, 'linestyle', '--', 'color', 'b');
end
