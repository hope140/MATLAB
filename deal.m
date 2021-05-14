%% 去除文件中注释
fid1 = fopen('Int_Point.m');%输入文件
i = 0;
afterProcess = {};
tline = fgetl(fid1);

while ischar(tline)
    i = i + 1;
	if contains(tline, '%{')
            while ~contains(tline, '%}')
                i = i + 1;
                tline = fgetl(fid1);
                afterProcess{i} = {};
            end
        elseif contains(tline, '%')
            afterProcess{i} = extractBefore(tline,'%');
            tline = fgetl(fid1);
        elseif ~contains(tline, '%')
            afterProcess{i} = tline; 
            tline = fgetl(fid1);
	end
end
fclose(fid1);

%写入文件
fileID = fopen('Int_Point.m','w');
formatSpec = '%s\n';
[nrows,ncols] = size(afterProcess);
for row = 1:ncols
    fprintf(fileID,formatSpec,char(afterProcess{:,row}));
end
fclose(fileID);