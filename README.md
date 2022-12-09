# Traitement de données de la cinématique 3D d'un saut 

***

Le programme suivant vise à analyser les différents paramètres cinématiques en 3 dimensions d'un exercice de saut (CMJ) enregistré au moyen du système optoélectronique flex13 (optitrack). Nous avons utilisé le Biomech markerset précosiné par optitract. Il se présence comme suit : 

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/MarkerSet.png" height="500" width="500" >

***

## Table des matières :
1. Script principal
2. Fonctions annexes

***

***

### I - Script principal : 

Import des données. 

```html
clear; 
clc;

mydialog
pause(3.5)

File = uigetfile(".csv","MultiSelect","off"); 
Data = readmatrix(File);
Data = Data(6:end,:);
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Boites%20de%20dialogue/mydialog.jpg" height="300" width="400" >

```html
mydialog2
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Boites%20de%20dialogue/mydialog2.jpg" height="300" width="400" >

Indexation des données marqueur par marqueur.

```html
MqLDPI = Data(:,2:5);
MqLFAL = Data(:,[2 6:8]);
MqLFAX = Data(:,[2 9:11]);
MqLFCC = Data(:,[2 12:14]);
MqLFLE = Data(:,[2 15:17]);
MqLFTC = Data(:,[2 18:20]);
MqRDPI = Data(:,[2 21:23]);
MqRFAL = Data(:,[2 24:26]);
MqRFAX = Data(:,[2 27:29]);
MqRFCC = Data(:,[2 30:32]);
MqRFLE = Data(:,[2 33:35]);
MqRFTC = Data(:,[2 36:38]);

message = "Pour quels marqueurs voulez-vous obtenir des informations ?";
options = ["LDPI" "LFAL" "LFAX" "LFCC" "LFLE" "LFTC" "RDPI" "RFAL" "RFAX" "RFCC" "RFLE" "RFTC" "TOUS"];
choice = menu(message,options);
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Boites%20de%20dialogue/menu.jpg" height="850" width="400" >

Si le marqueur LDPI est choisi, on plot les informations qui lui sont liées : déplacement du marqueur "raw", déplacement interpolé + lissé (pour combler les manques dus à des erreurs lors de l'acquisition) et déplacement du marqueur dans l'espace 3D au cours du temps. 

```html
if choice == 1 

    TDR_Mq(MqLDPI, 'MqLDPI')
    savefig('DeplacementLDPI.fig')
    interlis(MqLDPI, Data);
    savefig('Interpolation_LDPI')
    clf;
    plot3(MqLDPI(:,2),MqLDPI(:,4),MqLDPI(:,3))
        title("Déplacement dans l'espace du marqueur LDPI")
        savefig('Modélisation_LDPI')
    mydialog3
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/LDPI/DeplacementLDPI.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/LDPI/Interpolation_LDPI.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/LDPI/Modelisation_LDPI.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Boites%20de%20dialogue/mydialog3.jpg" height="300" width="400" >

.
.
. 

De même pour les 11 autres marqueurs si choisis de manière singulière. 

***

Si un marqueur unique n'est pas choisi, alors on plot les informations liées à tous les marqueurs. On commence ici par interpoler et plot les graphiques en X, Y et Z marqueur par marqueur.

```html 
else
    
    A = [MqLDPI MqLFAL MqLFAX MqLFCC MqLFLE MqLFTC MqRDPI MqRFAL MqRFAX MqRFCC MqRFLE MqRFTC];
    B = ["MqLDPI" "MqLFAL" "MqLFAX" "MqLFCC" "MqLFLE" "MqLFTC" "MqRDPI" "MqRFAL" "MqRFAX" "MqRFCC" "MqRFLE" "MqRFTC"];

    a=2;
    b=3;
    c=4;
    l=1;

    warning('off')
    rmpath('folderthatisnotonpath')
    
    GraphGlob = [];

    while b <= 48 
    
        C = A(:,a:c);
    
        a=a+4;
        b=b+4;
        c=c+4;
    
    
    bdt = (Data(1,2)):(Data(2,2)):Data(end,2);
        Alpha = ['X' 'Y' 'Z'];
        
        i=1;
        j=1;
    
        while i <=3
            Maki = makima(Data(:,2),C(:,i),bdt);
            Lis = sgolayfilt(Maki,3,99);
            subplot(2,2,j)
                plot(Data(:,2),Lis)
                title(Alpha(:,j))
            xlabel({'Temps (s)',B(:,l)})
            ylabel('Deplacement (m)')
            GraphGlob = [GraphGlob,Lis];

            i=i+1;
            j=j+1;

        end
    
    l=l+1;
    f = figure;
    
    end
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LDPI.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LFAL.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LFAX.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LFCC.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LFLE.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/LFTC.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RDPI.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RFAL.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RFAX.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RFCC.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RFLE.jpg" height="500" width="500" >

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/TOUS/RFTC.jpg" height="500" width="500" >

On regroupe toutes les données de chaque marqueur puis on les plot : un graphique pour le déplacement des marqueurs du côté droit en X et un graphique pour le déplacement des marqueurs du côté gauche en X de façon à pouvoir comparer bilatéralement.

```html 
GraphGlob = reshape(GraphGlob(:,:),5872,[]);

