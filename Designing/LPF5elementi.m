close all;
clc;

N = 5;
d= 0.8e-3;
er=2.55;
g = [1.7058 1.2296 2.5408 1.2296 1.7058];
z0 = 50;
omegaC = 2*pi*2.4e9;
Z1=ones(1,N);
Z2=ones(1,N);
wd_ind =ones(1,N);
wd_cap =ones(1,N);
w_ind=ones(1,N);
w_cap=ones(1,N);
L=ones(1,N);
C=ones(1,N);
l_cap =ones(1,N);
l_ind =ones(1,N);
betaelle= pi/4;
for i=1:N
    L(i) = g(i)*z0/omegaC;
    C(i) = g(i)/(omegaC*z0);
    Z1(i) = g(i)*z0/betaelle;%induttore
    Z2(i) = betaelle*z0/g(i);%condensatore
    wd_ind(i) = find_wd(Z1(i),er);
    wd_cap(i) = find_wd(Z2(i),er);
    w_ind(i) = d*wd_ind(i);
    w_cap(i) = d*wd_cap(i);
    l_cap(i) = find_l(wd_cap(i), er, omegaC);
   % epsilon_eff = ((er+1)/2)+((er-1)/2)*(1/(sqrt(1+12/wd_ind(i))))
    l_ind(i) = find_l(wd_ind(i), er, omegaC);
end

fprintf(' consideriamo una rete a T si ha che:\n');
fprintf('L1 = %e \n', L(1));
fprintf('C2 = %e \n', C(2));
fprintf('L3 = %e \n', L(3));
fprintf('C4 = %e \n', C(4));
fprintf('L5 = %e \n', L(5));
fprintf(' le impedenze caratteristiche dei vari pezzi di linea sono:\n');
fprintf('Zh1 = %f \n', Z1(1));
fprintf('Zl2 = %f \n', Z2(2));
fprintf('Zh3 = %f \n', Z1(3));
fprintf('Zl4 = %f \n', Z2(4));
fprintf('Zl5 = %f \n', Z1(5));
fprintf(' larghezza delle linee:\n');
fprintf('w_L1 = %e \n', w_ind(1));
fprintf('w_C2 = %e \n', w_cap(2));
fprintf('w_L3 = %e \n', w_ind(3));
fprintf('w_C4 = %e \n', w_cap(4));
fprintf('w_L5 = %e \n', w_ind(5));
fprintf(' lunghezza delle linee:\n');
fprintf('l_L1 = %e \n', l_ind(1));
fprintf('l_C2 = %e \n', l_cap(2));
fprintf('l_L3 = %e \n', l_ind(3));
fprintf('l_C4 = %e \n', l_cap(4));
fprintf('l_L5 = %e \n', l_ind(5));
fprintf(' \n\n\n\n\n');
fprintf(' consideriamo una rete a PI si ha che:\n');
fprintf('C1 = %e \n', C(1));
fprintf('L2 = %e \n', L(2));
fprintf('C3 = %e \n', C(3));
fprintf('L4 = %e \n', L(4));
fprintf('C5 = %e \n', C(5));
fprintf(' le impedenze caratteristiche dei vari pezzi di linea sono:\n');
fprintf('Zl1 = %f \n', Z2(1));
fprintf('Zh2 = %f \n', Z1(2));
fprintf('Zl3 = %f \n', Z2(3));
fprintf('Zh4 = %f \n', Z1(4));
fprintf('Zl5 = %f \n', Z2(5));
fprintf(' larghezza delle linee:\n');
fprintf('w_C1 = %e \n', w_cap(1));
fprintf('w_L2 = %e \n', w_ind(2));
fprintf('w_C3 = %e \n', w_cap(3));
fprintf('w_L4 = %e \n', w_ind(4));
fprintf('w_C5 = %e \n', w_cap(5));
fprintf(' consideriamo una rete a PI si ha che:\n');
fprintf('l_C1 = %e \n', l_cap(1));
fprintf('l_L2 = %e \n', l_ind(2));
fprintf('l_C3 = %e \n', l_cap(3));
fprintf('l_L4 = %e \n', l_ind(4));
fprintf('l_C5 = %e \n', l_cap(5));
fprintf(' \n\n\n\n\n');

w_z = d*find_wd(z0,er);
fprintf('per quanto riguarda le due porte di ingresso e uscita, la larghezza è = %e \n', w_z);