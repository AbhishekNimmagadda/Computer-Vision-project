%this function generates table and calculates accuracy
function [accuracy] = calculate_accuracy()
    load 'cifar10testdata.mat'
    %some sample code to read and display one image from each class
    kValues = [0 0 0 0 0 0 0 0 0 0];
    trackTable = [0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0;];
    for classindex = 1:10
        disp("########")
        disp(classlabels{classindex})
        inds = find(trueclass==classindex);
        for imgNumb = 1:size(inds,2)
            img = imageset(:,:,:,inds(imgNumb));
            outVal = apply_CNNcomputaions(img);
            max = 0;
            highestPercentAt = 0;
            for j = 1:10
                if max < outVal(1,1,j)
                    max= outVal(1,1,j);
                    highestPercentAt = j;
                end
            end
            trackTable(classindex,highestPercentAt) = trackTable(classindex,highestPercentAt) + 1;
            kListVals = calculate_kvalues(outVal,classindex);
            for i=1:10
                if kListVals(i)==1
                    kValues(i) = kValues(i) + 1;
                end
            end
        end
    end
    % Prints the confusion matrix
    trackTable

    %>>>>>>>>>>Accuracy calculations
    totalsum = 0;
    correctsum = 0;
    for i = 1:10
        for j = 1:10
            if i==j
                correctsum = correctsum+trackTable(j,i);
            end
            totalsum = totalsum + trackTable(j,i);
        end
    end
    accuracy = correctsum/totalsum
    %display k bar
    for i = 1:10
        kValues(i) =  kValues(i)/100;
    end
    % Outputs a bar graph of the top k-classes
    bar(kValues);
