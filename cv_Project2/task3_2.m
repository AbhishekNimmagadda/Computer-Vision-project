% this function takes in the 2D pixel coordinates of the same point in the
% image and converts it into 3d pixel coordinates using triangulation
function [pts] = task3_2(Camera1Points,Camera2Points,Parameters1,Parameters2)
    Camera1View = Parameters1.Rmat'*inv(Parameters1.Kmat)*Camera1Points;%u1
    Camera2View = Parameters2.Rmat'*inv(Parameters2.Kmat)*Camera2Points;%u2
    prod = cross(Camera1View,Camera2View);% perform u1 x u2
    normalizedView = prod/norm(prod);% u3 = (u1 x u2)/||(u1 x u2)||
    CameraDistance = Parameters2.position - Parameters1.position;%c2-c1
    CameraViews = [Camera1View Camera2View normalizedView];
    %(a*u1)+(d*u3)-(b*u2) = c2-c1
    abdVals = inv(CameraViews)*CameraDistance';
    a = abdVals(1);
    b = abdVals(2);
    d = abdVals(3);
    p1 = (a*Camera1View)+Parameters1.position'; %p1 = c1+(a*u1)
    p2 = (-b*Camera2View)+Parameters2.position'; %p2 = c2+(b*u2)
    pts = (p1+p2)/2; %p=(p1+p2)/2
    %hence we get the 3d points by triangulation


