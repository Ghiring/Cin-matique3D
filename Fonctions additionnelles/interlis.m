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