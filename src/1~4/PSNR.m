function output = PSNR( input_img1, input_img2 )
%��ֵ�����PSNR��Peak Signal-to-Noise Ratio��������ͼ��1��ͼ��2��PSNR
%   input_img1 - ����ͼ��1
%   input_img2 - ����ͼ��2
%   output - ���PSNR

%�ж������ǻҶ�ͼ����RGBͼ�񣬲�������Ӧ�Ĵ���
s = size(input_img1);
if numel(s) > 2
    %ȷ��ΪRGB��ɫͼ�񣬽���ת����YCbCrɫ�ʿռ䣬��ȡYͨ��
    input_img1 = rgb2ycbcr(input_img1);
    input_img1 = double(input_img1(:,:,1));
end
s = size(input_img2);
if numel(s) > 2
    %ȷ��ΪRGB��ɫͼ�񣬽���ת����YCbCrɫ�ʿռ䣬��ȡYͨ��
    input_img2 = rgb2ycbcr(input_img2);
    input_img2 = double(input_img2(:,:,1));
end

output = 20*log10(255 / sqrt(MSE(input_img1, input_img2)));

end

