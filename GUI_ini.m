#Inicializacao dos todos objetos graficos
#*******************************************************************************
#Elementos principais
#*******************************************************************************

#Cria figura principal
fig = figure(1,
  'numbertitle','off', 
  'name','Antennatron',
   'visible','off', #Nao deixa visivel
  'position',[0,0,1050,700]);

#Cria eixos para o gráfico  
 eixo_polar = axes('units','normalized',
  'position',[0.03125,0.0555,0.4375,0.778],
  'visible', 'off',
  'box', 'on',
  'xtick',    [], 
  'ytick',    [],
  'xlim',     [0, 1], 
  'ylim',     [0, 1]);  

#Frequencia---------------------------------------------------------------------   

#Cria texto para a frequencia
texto_freq = uicontrol (fig,
  'style', 'text',
  'string', 'Freq',
  'units', 'normalized',
  'horizontalalignment', 'left',
  'position', [0.53125, 0.5, 0.0625, 0.0555]); 

#Cria espaco de edicao para a frequencia  
ed_freq = uicontrol(fig,
  'style', 'edit',
  'string', '100',
  'units', 'normalized',
  'position', [0.5625, 0.5, 0.15625,0.0555]);  
  
#Cria lista de multiplicadores de frequencia
lista_freq = uicontrol (fig,
  'style', 'listbox',
  'string', {'kHz',
  'MHz',
  'GHz'},
  'units', 'normalized',
  'position', [0.71875, 0.5, 0.125, 0.0555]);  
  
var_gui_freq =  [ed_freq,lista_freq];

#*******************************************************************************
#Elementos graficos da antena dipolo linear - default: NAO VISIVEIS
#*******************************************************************************

 #Cria texto para o tamanho da antena
texto_tamanho = uicontrol (fig,
  'style', 'text',
  'string', 'h',
  'units', 'normalized',
  'horizontalalignment', 'left',
  'visible', 'off',
  'position', [0.53125, 0.3888, 0.15625, 0.0555]); 

#Cria espaco de edicao para o tamanho  
ed_tamanho = uicontrol(fig,
  'style', 'edit',
  'string', '1',
  'units', 'normalized',
  'visible', 'off',
  'position', [0.5625, 0.3888, 0.15625,0.0555]);    

#Cria lista de multiplicadores de tamanho
lista_tamanho = uicontrol (fig,
  'style', 'listbox',
  'string', {'mm',
  'cm',
  'm'},
  'units', 'normalized',
  'visible', 'off',
  'position', [0.71875, 0.3888, 0.125, 0.0555]);

#Cria botao de confirma 
b_dipolo_linear = uicontrol(fig,
  'style', 'pushbutton',
  'string','Calcular',
  'units', 'normalized',    
  'position', [0.5625,0.2777,0.125,0.0555],
  'visible', 'off',
  'callback', {@antena_dipolo_linear,eixo_polar,ed_tamanho,lista_tamanho,var_gui_freq});  


var_gui_dipolo_linear = [texto_tamanho,ed_tamanho,lista_tamanho,b_dipolo_linear];

#*******************************************************************************
#Elementos graficos da antena array - default: NAO VISIVEIS
#*******************************************************************************
#Cria texto para a distancia dos elementos
texto_dist = uicontrol (fig,
  'style', 'text',
  'string', 'x',
  'units', 'normalized',
  'horizontalalignment', 'left',
  'visible', 'off',
  'position', [0.53125, 0.3888, 0.15625, 0.0555]); 

#Cria espaco de edicao para a distancia  
ed_dist = uicontrol(fig,
  'style', 'edit',
  'string', 'x1,x2,...,xn',
  'units', 'normalized',
  'visible', 'off',
  'position', [0.5625, 0.3888, 0.15625,0.0555]);    

#Cria lista de multiplicadores de distancia
lista_dist = uicontrol (fig,
  'style', 'listbox',
  'string', {'mm',
  'cm',
  'm'},
  'units', 'normalized',
  'visible', 'off',
  'position', [0.71875, 0.3888, 0.125, 0.0555]);   

#Cria texto para a fase dos elementos
texto_fase = uicontrol (fig,
  'style', 'text',
  'string', 'Fase',
  'units', 'normalized',
  'horizontalalignment', 'left',
  'visible', 'off',
  'position', [0.53125, 0.2778, 0.15625, 0.0555]); 

#Cria espaco de edicao para a fase  
ed_fase = uicontrol(fig,
  'style', 'edit',
  'string', 'xi1,xi2,...,xin',
  'units', 'normalized',
  'visible', 'off',
  'position', [0.5625, 0.2778, 0.15625,0.0555]);    

#Cria lista de multiplicadores de fase
lista_fase = uicontrol (fig,
  'style', 'listbox',
  'string', {'rad',
  'graus'},
  'units', 'normalized',
  'visible', 'off',
  'position', [0.71875, 0.2778, 0.125, 0.0555]);    
    
#Cria texto de erro para numeros diferendes de x e xi
texto_erro = uicontrol (fig,
 'style', 'text',
 'string', 'Erro: x e xi devem ter o mesmo numero de elementos',
 'units', 'normalized',
 'horizontalalignment', 'center',
 'visible','off',
 'position', [0.5625, 0.07778, 0.35, 0.05556]); 
    
#Cria botao de confirma 
b_array = uicontrol(fig,
  'style', 'pushbutton',
  'string','Calcular',
  'units', 'normalized',    
  'position', [0.5625,0.1667,0.125,0.0555],
  'visible', 'off',
  'callback', {@antena_array,eixo_polar,ed_dist,lista_dist,ed_fase,lista_fase,var_gui_freq,texto_erro});
  

 

var_gui_array = [texto_dist,ed_dist,lista_dist,texto_fase,ed_fase,lista_fase,b_array];

#*******************************************************************************
#Elementos que nao dependem do tipo de antena
#*******************************************************************************

#Tipo de antena-----------------------------------------------------------------

#Cria texto para o tipo de antena
texto_tipo = uicontrol (fig,
  'style', 'text',
  'string', 'Tipo',
  'units', 'normalized',
  'horizontalalignment', 'left',
  'position', [0.53125, 0.6111, 0.0625, 0.0555]);  
  
#Cria lista de tipos de antena
lista_antena = uicontrol (fig,
  'style', 'listbox',
  'string', {'Dipolo linear',
  'Array'},
  'units', 'normalized',
  'position', [0.5625, 0.6111, 0.21875, 0.0555]);
 
 
#Cria botao de confirmacao de antena 
b_antena = uicontrol(fig,
  'style', 'pushbutton',
  'string','OK',
  'units', 'normalized',    
  'position', [0.7812,0.6111,0.0625,0.0555],
  'callback', {@seleciona_antena,fig,lista_antena,eixo_polar,var_gui_dipolo_linear,var_gui_array,var_gui_freq});




 