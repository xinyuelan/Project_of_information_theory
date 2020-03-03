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

fprintf('平均码长 : %f\n', sum((p_letter.*code_len)) );
fprintf('信源熵 : %f\n', sum(p_letter.*(-log2(p_letter))) );
fprintf('编码效率 : %f\n', 1/sum(p_letter.*(-log2(p_letter))) );

% %计算字符串最终编码长度
% enc_len = 0;
% for i = 1:len
%     enc_len = enc_len + numel(dict{letterset==str(i),2});
% end
% fprintf('编码前字符串总长度 : %d\n', numel(str));
% fprintf('编码后字符串二进制总长度 : %d\n', enc_len);
% fprintf('编码后字符串字节总长度(%d/8) : %d\n', enc_len, ceil(enc_len/8));
% 
% %打印最终编码
% fprintf('编码结果 : ');
% for i = 1:len
%     %fprintf('%s : ', str(i));
%     fprintf('%d', dict{unique_str==str(i),2});
%     fprintf(' ');
% end
% fprintf('\n');