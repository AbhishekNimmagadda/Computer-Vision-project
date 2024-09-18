%this function performs ReLU
function [outarray] = apply_relu(inarray)
    for k = 1:size(inarray,3)
      for j = 1:size(inarray,2)
        for i = 1:size(inarray,1)
          outarray(i,j,k) = max(inarray(i,j,k),0);
        end;
      end;
    end;