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

```html
clear; 
clc;

mydialog
pause(3.5)

File = uigetfile(".csv","MultiSelect","off"); 
Data = readmatrix(File);
Data = Data(6:end,:);

mydialog2

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
```

