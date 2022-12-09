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

Import des données via. 

```html
clear; 
clc;

mydialog
pause(3.5)

File = uigetfile(".csv","MultiSelect","off"); 
Data = readmatrix(File);
Data = Data(6:end,:);

mydialog2

```
### Outputs mydialog2 : 


