# GUI para a antena array

#Deixa invisiveis os elementos graficos da antena dipolo linear

set(texto_tamanho, 'visible', 'off');
set(ed_tamanho, 'visible', 'off');
set(lista_tamanho, 'visible', 'off');
set(b_dipolo_linear, 'visible', 'off');

#Deixa visiveis os elementos graficos da antena array

set(texto_dist, 'visible', 'on');
set(ed_dist, 'visible', 'on');
set(lista_dist, 'visible', 'on');
set(texto_fase, 'visible', 'on');
set(ed_fase, 'visible', 'on');
set(lista_fase, 'visible', 'on');
set(b_array, 'visible', 'on');  

#Cria a imagem
eixo_imagem = axes ( ...
    'position', [0.53125, 0.6,  0.3944   0.4336],
    'xtick',    [], 
    'ytick',    [],
    'xlim',     [0, 1], 
    'ylim',     [0, 1]); 

img = imread('figuras/array.png');
axes(eixo_imagem);
imshow(img,[]); 
