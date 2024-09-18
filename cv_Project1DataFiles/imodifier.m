% x coordinate position finder
function [val] = imodifier(i)
    val = 0;
    while i>1
        val = val + 1;
        i = i-1;
    end;