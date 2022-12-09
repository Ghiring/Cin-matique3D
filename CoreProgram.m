% ATTENTION : ce programme nécessite absolument les fichiers contenant les fonctions externes associées pour fonctionner.

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

message = "Pour quels marqueurs voulez-vous obtenir des informations ?";
options = ["LDPI" "LFAL" "LFAX" "LFCC" "LFLE" "LFTC" "RDPI" "RFAL" "RFAX" "RFCC" "RFLE" "RFTC" "TOUS"];
choice = menu(message,options);

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

elseif choice == 2

    TDR_Mq(MqLFAL, 'MqLFAL')
    savefig('DeplacementLFAL.fig')
    interlis(MqLFAL, Data);
    savefig('Interpolation_LFAL')
    clf;
    plot3(MqLFAL(:,2),MqLFAL(:,4),MqLFAL(:,3))
        title("Déplacement dans l'espace du marqueur LFAL")
        savefig('Modélisation_LFAL')
    mydialog3

elseif choice == 3 

    TDR_Mq(MqLFAX, 'MqLFAX')
    savefig('DeplacementLFAX.fig')
    interlis(MqLFAX, Data);
    savefig('Interpolation_LFAX')
    clf;
    plot3(MqLFAX(:,2),MqLFAX(:,4),MqLFAX(:,3))
        title("Déplacement dans l'espace du marqueur LFAX")
        savefig('Modélisation_LFAX')
    mydialog3

elseif choice == 4 

    TDR_Mq(MqLFCC, 'MqLFCC')
    savefig('DeplacementLFCC.fig')
    interlis(MqLFCC, Data);
    savefig('Interpolation_LFCC')
    clf;
    plot3(MqLFCC(:,2),MqLFCC(:,4),MqLFCC(:,3))
        title("Déplacement dans l'espace du marqueur LFCC")
        savefig('Modélisation_LFCC')
    mydialog3

elseif choice == 5 

    TDR_Mq(MqLFLE, 'MqLFLE')
    savefig('DeplacementLFLE.fig')
    interlis(MqLFLE, Data);
    savefig('Interpolation_LFLE')
    clf;
    plot3(MqLFLE(:,2),MqLFLE(:,4),MqLFLE(:,3))
        title("Déplacement dans l'espace du marqueur LFLE")
        savefig('Modélisation_LFLE')
    mydialog3

elseif choice == 6 

    TDR_Mq(MqLFTC, 'MqLFTC')
    savefig('DeplacementLFTC.fig')
    interlis(MqLFTC, Data);
    savefig('Interpolation_LFTC')
    clf;
    plot3(MqLFTC(:,2),MqLFTC(:,4),MqLFTC(:,3))
        title("Déplacement dans l'espace du marqueur LFTC")
        savefig('Modélisation_LFTC')
    mydialog3

elseif choice == 7 

    TDR_Mq(MqRDPI, 'MqRDPI')
    savefig('DeplacementRDPI.fig')
    interlis(MqRDPI, Data);
    savefig('Interpolation_RDPI')
    clf;
    plot3(MqRDPI(:,2),MqRDPI(:,4),MqRDPI(:,3))
        title("Déplacement dans l'espace du marqueur RDPI")
        savefig('Modélisation_RDPI')
    mydialog3

elseif choice == 8

    TDR_Mq(MqRFAL, 'MqRFAL')
    savefig('DeplacementRFAL.fig')
    interlis(MqRFAL, Data);
    savefig('Interpolation_RFAL')
    clf;
    plot3(MqRFAL(:,2),MqRFAL(:,4),MqRFAL(:,3))
        title("Déplacement dans l'espace du marqueur RFAL")
        savefig('Modélisation_RFAL')
    mydialog3

