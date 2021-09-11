function antena_array(f,e,eixo_polar,ed_dist,lista_dist,ed_fase,lista_fase,var_gui_freq,texto_erro)
 
 ed_freq    = var_gui_freq(1); #Handles para a frequencia
 lista_freq = var_gui_freq(2);
 
 freq = frequencia(ed_freq, lista_freq); # Calcula a frequencia
 
 
#Preprocessamento array 
 
 global Nam;
 
 #Calcula as distancias
  x = str2num(get(ed_dist, 'string'));
  
  t_value = get(lista_dist, 'value');
 if (t_value == 1)
  x = x.*1e-3;
 elseif(t_value == 2)
  x = x.*1e-2; 
 endif
 
  #Calcula a fase
  xi = str2num(get(ed_fase, 'string'));
  
  t_value = get(lista_fase, 'value');
 if (t_value == 1)
  ;
 elseif(t_value == 2)
  xi = xi.*(pi/180); 
 endif
 
  
 # Calcula o numero de elementos
  Nx  = size(x,2);
  Nxi = size(xi,2);
  if (Nx != Nxi)  #Mostra mensagem de erro se o numero de elementos for differente
   set(texto_erro,'visible','on');
  else
   set(texto_erro,'visible','off');
   N = Nx; 
#---------------------------------------------------------------  
  
#
 lambda = (3e8)/freq;
 
k = 2*pi/lambda; % número de onda

%**************************************************************

for n = (1:Nam) % Para cada amostra
 alpha(n) = (2*pi/Nam)*(n-1); % Calcula o angulo (0 até 2pi)
 
 for i = (1:N)
  psi(i) = k*x(i)*cos(alpha(n))+xi(i);
 endfor
  
% psi
 
padrao(n) = 0; %Calcula o valor do padrao (rho)
for i = (1:N-1) % Faz o somatorio de i de 1 a N-1 e j de i a N
 for j = (i+1:N)
 padrao(n) += cos(psi(i)-psi(j)); 
 
 endfor
endfor 

padrao(n) = N +2*padrao(n);
padrao(n) = sqrt(padrao(n));
padrao(n) = padrao(n)/N;
endfor

axes(eixo_polar);
polar(alpha, padrao)
endif
endfunction