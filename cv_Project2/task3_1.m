%this function takes in the 3d world coordinates ands generates their 2D
%pixel coordinates
function [xyPlots] = task3_1(pts3D,Parameters)
    for i = 1:39%iterates over the 39 world coordinates
        worldCord = pts3D(:,i);
        worldCord(4,1)=1;
        %pixel coordinates = Kmat*Pmat*world cordinates 
        %Pmat is the rotaion matrix x camera position 
        pixelCords = Parameters.Kmat*Parameters.Pmat*worldCord;
        %Now we make the z coordinate = 1 by dividing all be the third
        %coordinate
        pixelCords(1,1)=pixelCords(1,1)/pixelCords(3,1);
        pixelCords(2,1)=pixelCords(2,1)/pixelCords(3,1);
        pixelCords(3,1)=pixelCords(3,1)/pixelCords(3,1);
        xyPlots(:,i)=pixelCords;
    end
    %now these 2D pixel points are returned
