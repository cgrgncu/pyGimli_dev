clear;clc;close all

filename = 'Mesh01.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'Mesh02.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'Mesh03.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'Mesh04.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'Mesh05.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'FullMeshMarkers.json'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'FullMesh.vtk'; if exist(filename, 'file') == 2, delete(filename); end


cmd_str='.\PythonEnv\python.exe CreateMesh.py';
system(cmd_str);

filename = 'Mesh01.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
filename = 'Mesh02.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
filename = 'Mesh03.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
filename = 'Mesh04.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
filename = 'Mesh05.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end

%%
%--------------------------------------------
% ø�s������ɼаO��
%--------------------------------------------
% Ū�� JSON ���
fid = fopen('Output_FullMeshMarkers.json', 'r', 'n', 'UTF-8');
if fid == -1
    disp('�L�k���}��� MeshMarkers.json');
    return
end
fileContent = fread(fid, '*char')';
fclose(fid);
%--
% �ѽX JSON ���e�쵲�c�� json_struct
json_struct = json_decode(fileContent);
%--
% �N JSON ���c�餤��������r�x�s�� myJSON.MeshMarkers_Readme
myJSON.MeshMarkers_Readme = json_struct.MeshMarkers_Readme;
%--
% �N JSON ���c�餤������аO��ƭ������m�A�x�s�� myJSON.MeshMarkers
% ��l��ƬO cell �}�C�A�o�̱N���ഫ���ƭȯx�}
myJSON.MeshMarkers = reshape([json_struct.MeshMarkers{:}], length(json_struct.MeshMarkers{1}), [])';
%--------------------------------------------
% �ǳ�ø�s������ɪ� X �M Y �y�ЦV�q
%--
% �Ҧ���ɪ� X �y�СA�C���䪺��Ӻ��I�������J NaN �H�_�}�u�q
MeshMarker_all_x_vector = reshape([myJSON.MeshMarkers(:,2), myJSON.MeshMarkers(:,4), nan(size(myJSON.MeshMarkers(:,1)))]', 1, []);
% �Ҧ���ɪ� Y �y�СA������ MeshMarker_all_x_vector
MeshMarker_all_y_vector = reshape([myJSON.MeshMarkers(:,3), myJSON.MeshMarkers(:,5), nan(size(myJSON.MeshMarkers(:,1)))]', 1, []);
%--
% �аO�Ȭ� 1 ����ɪ� X �y��
MeshMarker_1_x_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 2), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 4), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 1)))]', 1, []);
% �аO�Ȭ� 1 ����ɪ� Y �y��
MeshMarker_1_y_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 3), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 5), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==1, 1)))]', 1, []);
%--
% �аO�Ȭ� -1 ����ɪ� X �y��
MeshMarker_neg1_x_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 2), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 4), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 1)))]', 1, []);
% �аO�Ȭ� -1 ����ɪ� Y �y��
MeshMarker_neg1_y_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 3), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 5), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-1, 1)))]', 1, []);
%--
% �аO�Ȭ� -2 ����ɪ� X �y��
MeshMarker_neg2_x_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 2), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 4), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 1)))]', 1, []);
% �аO�Ȭ� -2 ����ɪ� Y �y��
MeshMarker_neg2_y_vector = reshape([myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 3), myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 5), nan(size(myJSON.MeshMarkers(myJSON.MeshMarkers(:,6)==-2, 1)))]', 1, []);
%--------------------------------------------
% ø��
figure 
%--
% ø�s�Ҧ���ɡA�ϥβL�Ǧ�
plot(MeshMarker_all_x_vector, MeshMarker_all_y_vector, 'Color', [0.8 0.8 0.8]);
%--
% �O���ثe���ϧΡA�H�K�b�P�@�y�жb�Wø�s���򪺸��
hold on 
%--
% ø�s�аO�Ȭ� 1 ����ɡA�ϥβ`���A�u�e 1.5
plot(MeshMarker_1_x_vector, MeshMarker_1_y_vector, 'Color', [0 0.5 0], 'LineWidth', 1.5);
% ø�s�аO�Ȭ� -1 ����ɡA�ϥξ��A�u�e 1.5
plot(MeshMarker_neg1_x_vector, MeshMarker_neg1_y_vector, 'Color', [1 0.5 0], 'LineWidth', 1.5);
% ø�s�аO�Ȭ� -2 ����ɡA�ϥβ`�Ѫ��Ŧ�A�u�e 1.5
plot(MeshMarker_neg2_x_vector, MeshMarker_neg2_y_vector, 'Color', [0.3 0.7 1], 'LineWidth', 1.5);
%--
% �]�w X �b�M Y �b�������׬۵��A�T�O��ҥ��T
axis equal 
%--
% �p��Ҧ���ɺ��I�� X �M Y �y�Ъ��̤p�ȩM�̤j�ȡA�Ω�]�w�b�d��
x_min = min([MeshMarker_all_x_vector(:); MeshMarker_1_x_vector(:); MeshMarker_neg1_x_vector(:); MeshMarker_neg2_x_vector(:)]);
x_max = max([MeshMarker_all_x_vector(:); MeshMarker_1_x_vector(:); MeshMarker_neg1_x_vector(:); MeshMarker_neg2_x_vector(:)]);
y_min = min([MeshMarker_all_y_vector(:); MeshMarker_1_y_vector(:); MeshMarker_neg1_y_vector(:); MeshMarker_neg2_y_vector(:)]);
y_max = max([MeshMarker_all_y_vector(:); MeshMarker_1_y_vector(:); MeshMarker_neg1_y_vector(:); MeshMarker_neg2_y_vector(:)]);
% �p�� X �M Y �b����ƽd��
x_range = x_max - x_min;
y_range = y_max - y_min;
% �]�w�d�դ��
padding_factor_left = 0.1;   % ����d�դ�� (��ƽd�� 10%)
padding_factor_right = 0.1;  % �k��d�դ�� (��ƽd�� 10%)
padding_factor_bottom = 0.1; % �U��d�դ�� (��ƽd�� 10%)
padding_factor_top = 0.1;    % �W��d�դ�� (��ƽd�� 10%)
% �]�w X �b���d��A�W�[���k�d��
xlim([x_min - padding_factor_left * x_range, x_max + padding_factor_right * x_range]);
% �]�w Y �b���d��A�W�[�W�U�d��
ylim([y_min - padding_factor_bottom * y_range, y_max + padding_factor_top * y_range]);
%--
% �K�[���D�M�b���ҥH���ѧ�h��T
title('MeshMarker����');
xlabel('X[m]');
ylabel('Y[m]');
%--
% �N�Ϩҵe��ϧΪ��k��
legend('Marker=Any', 'Marker=1', 'Marker=-1', 'Marker=-2', 'Location', 'eastoutside');
%-------------------------------------------- 
%%
%**************************************************************************
% Name: pyGimli_2Dmesh_vtk_read_and_plot
% Copyright:  
% Author: HsiupoYeh 
% Version: v20250518a
% REF: 
%   Data Format: VTK (Visualization Toolkit) file format (*.vtk) 
%     https://kitware.github.io/vtk-js/docs/io_formats.html
% Description:
%   �Ω�Ū���M��ı���x�s�b VTK �ɮפ��� 2D �D���c�ƺ����ơC
%   ���}���ѪR VTK �ɮפ��� POINTS�]�I�y�С^�BCELLS�]�椸�s���ʡ^�B
%   CELL_TYPES�]�椸�����^�M CELL_DATA�]�椸��ơ^���϶��A�H�����`�I�y�СB
%   �椸�s����T�B�椸�����]�T���ΩM�|��Ρ^�H�ΰ��椸����ơ]�Ҧp�G�q���v resistivity,
%   �л\�v coverage�^�C
% �`�N�ƶ�:
%   ���}�����]����ѤT���� (VTK_TRIANGLE=5) �M�|��� (VTK_QUAD=9) �զ��C
%   �`�I���ަb VTK �ɮפ��q�`�q 0 �}�l�A�}�����w�վ㬰�q 1 �}�l�C
%   CELL_DATA ��Ū�����]��ƥH SCALARS, LOOKUP_TABLE �����c�e�{�C
%   �z���׽վ�ϥΤF�W�� 'Coverage' �M 'S_Coverage' �� CELL_DATA�C
%   �}���ȳB�z 2D �`�I�y�� (x, y)�C
%**************************************************************************
%--------------------------------------------
% �]�w VTK �ɮצW
filename = 'Output_FullMesh.vtk'; % ���w�nŪ���� VTK �ɮצW�١C
%--------------------------------------------
disp('--')
%--------------------------------------------
disp('Ū���ɮ�...')
% �}���ɮץH�i��Ū���C
fid = fopen(filename, 'r');
% �ˬd�ɮ׬O�_���\�}�ҡC
if fid == -1
    disp(['���~! �L�k�}���ɮ�: ', filename]);
    return;
else
    % Ū������ɮפ��e���r���V�q�C
    file_content = fread(fid, '*char')';
    % �����ɮסC
    fclose(fid);
end
disp('Ū���ɮ�...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
disp('��z����...')
% �ϥΥ��W��ܦ�������Ÿ������ɮפ��e�C
% �䴩 Windows (\r\n), Unix/Linux (\n), �M�ª� Mac (\r) ������Ÿ��C
file_lines_cell = regexp(file_content, '(\r\n|\n|\r)', 'split')';
% �ˬd���Ϋ᪺ cell �}�C���Ĥ@�Ӥ����O�_���Ŧr�� (�i��]�ɮץH����Ÿ��}�Y�ɭP)�C
if isempty(file_lines_cell{1})
    % �p�G�Ĥ@�Ӥ������šA�h�N�䲾���C
    file_lines_cell(1) = [];
end
%--
disp('��z����...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% ���X POINTS ������A�þ�z���ܼƤ�
% �d��: POINTS 442 double �A�ڥu���X442�A��ܦ�442��POINTS��ơA�s��b���U�Ӫ�442�椤�C
disp('��zPOINTS...')
% �ؼ�����r�A�Ω�b�ɮפ��M�� POINTS ��ƪ��_�l��C
temp_target_keyword='POINTS';
% ��l�ƥؼЦ檺���ެ� -1�A��ܩ|�����C
temp_target_line_index=-1;
% �M���ɮת��C�@��C
for i=1:length(file_lines_cell)
    % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % �p�G���ؼ�����r�b�歺�A�h�O���Ӧ檺���ޡC
        temp_target_line_index=i;
        break; % ����Y�i����M���C
    end
end
%--
% �ˬd�O�_���F�]�t POINTS ����r����C
if temp_target_line_index>-1
    % �ϥ� regexp �H�ťզr�� '\s+' ���Υ]�t POINTS ����r����C
    % �o�|�N "POINTS 442 double" ���Φ� {'POINTS', '442', 'double'}�C
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% ��z POINTS �����e�C
% �q�]�t POINTS ����r������r����}�l�A��ƶq (temp_strsplit_parts{2}) ���᪺�浲���C
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+str2num(temp_strsplit_parts{2});
% �N�]�t POINTS ����r�Ψ�����ƪ����x�s�� vtk.POINTS.Lines�C
vtk.POINTS.Lines=file_lines_cell(temp_start_index:temp_end_index);
% �w�q POINTS ��ƪ����D�C
vtk.POINTS.DataHeader={'x[m]','y[m]','z[m]'};
% �q�ĤG��}�l (���L�]�t "POINTS ..." ����)�A�N�Ѿl����r��ϥ� sprintf �X�֦��@�Ӫ��r��A
% �M��ϥ� sscanf ���ӯB�I�Ʈ榡 '%f' Ū���Ҧ��Ʀr�C
% reshape ��ƱNŪ���쪺�Ʀr���s�ƦC���@�ӯx�}�A�C 3 �ӼƦr���@�� (x, y, z �y��)�A
% �èϥ���m (') �ϨC�@��N��@���I���y�СC
vtk.POINTS.Data=reshape(sscanf(sprintf('%s ', vtk.POINTS.Lines{2:end}),'%f'),3,[])';
%--
disp('��zPOINTS...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% ���X CELLS ������A�þ�z���ܼƤ�
% �d��: CELLS 732 2928�A��732��A�C�泣���Ʀr�A�Ҧ���̭����Ʀr�`�ӼƬO2928��
disp('��zCELLS...')
% �ؼ�����r�A�Ω�b�ɮפ��M�� CELLS ��ƪ��_�l��C
temp_target_keyword='CELLS';
% ��l�ƥؼЦ檺���ެ� -1�A��ܩ|�����C
temp_target_line_index=-1;
% �M���ɮת��C�@��C
for i=1:length(file_lines_cell)
    % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % �p�G���ؼ�����r�b�歺�A�h�O���Ӧ檺���ޡC
        temp_target_line_index=i;
        break % ����Y�i����M���C
    end
