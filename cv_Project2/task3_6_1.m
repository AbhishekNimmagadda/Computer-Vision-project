%In this we calculate the SED mean error of the distance of the point in
%the image from the epipolar line obtained by using the fundamental matrix
%provided
function [SEDMean] = task3_6_1(Parameters1,Parameters2,pts3D,F)
    pointInCamera1 = task3_1(pts3D,Parameters1);%fetching points in image 1 
    pointInCamera2 = task3_1(pts3D,Parameters2);%fetching points in image 2
    SEDMean = 0;
    for i = 1:39
        %finding epipolar line in image 2 using image 1 points
        epipolarLine = F*pointInCamera1(:,i);
        SEDMean = SEDMean + abs((epipolarLine(1)*pointInCamera2(1 , i))+(epipolarLine(2)*pointInCamera2(2 , i))+epipolarLine(3))/sqrt((epipolarLine(1)*epipolarLine(1))+(epipolarLine(2)*epipolarLine(2))).^2;
        %finding epipolar line in image 1 using image 2 points
        epipolarLine = transpose(F)*pointInCamera2(i);
        SEDMean = SEDMean + abs((epipolarLine(1)*pointInCamera1(1 , i))+(epipolarLine(2)*pointInCamera1(2 , i))+epipolarLine(3))/sqrt((epipolarLine(1)*epipolarLine(1))+(epipolarLine(2)*epipolarLine(2))).^2;
    end
    SEDMean = SEDMean/78;
