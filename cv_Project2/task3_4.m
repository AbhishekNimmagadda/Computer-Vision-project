%In this we calculate the fundamental matrix using the two camera
%parameters provided to us
function [F] = task3_4(Camera1Param, Camera2Param)
    RotationOfC1World = Camera1Param.Parameters.Rmat;
    RotationOfC1World(4,1)=0;
    RotationOfC1World(4,2)=0;
    RotationOfC1World(4,3)=0;
    RotationOfC1World(4,4)=1;
    RotationOfC1World(1,4)=0;
    RotationOfC1World(2,4)=0;
    RotationOfC1World(3,4)=0;% we generate our rotaion matrix to be of size 4x4
    % we get our tx ty tz below by multiplying it with the camera positions
    % in matrix as below
    T = RotationOfC1World *[1 0 0 -Camera1Param.Parameters.position(1); 0 1 0 -Camera1Param.Parameters.position(2); 0 0 1 -Camera1Param.Parameters.position(3); 0 0 0 1]*[Camera2Param.Parameters.position(1); Camera1Param.Parameters.position(2); Camera1Param.Parameters.position(3); 1]; 
    % we get our translational matrix
    s=[0 -T(3) T(2); T(3) 0 -T(1); -T(2) T(1) 0];
    % we get our rotational matrix
    R = (Camera1Param.Parameters.Rmat * inv(Camera2Param.Parameters.Rmat))';
    E=R*s;% we find our essential matrix by E = R*S
    % Finally we find our fundamental matrix by multiplying it with inv(K
    % mat of camera 1) transposed with E and multiplied by inv(Kmat of
    % camera 2)
    F = inv(Camera1Param.Parameters.Kmat)' * E * inv(Camera2Param.Parameters.Kmat);
    
   