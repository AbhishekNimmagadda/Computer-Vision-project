%this function performs softmax
function [outarray] = apply_softmax(inarray)
    alpha = inarray(1,1,1);
    for k = 1:size(inarray,3)
        alpha = max(alpha,inarray(1,1,k));
    end;
    denom = 0;
    for k = 1:size(inarray,3)
        denom = denom + exp(inarray(1,1,k) - alpha);
    end;
    for k = 1:size(inarray,3)
        outarray(1,1,k) = (exp(inarray(1,1,k) - alpha))/denom;
    end;