function freq = frequencia(ed_freq,lista_freq)
 # Calcula a frequencia 
 freq = str2num(get(ed_freq, 'string'));
  
 f_value = get(lista_freq, 'value');
 if (f_value == 1)
  freq = freq*1e3;
  elseif(f_value == 2)
  freq = freq*1e6;
 else
  freq = freq*1e9; 
 endif
endfunction 