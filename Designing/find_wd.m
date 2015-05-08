function [ wd ] = find_wd( z, er )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a= z/60*sqrt((er+1)/2)+(er-1)/(er+1)*(0.23+0.11/er);
b = 377*pi / (2*z*sqrt(er));
w1 = 8*exp(a)/(exp(2*a)-2);
w2 = (2/pi)*(b-1-log(2*b-1)+((er-1)/(er+1))*(log(b-1)+0.39-0.61/er));
if w1 <2
    wd = w1;
else
    wd = w2;
end

end

