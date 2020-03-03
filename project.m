fileID=fopen('A_Game_of_Thrones(1).txt');
A1=textscan(fileID,'%c','whitespace','');
fclose(fileID);
A=char(A1);
p_letter=Count_letters(A);

letterset=unique(A);
symbols=cell(1,27);
symbols{1,1}=char(32);

for f=2:27
    symbols{1,f}=char(95+f);   
end

%TO calculate Huffman code dictionary using 'symbol' and probability
%'p_letters'
[dict, avglen] = huffmandict(symbols, p_letter);

%to calculate the average code length
code_len = zeros(27,1);
for g = 1:27
    code_len(g,1) = numel(cell2mat(dict(g,2)));
end

%print the dictionary
for c = 1:27
    fprintf('`%s` : ', symbols{1,c});
    fprintf('%d ', dict{c,2});
    fprintf('\n');
end

fprintf('ƽ���볤 : %f\n', sum((p_letter.*code_len)) );
fprintf('��Դ�� : %f\n', sum(p_letter.*(-log2(p_letter))) );
fprintf('����Ч�� : %f\n', 1/sum(p_letter.*(-log2(p_letter))) );

% %�����ַ������ձ��볤��
% enc_len = 0;
% for i = 1:len
%     enc_len = enc_len + numel(dict{letterset==str(i),2});
% end
% fprintf('����ǰ�ַ����ܳ��� : %d\n', numel(str));
% fprintf('������ַ����������ܳ��� : %d\n', enc_len);
% fprintf('������ַ����ֽ��ܳ���(%d/8) : %d\n', enc_len, ceil(enc_len/8));
% 
% %��ӡ���ձ���
% fprintf('������ : ');
% for i = 1:len
%     %fprintf('%s : ', str(i));
%     fprintf('%d', dict{unique_str==str(i),2});
%     fprintf(' ');
% end
% fprintf('\n');