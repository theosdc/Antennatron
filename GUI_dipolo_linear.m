# GUI para a antena dipolo linear

#Deixa visiveis os elementos graficos da antena dipolo linear

set(texto_tamanho, 'visible', 'on');
set(ed_tamanho, 'visible', 'on');
set(lista_tamanho, 'visible', 'on');
set(b_dipolo_linear, 'visible', 'on');

#Deixa invisiveis os elementos graficos da antena array

set(texto_dist, 'visible', 'off');
set(ed_dist, 'visible', 'off');
set(lista_dist, 'visible', 'off');
set(texto_fase, 'visible', 'off');
set(ed_fase, 'visible', 'off');
set(lista_fase, 'visible', 'off');
set(b_array, 'visible', 'off');    

#Cria a imagem
eixo_imagem = axes ( ...
    'position', [0.53125, 0.625,  0.3944   0.41],
    'xtick',    [], 
    'ytick',    [],
    'xlim',     [0, 1], 
    'ylim',     [0, 1]); 

img = imread('figuras/antena_dipolo_linear.png');
axes(eixo_imagem);
imshow(img,[]); 
 