%this function performs maxpool
function [outarray] = apply_maxpool(inarray)
    for k = 1:size(inarray,3)
      for j = 1:(size(inarray,2)/2)
        for i = 1:(size(inarray,1)/2)
          m = max(inarray(i+imodifier(i),j+jmodifier(j),k),inarray(i+imodifier(i)+1,j+jmodifier(j),k));
          m = max(m,inarray(i+imodifier(i),j+jmodifier(j)+1,k));
          m = max(m,inarray(i+imodifier(i)+1,j+jmodifier(j)+1,k));
          outarray(i,j,k) = m;
        end;
      end;
    end;
