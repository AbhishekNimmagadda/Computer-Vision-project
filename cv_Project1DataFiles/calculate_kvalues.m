%this function calculates k values
function [updatedKList] = calculate_kvalues(percentages,class)
    listPercent = [];
    for i = 1:10
        listPercent = [listPercent; i percentages(1,1,i)];
    end
   % for i = 1:10
    %    listPercent(i,2);
    %end
    %disp("#######")
    %disp(listPercent(1,2));
    %updatedKList = 0;
    %disp(flip(sortrows(listPercent,2)))
    listPercent = flip(sortrows(listPercent,2));
    for k = 1:10
        updatedKList(k)=0;
        for i = 1:k
            if listPercent(i,1)==class
                updatedKList(k)=1;
            end
        end
    end