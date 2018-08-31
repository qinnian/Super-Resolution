function output = MSE( X, Y )
%������ͼ��ľ�����MSE��Mean Squared Error��
%   X - ԭͼX
%   Y - ��������ͼ��Y
%   output - ���MSE
[M, N] = size(X);
output = 0;
X = double(X);
Y = double(Y);
for i = 1 : M
    for j = 1 : N
        output = output + (X(i, j) - Y(i, j))^2;
    end
end
output = sqrt(output / (M * N));

end