subplot(2,1,1)
    plot(Data(:,2),GraphGlob(:,1),Data(:,2),GraphGlob(:,4),Data(:,2),GraphGlob(:,7),Data(:,2),GraphGlob(:,10),Data(:,2),GraphGlob(:,13),...
    Data(:,2),GraphGlob(:,16))
    title("Déplacements en X pour G")
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC')
subplot(2,1,2)
    plot(Data(:,2),GraphGlob(:,19),Data(:,2),GraphGlob(:,22),Data(:,2),GraphGlob(:,25),Data(:,2),GraphGlob(:,28),Data(:,2),GraphGlob(:,31),...
    Data(:,2),GraphGlob(:,34))
    title("Déplacements en X pour D")
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Deplacements%20en%20X.jpg" height="500" width="500" >

```html 
f = figure;
   
subplot(2,1,1)
    plot(Data(:,2),GraphGlob(:,2),Data(:,2),GraphGlob(:,5),Data(:,2),GraphGlob(:,8),Data(:,2),GraphGlob(:,11),Data(:,2),GraphGlob(:,14),...
    Data(:,2),GraphGlob(:,17))
    title("Déplacements en Y pour G")  
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC')
subplot(2,1,2)
    plot(Data(:,2),GraphGlob(:,20),Data(:,2),GraphGlob(:,23),Data(:,2),GraphGlob(:,26),Data(:,2),GraphGlob(:,29),Data(:,2),GraphGlob(:,32),...
    Data(:,2),GraphGlob(:,35))
    title("Déplacements en Y pour D")
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```
    
<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Deplacements%20en%20Y.jpg" height="500" width="500" >

```html 
f = figure;

subplot(2,1,1)
    plot(Data(:,2),GraphGlob(:,3),Data(:,2),GraphGlob(:,6),Data(:,2),GraphGlob(:,9),Data(:,2),GraphGlob(:,12),Data(:,2),GraphGlob(:,15),...
    Data(:,2),GraphGlob(:,18))
    title("Déplacements en Z pour G")
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC')
subplot(2,1,2)
    plot(Data(:,2),GraphGlob(:,21),Data(:,2),GraphGlob(:,24),Data(:,2),GraphGlob(:,27),Data(:,2),GraphGlob(:,30),Data(:,2),GraphGlob(:,33),...
    Data(:,2),GraphGlob(:,36))
    title("Déplacements en Z pour D")    
    ylabel("Déplacement (m)")
    xlabel("Temps (s)")
    legend('RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
``` 

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Deplacements%20en%20Z.jpg" height="500" width="500" >

Calcul des corrélations croisées pour permettre d'évaluer la symétrie du mouvement.

```html 
f = figure;

XD = [GraphGlob(:,1) GraphGlob(:,4) GraphGlob(:,7) GraphGlob(:,10) GraphGlob(:,13) GraphGlob(:,16)];
XG = [GraphGlob(:,19) GraphGlob(:,22) GraphGlob(:,25) GraphGlob(:,28) GraphGlob(:,31) GraphGlob(:,34)];

CorrCroisX = xcorr2(XD,XG);
plot(CorrCroisX)
    title("CorrPlot en X")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Corr.X.jpg" height="500" width="500" >

f = figure;

YD = [GraphGlob(:,2) GraphGlob(:,5) GraphGlob(:,8) GraphGlob(:,11) GraphGlob(:,14) GraphGlob(:,17)];
YG = [GraphGlob(:,20) GraphGlob(:,23) GraphGlob(:,26) GraphGlob(:,29) GraphGlob(:,32) GraphGlob(:,35)];

```html
CorrCroisX = xcorr2(YD,YG);
plot(CorrCroisX)
    title("CorrPlot en Y")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="" height="500" width="500" >

```html
f = figure;

ZD = [GraphGlob(:,3) GraphGlob(:,6) GraphGlob(:,9) GraphGlob(:,12) GraphGlob(:,15) GraphGlob(:,18)];
ZG = [GraphGlob(:,21) GraphGlob(:,24) GraphGlob(:,27) GraphGlob(:,30) GraphGlob(:,33) GraphGlob(:,36)];

CorrCroisX = xcorr2(ZD,ZG);
plot(CorrCroisX)
    title("CorrPlot en Z")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="" height="500" width="500" >