end
%--
% �ˬd�O�_���F�]�t CELLS ����r����C
if temp_target_line_index>-1
    %disp(['�������r�u',temp_target_keyword,'�v�Ҧb���=',num2str(temp_target_line_index)])
	% �ϥ� regexp �H�ťզr�� '\s+' ���Υ]�t CELLS ����r����C
    % �o�|�N "CELLS 732 2928" ���Φ� {'CELLS', '732', '2928'}�C
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% ��z CELLS �����e�C
% �q�]�t CELLS ����r����}�l�A��ƶq (temp_strsplit_parts{2}) ���᪺�浲���C
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+str2num(temp_strsplit_parts{2});
% �N�]�t CELLS ����r�Ψ�����ƪ����x�s�� vtk.CELLS.Lines�C
vtk.CELLS.Lines=file_lines_cell(temp_start_index:temp_end_index);
% �w�q CELLS ��ƪ����D�CCELL�u�䴩�T���λP�|��ΡA�̦h�u���\4�Ӹ`�I�A�������N��NaN�C
vtk.CELLS.DataHeader={'node_count[count]','node#1_index[m](first index=1)','node#2_index[m](first index=1)','node#3_index[m](first index=1)','node#4_index[m](first index=1)'};
% ��l�� vtk.CELLS.Data �x�}�A�� NaN ��R�A�j�p�� (Cell �ƶq x 5)�C
vtk.CELLS.Data=nan(length(vtk.CELLS.Lines)-1,5);
for i=2:length(vtk.CELLS.Lines)
    % �q�ĤG��}�l�M�� Cell �s����T�C
    % �ϥ� sscanf �q�C�@��Ū�����
    temp_array=sscanf(vtk.CELLS.Lines{i},'%d');
    % �ϥ� sscanf Ū����e�檺�Ҧ���ơA��^�@�Ӱ}�C�C�Ĥ@�ӼƦr�O�� Cell ���`�I�ƶq�C
    if temp_array(1) ==3
        % �p�G�`�I�ƶq�O 3�A��ܬO�T���� Cell�C
        %disp('�T���� Cell')
    elseif temp_array(1) ==4
        % �p�G�`�I�ƶq�O 4�A��ܬO�|��� Cell�C
        %disp('�|��� Cell')
    else
        % �p�G�`�I�ƶq���O 3 �� 4�A��ܬO���䴩�����������C
        disp('������������!���B�z!return!')        
        return
    end
    % �վ�index(VTK �ɮפ����`�I���޳q�`�q 0 �}�l�A�o�̱N��վ㬰�q 1 �}�l�A��K����ϥΡC)
    temp_array(2:end)=temp_array(2:end)+1;    
    % �N�B�z�᪺�`�I�ƶq�M�����x�s�� vtk.CELLS.Data �x�}���C
    vtk.CELLS.Data(i-1,1:length(temp_array))=temp_array;
