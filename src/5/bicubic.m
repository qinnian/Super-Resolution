function output_img = bicubic( input_img, height, width )
%ʹ��˫���β�ֵ����ͼ������

%�ж������ǻҶ�ͼ����RGBͼ�񣬲�������Ӧ�Ĵ���
s = size(input_img);
if numel(s) > 2
    %ȷ��ΪRGB��ɫͼ�񣬷ֱ������ͨ������˫���β�ֵ
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
    R_ = bicubic_gray(R, height, width);
    G_ = bicubic_gray(G, height, width);
    B_ = bicubic_gray(B, height, width);
    output_img(:,:,1) = R_;
    output_img(:,:,2) = G_;
    output_img(:,:,3) = B_;
else
    %ȷ��Ϊ�Ҷ�ͼ��ֱ�ӽ���˫���β�ֵ
    output_img = bicubic_gray(input_img, height, width);
end
end

