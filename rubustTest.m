function result=rubustTest(I, p)
    result = I.*(1 + p*rand (length(I(:,1)), length(I(1, :))));
    