end
%--
disp('��zCELLS...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% ���X CELL_TYPES ������A�þ�z���ܼƤ�
% �d��: CELL_TYPES 732�A�u��1��A�C�泣���Ʀr�A�Ҧ���̭����Ʀr�`�ӼƬO732��
disp('��zCELL_TYPES...')
% �ؼ�����r�A�Ω�b�ɮפ��M�� CELL_TYPES ��ƪ��_�l��C
temp_target_keyword='CELL_TYPES';
% ��l�ƥؼЦ檺���ެ� -1�A��ܩ|�����C
temp_target_line_index=-1;
% �M���ɮת��C�@��C
for i=1:length(file_lines_cell)
    % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % �p�G���ؼ�����r�b�歺�A�h�O���Ӧ檺���ޡC
        temp_target_line_index=i;
        break % ����Y�i����M���C
    end
end
%--
% �ˬd�O�_���F�]�t CELL_TYPES ����r����C
if temp_target_line_index>-1
    %disp(['�������r�u',temp_target_keyword,'�v�Ҧb���=',num2str(temp_target_line_index)])
    % �ϥ� regexp �H�ťզr�� '\s+' ���Υ]�t CELL_TYPES ����r����C
    % �o�|�N "CELL_TYPES 732" ���Φ� {'CELL_TYPES', '732'}�C
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% ��z CELL_TYPES �����e�C
% �q�]�t CELL_TYPES ����r������r����}�l�A��U�@�浲���C
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+1;
% �N�]�t CELL_TYPES ����r�Ψ�����ƪ����x�s�� vtk.CELL_TYPES.Lines�C
vtk.CELL_TYPES.Lines=file_lines_cell(temp_start_index:temp_end_index);
% �w�q CELL_TYPES ��ƪ����D�CCELL_TYPES�u�䴩�T����(VTK_TRIANGLE=5)�P�|���(VTK_QUAD=9)
vtk.CELL_TYPES.DataHeader={'CELL_TYPES(VTK_TRIANGLE=5,VTK_QUAD=9)'};
% �ϥ� sscanf ���ӯB�I�Ʈ榡 '%d' Ū���Ҧ��Ʀr�A�x�s�� vtk.CELL_TYPES.Data �x�}���C
vtk.CELL_TYPES.Data=sscanf(vtk.CELL_TYPES.Lines{2},'%d');
%--
disp('��zCELL_TYPES...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% ���X CELL_DATA ������A�þ�z���ܼƤ�
% �d��: CELL_DATA 732�A�᭱�|�� SCALARS LOOKUP_TABLE �����e
disp('��zCELL_DATA...')
% �ؼ�����r�A�Ω�b�ɮפ��M�� CELL_DATA ��ƪ��_�l��C
temp_target_keyword='CELL_DATA';
% ��l�ƥؼЦ檺���ެ� -1�A��ܩ|�����C
temp_target_line_index=-1;
% �M���ɮת��C�@��C
for i=1:length(file_lines_cell)
    % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
        temp_target_line_index=i;
        break % ����Y�i����M���C
    end
end
%--
% �ˬd�O�_���F�]�t CELL_DATA ����r����C
if temp_target_line_index>-1
    %disp(['�������r�u',temp_target_keyword,'�v�Ҧb���=',num2str(temp_target_line_index)])
	% �ϥ� regexp �H�ťզr�� '\s+' ���Υ]�t CELL_DATA ����r����C
    % �o�|�N "CELL_DATA 732" ���Φ� {'CELL_DATA', '732'}�C
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% ��z CELL_DATA ���e
% �q�]�t CELL_TYPES ����r������r����}�l�C
temp_start_index=temp_target_line_index;
% ��l�Ƹ�Ƶ�������ޡA�w�p�|�ھ� 'LOOKUP_TABLE' ����r��s�C
temp_end_index=temp_target_line_index;
% �]�w�n�M�䪺�U�@������r LOOKUP_TABLE
temp_target_keyword='LOOKUP_TABLE';
% �q 'CELL_DATA' �檺�U�@��}�l�M���C
for i=temp_start_index+1:length(file_lines_cell)
    % �ϥ� strfind �ˬd��e��O�_�]�t�ؼ�����r�A�åB����r�O�_���檺�}�Y (strfind ��^����r�_�l��m)�C
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        %disp(['�������r�u',temp_target_keyword,'�v'])
        % �p�G��� 'LOOKUP_TABLE'�A�h�N�������޳]�w����U�@��C
        temp_end_index=i+1;
    end
end
% �N�]�t CELL_DATA ����r�Ψ�����ƪ����x�s�� vtk.CELL_DATA.Lines�C
vtk.CELL_DATA.Lines=file_lines_cell(temp_start_index:temp_end_index);
% �q vtk.CELL_DATA.Lines ��������Ƽ��D�C�q�`���D�|�C�j�T��X�{�]SCALARS, ��ƦW��, LOOKUP_TABLE�^�C
% �ڭ̿���� 2 ��B�� 5 ��B�� 8 ��... ����m����V�q�C
vtk.CELL_DATA.DataHeader=vtk.CELL_DATA.Lines(2:3:end)';
% �q vtk.CELL_DATA.Lines ��������ڪ���ơC�o�Ǹ�Ƴq�`�b���D�檺����C
% �ڭ̿���� 4 ��B�� 7 ��B�� 10 ��... �ñN���̦��p���@�Ӧr��C
vtk.CELL_DATA.Data=[vtk.CELL_DATA.Lines{4:3:end}];
% �ϥ� sscanf �N���p���r��ѪR���B�I�ơC
% reshape ��ƱNŪ���쪺�Ʀr���s�ƦC���@�ӯx�}�C
vtk.CELL_DATA.Data=reshape(sscanf(sprintf('%s ', vtk.CELL_DATA.Data),'%f'),[], length(vtk.CELL_DATA.DataHeader));
%--
disp('��zCELL_DATA...����!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% �����Ҧ��`�I�M��
% �q���e��z�� vtk.POINTS.Data �������Ҧ��I�� x �M y �y�СC���]�ڭ�ø�s���O 2D �ϧΡC
% �p�G�O 3D �ϧΡA�h������ vtk.POINTS.Data(:,1:3)�C
all_Vertices = vtk.POINTS.Data(:,1:2); % 2D�`�I�y��
%--
% �|��γ�����ƾ�z
% �ˬd vtk.CELL_TYPES.Data ���O�_�s�b�����s���� 9 �� Cell�A9 �N��|��ΡC
if sum(vtk.CELL_TYPES.Data==9)>0
    %--
    % �]�w�@�Ӽлx�A��ܻݭnø�s�|��ΡC
    need_plot_quadrilateral=1;
    %--
    % �����|��έ����`�I����(�q��4�Ӹ`�I�̧ǳs�즸�Ӹ`�I)
    quadrilateral_Faces = vtk.CELLS.Data(vtk.CELLS.Data(:, 1) == 4, 2:5);
    % ����������|��έ��n��J���C��ȡA�Ҧp: ��4��CELL_DATA
    CELL_DATA_col_index = find(strcmp(vtk.CELL_DATA.DataHeader, 'SCALARS Marker double 1'));
    %disp(vtk.CELL_DATA.DataHeader{CELL_DATA_col_index})    
    quadrilateral_FaceVertexCData = vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 4,CELL_DATA_col_index);
    %--
