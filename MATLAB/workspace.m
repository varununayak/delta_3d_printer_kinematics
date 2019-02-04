%Utilizes the deltaprinter function to plot the workspace of the parallel mechanism

hold on
for X=-100:2:100
    for Y=-100:2:100        
        if (deltaprinter(X,Y,100))
            plot(X,Y,'.')
            hold on
            end       
    end
end
axis square
xlabel('X')
ylabel('Y')



                
                
