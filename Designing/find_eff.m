function [ epsilon_eff ] = find_eff( wd,er )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
epsilon_eff = ((er+1)/2)+((er-1)/2)*(1/(sqrt(1+12/wd)));

end

