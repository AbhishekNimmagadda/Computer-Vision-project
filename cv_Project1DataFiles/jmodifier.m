% y coordinate position finder
function [val] = jmodifier(j)
    val = 0;
    while j>1
        val = val + 1;
        j = j-1;
    end;
    
