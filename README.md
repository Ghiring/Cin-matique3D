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

***

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

***

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

```html
f = figure;

YD = [GraphGlob(:,2) GraphGlob(:,5) GraphGlob(:,8) GraphGlob(:,11) GraphGlob(:,14) GraphGlob(:,17)];
YG = [GraphGlob(:,20) GraphGlob(:,23) GraphGlob(:,26) GraphGlob(:,29) GraphGlob(:,32) GraphGlob(:,35)];

CorrCroisX = xcorr2(YD,YG);
plot(CorrCroisX)
    title("CorrPlot en Y")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Deplacements%20en%20Y.jpg" height="500" width="500" >

```html
f = figure;

ZD = [GraphGlob(:,3) GraphGlob(:,6) GraphGlob(:,9) GraphGlob(:,12) GraphGlob(:,15) GraphGlob(:,18)];
ZG = [GraphGlob(:,21) GraphGlob(:,24) GraphGlob(:,27) GraphGlob(:,30) GraphGlob(:,33) GraphGlob(:,36)];

CorrCroisX = xcorr2(ZD,ZG);
plot(CorrCroisX)
    title("CorrPlot en Z")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Deplacements%20en%20Z.jpg" height="500" width="500" >

***

Définition des vecteurs cuisse côté droit(RFTC > RFLE) et jambe côté droit (RFAL > RFLX) puis calcul de l'angle entre les 2 vecteurs à chaque instant (frame) de l'acquisition puis stockage dans une matrice tierce. 

```html
u=1;
Angles_totaux_CJ_D = [];

while u <= height(Data)

    RFTC_ist = MqRFTC(u,2:4)';
    RFLE_ist = MqRFLE(u,2:4)';
    RFAL_ist = MqRFAL(u,2:4)';
    RFAX_ist = MqRFAX(u,2:4)';
    
    V_cuisseD = RFLE_ist-RFTC_ist;
    V_jambeD = RFAX_ist-RFAL_ist;

    vector2angle(V_cuisseD,V_jambeD);
    Angle_cuisse_jambeD = round(ans,1);
    Angles_totaux_CJ_D = [Angles_totaux_CJ_D,Angle_cuisse_jambeD];

    u=u+1;

end
```
<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/MatAnglesD.jpg" height="850" width="500" >

De même côté gauche. 

```html
v = 1
Angles_totaux_CJ_G = [];

while v <= height(Data)

    LFTC_ist = MqLFTC(v,2:4)';
    LFLE_ist = MqLFLE(v,2:4)';
    LFAL_ist = MqLFAL(v,2:4)';
    LFAX_ist = MqLFAX(v,2:4)';
    
    V_cuisseG = LFLE_ist-LFTC_ist;
    V_jambeG = LFAX_ist-LFAL_ist;
    
    vector2angle(V_cuisseG,V_jambeG);
    Angle_cuisse_jambeG = round(ans,1);
    Angles_totaux_CJ_G = [Angles_totaux_CJ_G,Angle_cuisse_jambeG];

    v=v+1;

end
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/MatAnglesG.jpg" height="850" width="500" >

***

Regroupement des angulations dans une matrice commune puis plot de l'évolution angulaire de châque côté en fonction du temps de façon à permettre la comparaison bilatérale. 

```html
Angles_totaux_CJ_G = Angles_totaux_CJ_G';
Angles_totaux_CJ_D = Angles_totaux_CJ_D';

f = figure;
plot(Data(:,2),Angles_totaux_CJ_D,Data(:,2),Angles_totaux_CJ_G)
    legend('Côté gauche','Côté droit')
    xlabel("Temps (s)")
    ylabel("Angle (°)")
    title("Évolution de l'angle du genou en fonction du temps")

end
```

<img src="https://github.com/Ghiring/Cin-matique3D/blob/main/Outputs/Angle%20du%20genou:temps.jpg" height="850" width="500" >

***

### II - Fonctions annexes : 

#### a) - mydialog 

La fonction permet de faire apparaître une boite de dialogue permettant d'informer l'utilisateur de ce qu'il devra faire : ici sélectionner le fichier qu'il veut ouvrir dans 5 secondes (activation de uigetfile retardée par un timesleep).

```html
function mydialog
    d = dialog('Position',[450 400 250 150],'Name','INFORMATION');

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','Vous allez devoir choisir le fichier que vous voulez analyser dans 5 secondes.');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','OK',...
               'Callback','delete(gcf)');
