%kmeans���࣬��������ӳ�����C
load LRfeature;
% [classID, feature, count] = Kmeans(LRfeature, 512);
opts = statset('Display','iter','MaxIter',500);
[classID, featureCenter] = kmeans(LRfeature',512,'emptyaction','drop','options',opts);
% [classID, featureCenter, V] = Kmeans(LRfeature,512);
save classID classID;
save featureCenter featureCenter;
% save V;
