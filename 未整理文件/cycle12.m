function f=cycle12(x)
for k=0:2
    if (x>=(2*k))&&(x<(2*(k+1)))
    f=cycle2(k+1,x);
    end
end
end
