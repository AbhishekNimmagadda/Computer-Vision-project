% In this task we shall make measurements of the background objects based
% on the functions we made in the previous tasks

%Measure the 3D locations of at least 3 points on the floor and fit a 3D plane to them.  
%Verify that your computed floor plane is (roughly) the plane Z=0. 
disp("Floor Points")
FloorPoint1 = task3_2([336;708 ;1],[932; 890; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(FloorPoint1)); %(2.2490,1.9756,-0.0365) in m
disp("#########");
FloorPoint2 = task3_2([740; 820; 1],[1450; 734; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(FloorPoint2)); %(-0.2570,1.7225,-0.0192) in m
disp("#########");
FloorPoint3 = task3_2([494; 738; 1],[1122; 810; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(FloorPoint3)); %(1.3556,1.7214,-0.0397) in m
%hence we see that the z axis in all of these are very close to 0 or are
%zero

%Measure the 3D locations of at least 3 points on the wall that has white vertical stripes 
%painted on it and fit a plane.  What, approximately, is the equation of the wall plane? 
disp("Stripped Wall Points")
StripedWallPoint1 = task3_2([1132;290 ;1],[224; 174; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(StripedWallPoint1));%(3.0650,-5.5502,2.1414) in m
disp("#########");
StripedWallPoint2 = task3_2([1216; 284; 1],[362; 168; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(StripedWallPoint2));%(2.2301,-5.5154,2.2121) in m
disp("#########");
StripedWallPoint3 = task3_2([1252; 252; 1],[412; 138; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(StripedWallPoint3));%(1.9049,-5.4910,2.4451) in m
%this is along y = -5.5 plane
%hence this is an approx equation
%0.006x+0.1715y-0.009z=-0.95

%How tall is the doorway? 
disp("door way height");
DoorWayPoint = task3_2([1124; 296; 1],[216; 184; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(DoorWayPoint));%(3.1195,-5.5164,2.0825) in m
%the height of the doorway is about 2.0825 m

%How  tall  is  the  person  (or  more  precisely,  how  high  is  the  top  of  their  head  at  this 
%moment)? 
disp("person height")
PersonPoint = task3_2([578; 392; 1],[1040; 346; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(PersonPoint));%(1.4153,1.2420,1.4702) in m
%this turns out to be the height of the person 1.47 m in height



%There is a camera mounted on a tall tripod over near the striped wall; what is the 3D 
%location of the center of that camera (roughly)? 
disp("Camera Height");
cameraAlongStripedWallCenter = task3_2([1462;258 ;1],[720; 156; 1],Camera1Param.Parameters,Camera2Param.Parameters);
disp(transpose(cameraAlongStripedWallCenter));%(-0.0690,-4.8970,2.3971) in m
%the height turns out to be 2.39 m 




%This is how we were fetching the points to explore the above
%{
figure(1)
imshow('im1corrected.jpg')
[x,y] = getpts
%}


