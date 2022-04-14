function sum = exponentialMatrix(A)
    sum = A^0;
    nA = A^0;
    fact = 1;
    for k = 1:30
        nA = nA*A;
        fact = fact*k;
        sum = sum + (nA/fact);
    end 
end 