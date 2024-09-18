%Loading all relevant information
Camera1Param = load('Parameters_V1_1.mat');
Camera2Param = load('Parameters_V2_1.mat');
load('mocapPoints3D.mat');
%{
%########################## Task 3_1 ##########################
%Here we pass the task3_1 function the 3D points and the camera Parameters
%and recieve 2D pixel cordinates and we plot them on the image to display
%its functionality
Camera1Points = task3_1(pts3D,Camera1Param.Parameters);
figure(1);imshow('im1corrected.jpg');
axis on
hold on;
for i=1:39
        plot(Camera1Points(1,i),Camera1Points(2,i),'r+','MarkerSize',4,'LineWidth',2);
end
%Repeating the Same with the other cameras image
Camera2Points = task3_1(pts3D,Camera2Param.Parameters);
figure(2);imshow('im2corrected.jpg');
figure(2); axis on
hold on;
for i=1:39
       plot(Camera2Points(1,i),Camera2Points(2,i),'r+','MarkerSize',4,'LineWidth',2);
end
%}

%{
%########################## Task 3_2 ##########################
%In this we take the 2d pixel points from previous task and re create the
%3d world coordinates and in order to verify that we calculate the net
%distance between the points recieved vs the the actual points and divide
%them by to tal number of points to get the distance.
calcPts3D = [];
error_distance = 0;
for i = 1:39
    calcPts3D(:,i) = task3_2(Camera1Points(:,i),Camera2Points(:,i),Camera1Param.Parameters,Camera2Param.Parameters);
    % formula to calculate distance sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)
    error_distance = error_distance+sqrt(((calcPts3D(1,i)-pts3D(1,i)).^2)+((calcPts3D(2,i)-pts3D(1,i)).^2)+((calcPts3D(3,i)-pts3D(1,i)).^2));
end
error_distance = error_distance/39;
disp("the error distance in mm is :");
disp(error_distance);
%}


%########################## Task 3_3 ##########################
% carried out under the task3_3.m file


%{
%########################## Task 3_4 ##########################
% the purpose of this task is to generate the fundamentaol matrix using the
% two camera parameters;
F = task3_4(Camera1Param, Camera2Param);
disp("The fundamental matrix derived by us is as:");
disp(F);

%below is code from 8 point algorithm that professor provided to plot
%epipolar lines of upto 8 points using our fundamental matrix
%one may pick any number of points < 8 in both images and the below code
%plots the epipolar lines using our fundamental matrix
image = imread('im1corrected.jpg');
image2 = imread('im2corrected.jpg');
figure(1); imagesc(image); axis image; drawnow;
figure(2); imagesc(image2); axis image; drawnow;
figure(1); [x1,y1] = getpts;
figure(1); imagesc(image); axis image; hold on
for i=1:length(x1)
   h=plot(x1(i),y1(i),'*'); set(h,'Color','g','LineWidth',2);
   text(x1(i),y1(i),sprintf('%d',i));
end
hold off
drawnow;

figure(2); imagesc(image2); axis image; drawnow;
[x2,y2] = getpts;
figure(2); imagesc(image2); axis image; hold on
for i=1:length(x2)
   h=plot(x2(i),y2(i),'*'); set(h,'Color','g','LineWidth',2);
   text(x2(i),y2(i),sprintf('%d',i));
end
hold off
drawnow;


colors =  'bgrcmykbgrcmykbgrcmykbgrcmykbgrcmykbgrcmykbgrcmyk';
%overlay epipolar lines on im2
L = F * [x1' ; y1'; ones(size(x1'))];
[nr,nc,nb] = size(image2);
figure(2); clf; imagesc(image2); axis image;
hold on; plot(x2,y2,'*'); hold off
for i=1:length(L)
    a = L(1,i); b = L(2,i); c=L(3,i);
    if (abs(a) > (abs(b)))
       ylo=0; yhi=nr; 
       xlo = (-b * ylo - c) / a;
       xhi = (-b * yhi - c) / a;
       hold on
       h=plot([xlo; xhi],[ylo; yhi]);
       set(h,'Color',colors(i),'LineWidth',2);
       hold off
       drawnow;
    else
       xlo=0; xhi=nc; 
       ylo = (-a * xlo - c) / b;
       yhi = (-a * xhi - c) / b;
       hold on
       h=plot([xlo; xhi],[ylo; yhi],'b');
       set(h,'Color',colors(i),'LineWidth',2);
       hold off
       drawnow;
    end
end


%overlay epipolar lines on im1
L = ([x2' ; y2'; ones(size(x2'))]' * F)' ;
[nr,nc,nb] = size(image);
figure(1); clf; imagesc(image); axis image;
hold on; plot(x1,y1,'*'); hold off
for i=1:length(L)
    a = L(1,i); b = L(2,i); c=L(3,i);
    if (abs(a) > (abs(b)))
       ylo=0; yhi=nr; 
       xlo = (-b * ylo - c) / a;
       xhi = (-b * yhi - c) / a;
       hold on
       h=plot([xlo; xhi],[ylo; yhi],'b');
       set(h,'Color',colors(i),'LineWidth',2);
       hold off
       drawnow;
    else
       xlo=0; xhi=nc; 
       ylo = (-a * xlo - c) / b;
       yhi = (-a * xhi - c) / b;
       hold on
       h=plot([xlo; xhi],[ylo; yhi],'b');
       set(h,'Color',colors(i),'LineWidth',2);
       hold off
       drawnow;
    end
end



for j=1:3
    for i=1:3
        fprintf('%10g ',10000*F(j,i));
    end
    fprintf('\n');
end
%}


%{
%########################## Task 3_5 ##########################
% the purpose of this task is to generate the fundamentaol matrix using the
% two camera parameters;
F = task3_5(Camera1Param, Camera2Param);
disp("The F matrix from the 8 point algorithm file provided on canvas");
disp(F);
%}

%{
%########################## Task 3_6_1 ##########################

% In this we are finding the SED error for both the fundamental matrix recieved from
% task3_4 and task3_5 and compare them
F = task3_4(Camera1Param, Camera2Param);
disp(task3_6_1(Camera1Param.Parameters,Camera2Param.Parameters,pts3D,F));%1.73*e+04

F = task3_5(Camera1Param, Camera2Param);
disp(task3_6_1(Camera1Param.Parameters,Camera2Param.Parameters,pts3D,F));%1.43e+08

%we see that the SED error is small for our method of calculating the
%Fundamental matrix in comoared to the one provided to us by professor.
%}
