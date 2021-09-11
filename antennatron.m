clear all; #garante que todas as variaveis estao zeradas

#Variaveis globais
global Nam  = 5000; %Numero de amostras para a fugura padrao (pattern figure)

#Programa principal

#Criacao dos objetos graficos comuns--------------------------------------------

GUI_ini #Inicializa todos os elementos graficos
set(fig,'visible','on') #Deixa visivel a figura

#Como default, calcula a figura padrao para a antena dipolo linear
GUI_dipolo_linear
antena_dipolo_linear(fig,e,eixo_polar,ed_tamanho,lista_tamanho,var_gui_freq);
 
#Funcoes da GUI ---------------------------------------------------------------- 
#Seleciona o tipo de antena a ser calculado
function seleciona_antena(f,e,fig,lista_antena,eixo_polar,var_gui_dipolo_linear,var_gui_array,var_gui_freq)

 texto_tamanho   = var_gui_dipolo_linear(1); #Handles para a antena dipolo linear
 ed_tamanho      = var_gui_dipolo_linear(2); 
 lista_tamanho   = var_gui_dipolo_linear(3); 
 b_dipolo_linear = var_gui_dipolo_linear(4);
 
 texto_dist = var_gui_array(1); #Handles para a antena array
 ed_dist    = var_gui_array(2);
 lista_dist = var_gui_array(3);
 texto_fase = var_gui_array(4);
 ed_fase    = var_gui_array(5);
 lista_fase = var_gui_array(6);
 b_array    = var_gui_array(7);
 

#Seleciona o tipo de antena 
 
 tipo = get(lista_antena, 'value');
 
 if (tipo == 1) #antena dipolo linear

   GUI_dipolo_linear; #Elementos graficos da antena dipolo linear
 
 elseif(tipo == 2) #antena array
 
   GUI_array; #Elementos graficos da antena array
   
 endif
endfunction