
%�������ѵ����ͼƬ�����������pictNames��
trainFolder = fullfile(pwd, 'Train');
dirOutput = dir(fullfile(trainFolder, '*.jpg'));
pictNames = {dirOutput.name};
save pictNames;

