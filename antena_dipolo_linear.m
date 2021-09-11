function antena_dipolo_linear(f,e,eixo_polar,ed_tamanho,lista_tamanho,var_gui_freq)
 #Calcula a figura padrao para a antena dipolo linear
 
 global Nam; #Numero de amostras 
  
 #Frequencia-------------------------------------------------------------------- 
 ed_freq    = var_gui_freq(1); #Handles para a frequencia
 lista_freq = var_gui_freq(2);
 
 freq = frequencia(ed_freq, lista_freq); # Calcula a frequencia
 
 #Calcula o tamanho-------------------------------------------------------------
  h = str2num(get(ed_tamanho, 'string'));
  
  t_value = get(lista_tamanho, 'value');
 if (t_value == 1)
  h = h*1e-3;
 elseif(t_value == 2)
  h = h*1e-2; 
 endif
 
 #Figura padrao-----------------------------------------------------------------
 lambda = (3e8)/freq;
 
 for n = (1:Nam) % Para cada amostra
  theta(n) = (2*pi/Nam)*(n-1); % Calcula o angulo (0 até 2pi)
 endfor

 p = (2*pi*h)/lambda;

 rho = abs((cos(p.*cos(theta)).-cos(p))./sin(theta)); #Formula para a figura
 rho = rho/max(rho);                                  #padrao

 #Plota a figura padrao---------------------------------------------------------
 axes(eixo_polar);
 polar(theta,rho);
 title ("Plano E");
endfunction