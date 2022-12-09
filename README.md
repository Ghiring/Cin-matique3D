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



