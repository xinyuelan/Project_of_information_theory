function p_letter=Count_letters(A);
    i=97; j=65;
    a=1; b=1;
    letter_appear=[];
    while i<123&&j<91  
            idx1=strfind(string(A),char(i));
            idx2=strfind(string(A),char(j));
            B1=cell2mat(idx1);
            B2=cell2mat(idx2);
            find_space=strfind(string(A),char(32));
            space=cell2mat(find_space);
            letter_appear=[letter_appear;sum(B1(:))+sum(B2(:))];
            i=i+1; j=j+1;
            a=a+1; b=b+1;
    end
        p_letter=[sum(space(:));letter_appear]./(sum(letter_appear(:))+sum(space(:)));
end
