function y=Z(u,d)  
a=2*pi; 
c=sqrt(u^2+(d/a)^2); 
y=a/d*(u/2*c+1/2*(d/a)^2*log(u+c)); 
end
