function [Az,Bz,Cz]=deltaprinter(X,Y,Z)
%% Delta Printer Inverse Kinematics
% Function takes in desired X Y Z as input and gives required positions Az
% Bz and Cz of vertically moving carriages
% Author: Varun Uday Nayak %
%% Delta Printer Constants
L=250; %arm length
Hez=39.87; %extruder vertical offset
Aeox=0; %extruder horizontal offsets
Aeoy=-20.33;
Beox=-20.33*cos(30*pi/180);
Beoy=20*sin(30*pi/180);
Ceox=20*cos(30*pi/180); 
Ceoy=20*sin(30*pi/180);
Apx=0; %pivotoffsets
Apy=139.09;
Bpx=139.09*cos(30*pi/180);
Bpy=-139.09*sin(30*pi/180);
Cpx=-139.09*cos(30*pi/180);
Cpy=-139.09*sin(30*pi/180);
Avx=Aeox+Apx; %total arm offset
Avy=Aeoy+Apy;
Bvx=Beox+Bpx;
Bvy=Beoy+Bpy;
Cvx=Ceox+Cpx;
Cvy=Ceoy+Cpy;
%% The restrictions on Z axis angle movement
Aex=X-Aeox;
Aey=Y-Aeoy;
Bex=X-Beox;
Bey=Y-Beoy;
Cex=X-Ceox;
Cey=Y-Ceoy;
if not((abs(atan((Aex-Apx)/(Aey-Apy)))<pi/3) &(abs(pi/6+atan((Bey-Bpy)/(Bex-Bpx)))<pi/3)& (abs(atan((Cey-Cpy)/(Cex-Cpx))-pi/6)<pi/3))
    %error('Z arm error: Beyond Configuration Space. Try another X,Y,Z next time');
     Az=0;
    Bz=0;
    Cz=0;
    return
end
%% Calculating Az Bz and Cz
Az=Z+Hez+sqrt(L^2-(X-Avx)^2-(Y-Avy)^2);
Bz=Z+Hez+sqrt(L^2-(X-Bvx)^2-(Y-Bvy)^2);
Cz=Z+Hez+sqrt(L^2-(X-Cvx)^2-(Y-Cvy)^2);        
%% Checking whether desired X,Y,Z lies in configuration space      
if not(Az<470 & Az>150 & Bz<470 & Bz>150 & Cz<470 & Cz>150)
    %error('Carriage error: Beyond Configuration Space. Try another X,Y,Z next time');
    Az=0;
    Bz=0;
    Cz=0;
    return
end
Ad=sqrt((X-Avx)^2+(Y-Avy)^2);
Bd=sqrt((X-Bvx)^2+(Y-Bvy)^2);
Cd=sqrt((X-Cvx)^2+(Y-Cvy)^2);
Acz=Az-Hez-Z;
Bcz=Bz-Hez-Z;
Ccz=Cz-Hez-Z;
if not(atan(Acz/Ad)<80*pi/180 & atan(Acz/Ad)>35*pi/180 & atan(Bcz/Bd)<80*pi/180 & atan(Bcz/Bd)>35*pi/180 & atan(Ccz/Cd)<80*pi/180 & atan(Ccz/Cd)>35*pi/180)
    %error('XY Arm Error: Beyond Configuration Space. Try another X,Y,Z next time');
     Az=0;
    Bz=0;
    Cz=0;
    return
end
end


