function TDR_Mq(M,nom)

    M(isnan(M))=0;                                  % Taux de reconstruction
    Nb_0 = length(find(M(:,2:end)==0));
    Nb_elem = 3*height(M);
    TDR = 100-((Nb_0/(Nb_elem))*100);
    
    X = ['Le taux de reconstruction du marqueur ', nom, ' est de ', num2str(TDR), ' %'];
    disp(X)

    M_X = subplot(2,2, [3,4]);                          % Déplacements selon les 2 axes
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

