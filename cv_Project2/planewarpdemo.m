%read source image
source = imread("im1corrected.jpg");
[nr,nc,nb] = size(source);


%make new image
dest = zeros(200,300,nb);

%click four points in source
figure(1); colormap(gray); clf;
imagesc(source);
axis image
[xpts,ypts] = ginput(4);

% choose points inorder to get rectangle shape by picking smallest
% and biggest x and y
minx=min(xpts);
miny=min(ypts);
maxx=max(xpts);
maxy=max(ypts);

% plug them into the rectangle shape
xp1 = (minx/nc)*300;
yp1 = (miny/nr)*200;
xp2 = xp1+((maxx/nc)*300);
yp2 = yp1+((maxy/nr)*200);
xprimes = [xp1 xp2 xp2 xp1]';
yprimes = [yp1 yp1 yp2 yp2]';
disp(xprimes);
disp(yprimes);

%compute homography (from im2 to im1 coord system)
p1 = xpts; p2 = ypts;
p3 = xprimes; p4 = yprimes;
vec1 = ones(size(p1,1),1);
vec0 = zeros(size(p1,1),1);
Amat = [p3 p4 vec1 vec0 vec0 vec0 -p1.*p3 -p1.*p4; vec0 vec0 vec0 p3 p4 vec1 -p2.*p3 -p2.*p4];
bvec = [p1; p2];
h = Amat \ bvec;
fprintf(1,'Homography:');
fprintf(1,' %.2f',h); fprintf(1,'\n');

%warp im1 forward into im2 coord system 
[xx,yy] = meshgrid(1:size(dest,2), 1:size(dest,1));
denom = h(7)*xx + h(8)*yy + 1;
hxintrp = (h(1)*xx + h(2)*yy + h(3)) ./ denom;
hyintrp = (h(4)*xx + h(5)*yy + h(6)) ./ denom;
for b = 1:nb
 dest(:,:,b) = interp2(double(source(:,:,b)),hxintrp,hyintrp,'linear')/255.0;
end

%display result
imagesc(dest);
