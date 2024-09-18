load 'debuggingTest.mat'
load 'CNNparameters.mat'
% Apply CNN Computations runs through all the layers to obtain the expected
% value
% Uncomment to print the expected vs actual results in each layer
%{
%####### TEST-1 #########
outImg = apply_imnormalize(imrgb);
figure; imagesc(outImg);
figure; imagesc(layerResults{1});

%####### TEST-2 #########
outImg = apply_convolve(outImg,filterbanks{2},biasvectors{2});
figure; montage(outImg)
figure; montage(layerResults{2});
%{
figure; montage(outImg)
figure; montage(layerResults{2});
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{2}(:,:,i));
end
%}

%####### TEST-3 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{3});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{3}(:,:,i));
end
%}

%####### TEST-4 #########
outImg = apply_convolve(outImg,filterbanks{4},biasvectors{4});
figure; montage(outImg)
figure; montage(layerResults{4});

%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{4}(:,:,i));
end
%}

%####### TEST-5 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{5});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{5}(:,:,i));
end
%}

%####### TEST-6 #########
outImg = apply_maxpool(outImg);
figure; montage(outImg)
figure; montage(layerResults{6});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{6}(:,:,i));
end
%}

%####### TEST-7 #########
outImg = apply_convolve(outImg,filterbanks{7},biasvectors{7});
figure; montage(outImg)
figure; montage(layerResults{7});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{7}(:,:,i));
end
%}


%####### TEST-8 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{8});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{8}(:,:,i));
end
%}


%####### TEST-9 #########
outImg = apply_convolve(outImg,filterbanks{9},biasvectors{9});
figure; montage(outImg)
figure; montage(layerResults{9});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{9}(:,:,i));
end
%}

%####### TEST-10 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{10});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{10}(:,:,i));
end
%}


%####### TEST-11 #########
outImg = apply_maxpool(outImg);
figure; montage(outImg)
figure; montage(layerResults{11});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{11}(:,:,i));
end
%}


%####### TEST-12 #########
outImg = apply_convolve(outImg,filterbanks{12},biasvectors{12});
figure; montage(outImg)
figure; montage(layerResults{12});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{12}(:,:,i));
end
%}


%####### TEST-13 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{13});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{13}(:,:,i));
end
%}

%####### TEST-14 #########
outImg = apply_convolve(outImg,filterbanks{14},biasvectors{14});
figure; montage(outImg)
figure; montage(layerResults{14});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{14}(:,:,i));
end
%}
%####### TEST-15 #########
outImg = apply_relu(outImg);
figure; montage(outImg)
figure; montage(layerResults{15});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{15}(:,:,i));
end
%}

%####### TEST-16 #########
outImg = apply_maxpool(outImg);
figure; montage(outImg)
figure; montage(layerResults{16});
%{
for i = 1:10
    figure; imshow(outImg(:,:,i));
end
for i = 1:10
    figure; imshow(layerResults{16}(:,:,i));
end
%}

%####### TEST-17 #########
outImg = apply_fullconnect(outImg,filterbanks{17},biasvectors{17});
figure; montage(outImg)
figure; montage(layerResults{17});

%####### TEST-18 #########
outImg = apply_softmax(outImg);
figure; montage(outImg)
figure; montage(layerResults{18});
%}

% ############# Test Case Given (Airplane) #######################
outImg = apply_CNNcomputaions(imrgb);
disp("Actual Output")
disp(outImg(:,:,1))
disp(max(outImg))
disp("Expected Output")
disp(layerResults{18}(:,:,1))
disp(max(layerResults{18}))


%############# Testing Image From Internet ######################
im = imread('Truck.png');
im = double(im);
im_updated = imresize(im,[32 32]);
size(im_updated)

outImage = apply_CNNcomputaions(im_updated);
%#Classified an image of a truck from the internet as a ship!!However, 
% the k-2 class is a truck. We see that it isn't that accurate for 
% a random image on the internet.
disp(max(outImage))
disp(outImage(:,:,10))