else
    disp('����:�S���|��κ���ݭnø�s!')
    disp('--')
    need_plot_quadrilateral=0;
end
%--
% �|��γ���ø��
if need_plot_quadrilateral
	%--
    disp('�|��γ���ø��...')
    % ø��
    figure;
    quadrilateral_patch_handle=patch( ...
        'Vertices', all_Vertices, ...
        'Faces', quadrilateral_Faces, ...
        'FaceColor', 'flat', ...
        'FaceVertexCData', quadrilateral_FaceVertexCData, ...
        'EdgeColor', 'k' ...
    );
    %--
    % �]�w X �b�M Y �b�������׬۵��A�T�O��ҥ��T
    axis equal 
    %--
    % �p��Ҧ���ɺ��I�� X �M Y �y�Ъ��̤p�ȩM�̤j�ȡA�Ω�]�w�b�d��
    x_min = min(all_Vertices(:,1));
    x_max = max(all_Vertices(:,1));
    y_min = min(all_Vertices(:,2));
    y_max = max(all_Vertices(:,2));
    % �p�� X �M Y �b����ƽd��
    x_range = x_max - x_min;
    y_range = y_max - y_min;
    % �]�w�d�դ��
    padding_factor_left = 0.1;   % ����d�դ�� (��ƽd�� 10%)
    padding_factor_right = 0.1;  % �k��d�դ�� (��ƽd�� 10%)
    padding_factor_bottom = 0.1; % �U��d�դ�� (��ƽd�� 10%)
    padding_factor_top = 0.1;    % �W��d�դ�� (��ƽd�� 10%)
    % �]�w X �b���d��A�W�[���k�d��
    xlim([x_min - padding_factor_left * x_range, x_max + padding_factor_right * x_range]);
    % �]�w Y �b���d��A�W�[�W�U�d��
    ylim([y_min - padding_factor_bottom * y_range, y_max + padding_factor_top * y_range]);
    %--
    xlabel(vtk.POINTS.DataHeader{1});
    ylabel(vtk.POINTS.DataHeader{2});
    title('VTK �|��κ���');
    %--
    colorbar_handle=colorbar('Location', 'southoutside');
    colormap([0,1,1;1,1,0]); % �]�w�ϥΪ��C��M�g
    caxis([0.5 2.5]);
    % �]�w�C�������שM���� (�ϥ� set ���)   
    set(colorbar_handle, 'XTick', [1 2]);
    xlabel(colorbar_handle,'Marker');
    box on
    %--
    disp('�|��γ���ø��...����!')
    disp('--')
    %--
