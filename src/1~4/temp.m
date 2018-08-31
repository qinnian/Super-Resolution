zebra = imread('Set14\zebra.bmp');
%�ж������ǻҶ�ͼ����RGBͼ�񣬲�������Ӧ�Ĵ���
s = size(zebra);
if numel(s) > 2
    %ȷ��ΪRGB��ɫͼ��
    R = zebra(:,:,1);
    [M, N] = size(R);
else
    %ȷ��Ϊ�Ҷ�ͼ
    [M, N] = size(zebra);
end
zebra_LR = uint8(bicubic(zebra, round(M/3), round(N/3)));
imwrite(zebra_LR, 'LR\zebra_LR.bmp');
zebra_BI = uint8(bicubic(zebra_LR, M, N));
imwrite(zebra_BI, 'BI\zebra_BI.bmp');
psnr_zebra = PSNR(zebra, zebra_BI);
ssim_zebra = SSIM(zebra, zebra_BI);