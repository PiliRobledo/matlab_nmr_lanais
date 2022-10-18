% n es la cantidad de lineas que tiene el marco

function [A]=mascara_marco_ceros(B,n)
A=B;
[numRows,numCols] = size(B);
for j=1:n
for i=1:numRows
A(i,j)=0;
end
end
for j=1:n
for i=1:numRows
A(i,numCols-j+1)=0;
end
end
for j=1:n
for i=1:numCols
A(numRows-j+1,i)=0;
end
end
for j=1:n
for i=1:numCols
A(j,i)=0;
end
end
end