end
```

***

#### b) - mydialog2

Informe le sujet au moyen d'une boite de dialogue que s'il désire obtenir les information sur l'ensemble des marqueurs il devra sélectionner "TOUS" dans le menu suivant. S'il ne le fait pas, il n'obtiendra que les information spécifiques au marqueur sélectionné.

```html
function mydialog2
    d = dialog('Position',[450 400 250 150],'Name','INFORMATION');

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','Si vous voulez des informations sur les angles et la symétrie, veuillez choisir "TOUS" dans la boîte de dialogue ci-contre.');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','OK',...
               'Callback','delete(gcf)');
end
```

#### c) - interlis : 

La fonction est utilisée pour interpoler les valeurs manquantes et lisser la courpe de déplacement du marqueur désiré.

```html
function interlis(M,Data)

    bdt = (Data(1,2)):(Data(2,2)):Data(end,2);
    Alpha = ['X' 'Y' 'Z'];
    
    i=2;
    j=1;

    while i <=4
        Maki = makima(Data(:,2),M(:,i),bdt);
        Lis = sgolayfilt(Maki,3,99);
        subplot(2,2,j)
            plot(Data(:,2),Lis)
            title(Alpha(:,j))
    
        i=i+1;
        j=j+1;
    end


end
```

#### d) - TDR_Mq

La fonction TDR_Mq est utilisée pour calculer le taux de reconstruction du marqueur sélectionné. Le résultat est donné en pourcentage. Elle permet en plus de plot les graphiques de déplacement des marqueurs selon 3 axes pour chaque marqueur. 

               
```html
function TDR_Mq(M,nom)

    M(isnan(M))=0;                                  % Taux de reconstruction
    Nb_0 = length(find(M(:,2:end)==0));
    Nb_elem = 3*height(M);
    TDR = 100-((Nb_0/(Nb_elem))*100);
    
    X = ['Le taux de reconstruction du marqueur ', nom, ' est de ', num2str(TDR), ' %'];
    disp(X)

    M_X = subplot(2,2, [3,4]);                          % Déplacements selon les axes
        plot(M(:,1),M(:,2))
        title("Déplacement du marqueur selon l'axe X")
        xlabel("Temps (s)")
        ylabel("Position (m)")
    M_Y = subplot(2,2,1);
        plot(M(:,1),M(:,3))
        title("Déplacement du marqueur selon l'axe Y")
        ylabel("Position (m)")
    M_Z = subplot(2,2,2);
        plot(M(:,1),M(:,4))
        title("Déplacement du marqueur selon l'axe Z")

end
```

#### e) - mydialog3 

Lorsque l'utilisateur ne choisi qu'un marqueur, les tracés des déplacements et modélisations sont directement enregistrées dans le dossier affilié à MatLab et ne sont pas plot dans les output. Le programme semble alors se temriner sans aucunes actions : cette fonction est donc là pour informer l'utilisateur que les figures ont bien été sauvegardées sur son ordinateur. 

```html
function mydialog3
    d = dialog('Position',[450 400 250 150],'Name','INFORMATION');

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','Les graphiques ont bien été sauvegardés dans votre dossier de référence MATLAB.');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','OK',...
               'Callback','delete(gcf)');
end
```

#### f) - vector2angle

Comme son nom l'indique, cette fonction nous a permis à partir de la définition de 2 vecteurs (ici cuisse et jambe) de calculer directement l'angle entre ceux-cis. 

```html
function angle_in_degrees = vector2angle(u,v)
  
  a= sqrt(u(1)^2+u(2)^2+u(3)^2);
  b=sqrt(v(1)^2+v(2)^2+v(3)^2);
  c=0;
  
  for i=1:1:numel(u)
      c=c+u(i)*v(i);
  
  end
  
  angle_in_degrees=acos(c/(a*b))*180/pi
  
end
```
