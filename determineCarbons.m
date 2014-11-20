function output=determineCarbons(coefficients,data,distribution)
coefficients(end+1)=1-sum(coefficients);%normalize all coefficients to 1
output=sum((data-(distribution'*coefficients')').^2);