end

%%
% ø��
figure;
quadrilateral__handle=patch( ...
    'Vertices', all_Vertices, ...
    'Faces', quadrilateral_Faces, ...
    'FaceColor', 'flat', ...
    'FaceVertexCData', quadrilateral_FaceVertexCData, ...
    'EdgeColor', 'none' ...
);
set(quadrilateral__handle, 'HandleVisibility', 'off');
%--
% �O���ثe���ϧΡA�H�K�b�P�@�y�жb�Wø�s���򪺸��
hold on 
%--
% ø�s�Ҧ���ɡA�ϥβL�Ǧ�
plot(MeshMarker_all_x_vector, MeshMarker_all_y_vector, 'Color', [0.8 0.8 0.8]);
%--
% ø�s�аO�Ȭ� 1 ����ɡA�ϥβ`���A�u�e 1.5
plot(MeshMarker_1_x_vector, MeshMarker_1_y_vector, 'Color', [0 0.5 0], 'LineWidth', 1.5);
% ø�s�аO�Ȭ� -1 ����ɡA�ϥξ��A�u�e 1.5
plot(MeshMarker_neg1_x_vector, MeshMarker_neg1_y_vector, 'Color', [1 0.5 0], 'LineWidth', 1.5);
% ø�s�аO�Ȭ� -2 ����ɡA�ϥβ`�Ѫ��Ŧ�A�u�e 1.5
plot(MeshMarker_neg2_x_vector, MeshMarker_neg2_y_vector, 'Color', [0.3 0.7 1], 'LineWidth', 1.5);
%--
% �]�w X �b�M Y �b�������׬۵��A�T�O��ҥ��T
axis equal 
%--
% �p��Ҧ���ɺ��I�� X �M Y �y�Ъ��̤p�ȩM�̤j�ȡA�Ω�]�w�b�d��
x_min = min(all_Vertices(:,1));
x_max = max(all_Vertices(:,1));
y_min = min(all_Vertices(:,2));
y_max = max(all_Vertices(:,2));
% �p�� X �M Y �b����ƽd��
x_range = x_max - x_min;
y_range = y_max - y_min;
% �]�w�d�դ��
padding_factor_left = 0.1;   % ����d�դ�� (��ƽd�� 10%)
padding_factor_right = 0.1;  % �k��d�դ�� (��ƽd�� 10%)
padding_factor_bottom = 0.1; % �U��d�դ�� (��ƽd�� 10%)
padding_factor_top = 0.1;    % �W��d�դ�� (��ƽd�� 10%)
% �]�w X �b���d��A�W�[���k�d��
xlim([x_min - padding_factor_left * x_range, x_max + padding_factor_right * x_range]);
% �]�w Y �b���d��A�W�[�W�U�d��
ylim([y_min - padding_factor_bottom * y_range, y_max + padding_factor_top * y_range]);
%--
xlabel(vtk.POINTS.DataHeader{1});
ylabel(vtk.POINTS.DataHeader{2});
title('VTK �|��κ���(�t����P���Marker)');
%--
colorbar_handle=colorbar('Location', 'southoutside');
colormap([0,1,1;1,1,0]); % �]�w�ϥΪ��C��M�g
caxis([0.5 2.5]);
% �]�w�C�������שM���� (�ϥ� set ���)   
set(colorbar_handle, 'XTick', [1 2]);
xlabel(colorbar_handle,'Marker');
box on
%--
% �N�Ϩҵe��ϧΪ��k��
legend('Marker=Any', 'Marker=1', 'Marker=-1', 'Marker=-2', 'Location', 'eastoutside');
%--