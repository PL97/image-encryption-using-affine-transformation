function result=shelter(I, x)
    h = length(I(1,:));
    w = length(I(:, 1));
    temp1 = zeros(fix(w/x), h);
    temp2 = ones(w -fix(w/x) , h);
    result = [temp1; temp2];
    result = result.*I;