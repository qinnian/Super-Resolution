function [ classID, center, V ] = Kmeans( feature, k )
%k-means���࣬��������������Ҫ�۵�������k��
%����ÿ�������������ڵ�����ÿ�����������������
[m, n] = size(feature);
ma = zeros(m, 1);
mi = zeros(m, 1);
center = zeros(m, k);
%������ɳ�ʼ��������
for i = 1:m
    ma(i) = max(feature(i,:));
    mi(i) = min(feature(i,:));
    for j = 1:k
        center(i, j) = mi(i) + (ma(i)-mi(i))*rand();
    end
end

t = 0;
while true
    classID = ones(n, 1);
    %��¼ÿ�����������ж��ٸ���������
    count = zeros(k, 1);
    %ÿ���������������
    V = cell(k, 1);
    for i = 1:k
        V{i} = zeros(m, round(min(5*n/k, n)));
    end
    
    t = t+1;
    fprintf('t = %d\t', t);
    pre_center = center;
    for i = 1:n
        minDistance = MSE(feature(:,i), pre_center(:,1));
        %���ÿ���������������ľ����
        for j = 2:k
            d = MSE(feature(:,i), pre_center(:,j));
            if d < minDistance
                minDistance = d;
                classID(i) = j;
            end
        end
    end
    
    %���µ��������������͸����������������V
    %���������������������������ͬһ�࣬������µ���������
    for i = 1:n
        ID = classID(i);
        count(ID) = count(ID) + 1;
        V{ID}(:,count(ID)) = feature(:,i);
    end
    %�������ֵȥ��
    for i = 1:k
        V{i} = V{i}(:,1:count(i));
    end
    %��������������
    for i = 1:k
        center(:,i) = mean((V{i}'));
        if isnan(center(1,i))
            randv = zeros(m, 1);
            for j = 1:m
                randv(j) = mi(j) + (ma(j)-mi(j))*rand();
            end
            center(:,i) = randv;
        end
    end
    
    %����Ѿ���������break
    mse = MSE(pre_center, center);
    fprintf('MSE = %f\n', mse);
    if  mse < 0.1
        break;
    end
end

end

