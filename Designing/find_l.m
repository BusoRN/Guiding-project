function [ l ] = find_l( wd,er,omegac )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
epsilon_eff = ((er+1)/2)+((er-1)/2)*(1/(sqrt(1+12/wd)));
l = ((pi/4)*299.792458e6)/(omegac*sqrt(epsilon_eff));

end

