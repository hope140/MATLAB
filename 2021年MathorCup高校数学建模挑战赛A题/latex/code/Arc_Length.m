function Arc_Length = Arc_Length(P1, P2, O)



    r = sqrt((P1(1) - O(1))^2 + (P1(2) - O(2))^2);
    [alpha] = cart2pol(P1(1) - O(1), P1(2) - O(2));
    [beta] = cart2pol(P2(1) - O(1), P2(2) - O(2));
    Arc_Length = r * (abs(alpha - beta));
end