elseif choice == 9 

    TDR_Mq(MqRFAX, 'MqRFAX')
    savefig('DeplacementRFAX.fig')
    interlis(MqRFAX, Data);
    savefig('Interpolation_RFAX')
    clf;
    plot3(MqRFAX(:,2),MqRFAX(:,4),MqRFAX(:,3))
        title("Déplacement dans l'espace du marqueur RFAX")
        savefig('Modélisation_RFAX')
    mydialog3

elseif choice == 10

    TDR_Mq(MqRFCC, 'MqRFCC')
    savefig('DeplacementRFCC.fig')
    interlis(MqRFCC, Data);
    savefig('Interpolation_RFCC')
    clf;
    plot3(MqRFCC(:,2),MqRFCC(:,4),MqRFCC(:,3))
        title("Déplacement dans l'espace du marqueur RFCC")
        savefig('Modélisation_RFCC')
    mydialog3

elseif choice == 11

    TDR_Mq(MqRFLE, 'MqRFLE')
    savefig('DeplacementRFLE.fig')
    interlis(MqRFLE, Data);
    savefig('Interpolation_RFLE')
    clf;
    plot3(MqRFLE(:,2),MqRFLE(:,4),MqRFLE(:,3))
        title("Déplacement dans l'espace du marqueur RFLE")
        savefig('Modélisation_RFLE')
    mydialog3

elseif choice == 12

    TDR_Mq(MqRFTC, 'MqRFTC')
    savefig('DeplacementRFTC.fig')
    interlis(MqRFTC, Data);
    savefig('Interpolation_RFTC')
    clf;
    plot3(MqRFTC(:,2),MqRFTC(:,4),MqRFTC(:,3))
        title("Déplacement dans l'espace du marqueur RFTC")
        savefig('Modélisation_RFTC')
    mydialog3

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

f = figure;

XD = [GraphGlob(:,1) GraphGlob(:,4) GraphGlob(:,7) GraphGlob(:,10) GraphGlob(:,13) GraphGlob(:,16)];
XG = [GraphGlob(:,19) GraphGlob(:,22) GraphGlob(:,25) GraphGlob(:,28) GraphGlob(:,31) GraphGlob(:,34)];

CorrCroisX = xcorr2(XD,XG);
plot(CorrCroisX)
    title("CorrPlot en X")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')

f = figure;

YD = [GraphGlob(:,2) GraphGlob(:,5) GraphGlob(:,8) GraphGlob(:,11) GraphGlob(:,14) GraphGlob(:,17)];
YG = [GraphGlob(:,20) GraphGlob(:,23) GraphGlob(:,26) GraphGlob(:,29) GraphGlob(:,32) GraphGlob(:,35)];

CorrCroisX = xcorr2(YD,YG);
plot(CorrCroisX)
    title("CorrPlot en Y")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')

f = figure;

ZD = [GraphGlob(:,3) GraphGlob(:,6) GraphGlob(:,9) GraphGlob(:,12) GraphGlob(:,15) GraphGlob(:,18)];
ZG = [GraphGlob(:,21) GraphGlob(:,24) GraphGlob(:,27) GraphGlob(:,30) GraphGlob(:,33) GraphGlob(:,36)];

CorrCroisX = xcorr2(ZD,ZG);
plot(CorrCroisX)
    title("CorrPlot en Z")
    legend('LDPI','LFAL','LFAX','LFCC','LFLE','LFTC','RDPI','RFAL','RFAX','RFCC','RFLE','RFTC')

% RFTC --> RFLE = vecteur cuisse 
% RFAL --> RFAX = vecteur jambe

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

Angles_totaux_CJ_G = Angles_totaux_CJ_G';
Angles_totaux_CJ_D = Angles_totaux_CJ_D';

f = figure;
plot(Data(:,2),Angles_totaux_CJ_D,Data(:,2),Angles_totaux_CJ_G)
    legend('Côté gauche','Côté droit')
    xlabel("Temps (s)")
    ylabel("Angle (°)")
    title("Évolution de l'angle du genou en fonction du temps")

end




