%%%% Stability plot

% Specify x range and number of points
 x0 = -3;
 x1 = 3;
 Nx = 301;
 % Specify y range and number of points
 y0 = -3;
 y1 = 3;
 Ny = 301;
 % Construct mesh
 xv = linspace(x0,x1,Nx);
 yv = linspace(y0,y1,Ny);
 [x,y] = meshgrid(xv,yv);
 % Calculate z
 z = x + i*y;
 % Explicit Euler
 g = 1 + z ;
 % Calculate magnitude of g
 gmag = abs(g);
  % Implicit Euler
 g2 = 1./(1-z);
 % Calculate magnitude of g
 gmag2 = abs(g2);
 
 
 
 % Plot contours of gmag
 figure(3)
 implot(xv, yv, gmag, ' |R(z)| (stability plot)');
 axis([x0,x1,y0,y1]);
 axis('square');
 xlabel('Re(\lambda\Deltat)');
 ylabel('Im(\lambda\Deltat)');
 figure(4)
 contour(x,y,gmag,[1 1],'b','LineWidth',1.5);
 axis([x0,x1,y0,y1]);
 axis('square');
 xlabel('Re(\lambda\Deltat)');
 ylabel('Im(\lambda\Deltat)');
 figure(5)
 implot(xv, yv, gmag2, ' |R(z)| (stability plot)');
 axis([x0,x1,y0,y1]);
 axis('square');
 xlabel('Re(\lambda\Deltat)');
 ylabel('Im(\lambda\Deltat)');
 figure(6)
 contour(x,y,gmag2,[1 1],'b','LineWidth',1.5);
 axis([x0,x1,y0,y1]);
 axis('square');
 xlabel('Re(\lambda\Deltat)');
 ylabel('Im(\lambda\Deltat)');
