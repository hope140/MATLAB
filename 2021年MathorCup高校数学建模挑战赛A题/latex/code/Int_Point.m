function [x,y] = Int_Point(A1, A2, B1, B2)




    if A1(1) == A2(1)
        x = A1(1);
        k2 = (B2(2) - B1(2)) / (B2(1) - B1(1));
        b2 = B1(2) - k2 * B1(1);
        y = k2 * x + b2;
    end
    if B1(1) == B2(1)
        x = B1(1);
        k1 = (A2(2) - A1(2)) / (A2(1) - A1(1));
        b1 = A1(2) - k1 * A1(1);
        y = k1 * x + b1;
    end

    if A1(1) ~= A2(1) && B1(1) ~= B2(1)
        k1 = (A2(2) - A1(2)) / (A2(1) - A1(1));
        k2 = (B2(2) - B1(2)) / (B2(1) - B1(1));
        b1 = A1(2) - k1 * A1(1);
        b2 = B1(2) - k2 * B1(1);

        if k1 == k2
            x = [];
            y = [];
        else
            x = (b2 - b1) / (k1 - k2);
            y = k1 * x + b1;
        end
    end
end
