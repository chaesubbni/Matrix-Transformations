vpoint = [60,60,60];
vgain = 10000/2;
x3=0;
orbit = [0,0,20];
noRot1=2; 
degree = 30*pi/180;
 Rx = [1 0 0 0; 0 cos(degree) -sin(degree) 0; 0 sin(degree) cos(degree) 0; 0 0 0 1];
 d_2 = Rx*d;

 figure('Name','채수빈_202001720')
 for x1 = [0:0.15:20]
    clf;
    psi = noRot1 * 2 * pi * x1/20;
    Rz_u = [cos(psi) -sin(psi) 0 0; sin(psi) cos(psi) 0 0; 0 0 1 0; 0 0 0 1];
    y = Rz_u*d_2;
    
    line([y(1,:) y(1,1)], [y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0], [0 0 0], [0 0 0],'Color','r');
    line([0 0 0], [0 40 0], [0 0 0],'Color','g');
    line([0 0 0], [0 0 0], [0 0 40],'Color','k');
    
    orbit = [orbit; y(1,1),  y(2,1),  y(3,1)];
    line(orbit(:,1),orbit(:,2),orbit(:,3));
    for i = 1:1:8
        patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))],... 
        [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))],c(i));
    end
    
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('x3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60,60,60]); grid;
    pause(0.000001); 
end
   
for deg = [0:2:720]
    clf; 
    x1 = 20*deg/140 + randn(1);
    x3 = abs(20*sin(deg*pi/180)) * 3 +randn(1);
    if deg >= 180
        x3 = abs(20*sin(deg*pi/180)) * 3 - 20;
    end
    psi = deg*4*pi/180;
  
    vpoint(1) = 60*cos(psi/4);
    vpoint(2) = 60*sin(psi/4);
    
    Rz_round = [cos(psi) -sin(psi) 0 x1; sin(psi) cos(psi) 0 0; 0 0 1 x3; 0 0 0 1];
    y= Rz_round*d;
    
    
    line([y(1,:) y(1,1)], [y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([60 0 0], [0 0 0], [0 0 0],'Color','r');
    line([0 0 0], [0 60 0], [0 0 0],'Color','g');
    line([0 0 0], [0 0 0], [0 0 60],'Color','k');
    
    orbit = [orbit; y(1,1), y(2,1), y(3,1)];
    line(orbit(:,1),orbit(:,2), orbit(:,3));
    for i = 1:1:8
        patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))],... 
        [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))],c(i));
    end
   
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('x3-axis');
    axis([-150 150 -150 150 -150 150]);
    view(vpoint); grid;
    pause(0.000001); 
end
view([60 60 60]);