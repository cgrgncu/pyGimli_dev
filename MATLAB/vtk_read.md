# 範例

### pyGimli_2Dmesh_vtk_read_and_plot_example
```matlab
%**************************************************************************
% Name: pyGimli_2Dmesh_vtk_read_and_plot_example.m v20250518a
% Copyright:  
% Author: HsiupoYeh 
% Version: v20250518a
% REF: 
%   Data Format: VTK (Visualization Toolkit) file format (*.vtk) 
%     https://kitware.github.io/vtk-js/docs/io_formats.html
% Description:
%   用於讀取和視覺化儲存在 VTK 檔案中的 2D 非結構化網格資料。
%   此腳本解析 VTK 檔案中的 POINTS（點座標）、CELLS（單元連接性）、
%   CELL_TYPES（單元類型）和 CELL_DATA（單元資料）等區塊，以提取節點座標、
%   單元連接資訊、單元類型（三角形和四邊形）以及基於單元的資料（例如：電阻率 resistivity,
%   覆蓋率 coverage）。
% 注意事項:
%   本腳本假設網格由三角形 (VTK_TRIANGLE=5) 和四邊形 (VTK_QUAD=9) 組成。
%   節點索引在 VTK 檔案中通常從 0 開始，腳本中已調整為從 1 開始。
%   CELL_DATA 的讀取假設資料以 SCALARS, LOOKUP_TABLE 的結構呈現。
%   透明度調整使用了名為 'Coverage' 和 'S_Coverage' 的 CELL_DATA。
%   腳本僅處理 2D 節點座標 (x, y)。
%**************************************************************************
clear;clc;close all
%--------------------------------------------
% 設定 VTK 檔案名
filename = 'resistivity.vtk'; % 指定要讀取的 VTK 檔案名稱。
%--------------------------------------------
disp('--')
%--------------------------------------------
disp('讀取檔案...')
% 開啟檔案以進行讀取。
fid = fopen(filename, 'r');
% 檢查檔案是否成功開啟。
if fid == -1
    disp(['錯誤! 無法開啟檔案: ', filename]);
    return;
else
    % 讀取整個檔案內容為字元向量。
    file_content = fread(fid, '*char')';
    % 關閉檔案。
    fclose(fid);
end
disp('讀取檔案...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
disp('整理換行...')
% 使用正規表示式按換行符號分割檔案內容。
% 支援 Windows (\r\n), Unix/Linux (\n), 和舊版 Mac (\r) 的換行符號。
file_lines_cell = regexp(file_content, '(\r\n|\n|\r)', 'split')';
% 檢查分割後的 cell 陣列的第一個元素是否為空字串 (可能因檔案以換行符號開頭導致)。
if isempty(file_lines_cell{1})
    % 如果第一個元素為空，則將其移除。
    file_lines_cell(1) = [];
end
%--
disp('整理換行...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% 取出 POINTS 部分行，並整理至變數中
% 範例: POINTS 442 double ，我只取出442，表示有442個POINTS資料，存放在接下來的442行中。
disp('整理POINTS...')
% 目標關鍵字，用於在檔案中尋找 POINTS 資料的起始行。
temp_target_keyword='POINTS';
% 初始化目標行的索引為 -1，表示尚未找到。
temp_target_line_index=-1;
% 遍歷檔案的每一行。
for i=1:length(file_lines_cell)
    % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % 如果找到目標關鍵字在行首，則記錄該行的索引。
        temp_target_line_index=i;
        break; % 找到後即可停止遍歷。
    end
end
%--
% 檢查是否找到了包含 POINTS 關鍵字的行。
if temp_target_line_index>-1
    % 使用 regexp 以空白字元 '\s+' 分割包含 POINTS 關鍵字的行。
    % 這會將 "POINTS 442 double" 分割成 {'POINTS', '442', 'double'}。
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% 整理 POINTS 的內容。
% 從包含 POINTS 關鍵字的關鍵字的行開始，到數量 (temp_strsplit_parts{2}) 之後的行結束。
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+str2num(temp_strsplit_parts{2});
% 將包含 POINTS 關鍵字及其後續資料的行儲存到 vtk.POINTS.Lines。
vtk.POINTS.Lines=file_lines_cell(temp_start_index:temp_end_index);
% 定義 POINTS 資料的標題。
vtk.POINTS.DataHeader={'x[m]','y[m]','z[m]'};
% 從第二行開始 (跳過包含 "POINTS ..." 的行)，將剩餘的行字串使用 sprintf 合併成一個長字串，
% 然後使用 sscanf 按照浮點數格式 '%f' 讀取所有數字。
% reshape 函數將讀取到的數字重新排列成一個矩陣，每 3 個數字為一組 (x, y, z 座標)，
% 並使用轉置 (') 使每一行代表一個點的座標。
vtk.POINTS.Data=reshape(sscanf(sprintf('%s ', vtk.POINTS.Lines{2:end}),'%f'),3,[])';
%--
disp('整理POINTS...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% 取出 CELLS 部分行，並整理至變數中
% 範例: CELLS 732 2928，有732行，每行都有數字，所有行裡面的數字總個數是2928個
disp('整理CELLS...')
% 目標關鍵字，用於在檔案中尋找 CELLS 資料的起始行。
temp_target_keyword='CELLS';
% 初始化目標行的索引為 -1，表示尚未找到。
temp_target_line_index=-1;
% 遍歷檔案的每一行。
for i=1:length(file_lines_cell)
    % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % 如果找到目標關鍵字在行首，則記錄該行的索引。
        temp_target_line_index=i;
        break % 找到後即可停止遍歷。
    end
end
%--
% 檢查是否找到了包含 CELLS 關鍵字的行。
if temp_target_line_index>-1
    %disp(['找到關鍵字「',temp_target_keyword,'」所在行數=',num2str(temp_target_line_index)])
	% 使用 regexp 以空白字元 '\s+' 分割包含 CELLS 關鍵字的行。
    % 這會將 "CELLS 732 2928" 分割成 {'CELLS', '732', '2928'}。
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% 整理 CELLS 的內容。
% 從包含 CELLS 關鍵字的行開始，到數量 (temp_strsplit_parts{2}) 之後的行結束。
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+str2num(temp_strsplit_parts{2});
% 將包含 CELLS 關鍵字及其後續資料的行儲存到 vtk.CELLS.Lines。
vtk.CELLS.Lines=file_lines_cell(temp_start_index:temp_end_index);
% 定義 CELLS 資料的標題。CELL只支援三角形與四邊形，最多只允許4個節點，不夠的就填NaN。
vtk.CELLS.DataHeader={'node_count[count]','node#1_index[m](first index=1)','node#2_index[m](first index=1)','node#3_index[m](first index=1)','node#4_index[m](first index=1)'};
% 初始化 vtk.CELLS.Data 矩陣，用 NaN 填充，大小為 (Cell 數量 x 5)。
vtk.CELLS.Data=nan(length(vtk.CELLS.Lines)-1,5);
for i=2:length(vtk.CELLS.Lines)
    % 從第二行開始遍歷 Cell 連接資訊。
    % 使用 sscanf 從每一行讀取整數
    temp_array=sscanf(vtk.CELLS.Lines{i},'%d');
    % 使用 sscanf 讀取當前行的所有整數，返回一個陣列。第一個數字是該 Cell 的節點數量。
    if temp_array(1) ==3
        % 如果節點數量是 3，表示是三角形 Cell。
        %disp('三角形 Cell')
    elseif temp_array(1) ==4
        % 如果節點數量是 4，表示是四邊形 Cell。
        %disp('四邊形 Cell')
    else
        % 如果節點數量不是 3 或 4，表示是不支援的網格類型。
        disp('不知援的網格!放棄處理!return!')        
        return
    end
    % 調整index(VTK 檔案中的節點索引通常從 0 開始，這裡將其調整為從 1 開始，方便後續使用。)
    temp_array(2:end)=temp_array(2:end)+1;    
    % 將處理後的節點數量和索引儲存到 vtk.CELLS.Data 矩陣中。
    vtk.CELLS.Data(i-1,1:length(temp_array))=temp_array;
end
%--
disp('整理CELLS...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% 取出 CELL_TYPES 部分行，並整理至變數中
% 範例: CELL_TYPES 732，只有1行，每行都有數字，所有行裡面的數字總個數是732個
disp('整理CELL_TYPES...')
% 目標關鍵字，用於在檔案中尋找 CELL_TYPES 資料的起始行。
temp_target_keyword='CELL_TYPES';
% 初始化目標行的索引為 -1，表示尚未找到。
temp_target_line_index=-1;
% 遍歷檔案的每一行。
for i=1:length(file_lines_cell)
    % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % 如果找到目標關鍵字在行首，則記錄該行的索引。
        temp_target_line_index=i;
        break % 找到後即可停止遍歷。
    end
end
%--
% 檢查是否找到了包含 CELL_TYPES 關鍵字的行。
if temp_target_line_index>-1
    %disp(['找到關鍵字「',temp_target_keyword,'」所在行數=',num2str(temp_target_line_index)])
    % 使用 regexp 以空白字元 '\s+' 分割包含 CELL_TYPES 關鍵字的行。
    % 這會將 "CELL_TYPES 732" 分割成 {'CELL_TYPES', '732'}。
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% 整理 CELL_TYPES 的內容。
% 從包含 CELL_TYPES 關鍵字的關鍵字的行開始，到下一行結束。
temp_start_index=temp_target_line_index;
temp_end_index=temp_target_line_index+1;
% 將包含 CELL_TYPES 關鍵字及其後續資料的行儲存到 vtk.CELL_TYPES.Lines。
vtk.CELL_TYPES.Lines=file_lines_cell(temp_start_index:temp_end_index);
% 定義 CELL_TYPES 資料的標題。CELL_TYPES只支援三角形(VTK_TRIANGLE=5)與四邊形(VTK_QUAD=9)
vtk.CELL_TYPES.DataHeader={'CELL_TYPES(VTK_TRIANGLE=5,VTK_QUAD=9)'};
% 使用 sscanf 按照浮點數格式 '%d' 讀取所有數字，儲存到 vtk.CELL_TYPES.Data 矩陣中。
vtk.CELL_TYPES.Data=sscanf(vtk.CELL_TYPES.Lines{2},'%d');
%--
disp('整理CELL_TYPES...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% 取出 CELL_DATA 部分行，並整理至變數中
% 範例: CELL_DATA 732，後面會有 SCALARS LOOKUP_TABLE 等內容
disp('整理CELL_DATA...')
% 目標關鍵字，用於在檔案中尋找 CELL_DATA 資料的起始行。
temp_target_keyword='CELL_DATA';
% 初始化目標行的索引為 -1，表示尚未找到。
temp_target_line_index=-1;
% 遍歷檔案的每一行。
for i=1:length(file_lines_cell)
    % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
        temp_target_line_index=i;
        break % 找到後即可停止遍歷。
    end
end
%--
% 檢查是否找到了包含 CELL_DATA 關鍵字的行。
if temp_target_line_index>-1
    %disp(['找到關鍵字「',temp_target_keyword,'」所在行數=',num2str(temp_target_line_index)])
	% 使用 regexp 以空白字元 '\s+' 分割包含 CELL_DATA 關鍵字的行。
    % 這會將 "CELL_DATA 732" 分割成 {'CELL_DATA', '732'}。
    temp_strsplit_parts = regexp(file_lines_cell{temp_target_line_index}, '\s+', 'split');
end
%--
% 整理 CELL_DATA 內容
% 從包含 CELL_TYPES 關鍵字的關鍵字的行開始。
temp_start_index=temp_target_line_index;
% 初始化資料結束行索引，預計會根據 'LOOKUP_TABLE' 關鍵字更新。
temp_end_index=temp_target_line_index;
% 設定要尋找的下一個關鍵字 LOOKUP_TABLE
temp_target_keyword='LOOKUP_TABLE';
% 從 'CELL_DATA' 行的下一行開始遍歷。
for i=temp_start_index+1:length(file_lines_cell)
    % 使用 strfind 檢查當前行是否包含目標關鍵字，並且關鍵字是否位於行的開頭 (strfind 返回關鍵字起始位置)。
    if ~isempty(strfind(file_lines_cell{i},temp_target_keyword)) && strfind(file_lines_cell{i},temp_target_keyword)==1
        %disp(['找到關鍵字「',temp_target_keyword,'」'])
        % 如果找到 'LOOKUP_TABLE'，則將結束索引設定為其下一行。
        temp_end_index=i+1;
    end
end
% 將包含 CELL_DATA 關鍵字及其後續資料的行儲存到 vtk.CELL_DATA.Lines。
vtk.CELL_DATA.Lines=file_lines_cell(temp_start_index:temp_end_index);
% 從 vtk.CELL_DATA.Lines 中提取資料標題。通常標題會每隔三行出現（SCALARS, 資料名稱, LOOKUP_TABLE）。
% 我們選取第 2 行、第 5 行、第 8 行... 並轉置為行向量。
vtk.CELL_DATA.DataHeader=vtk.CELL_DATA.Lines(2:3:end)';
% 從 vtk.CELL_DATA.Lines 中提取實際的資料。這些資料通常在標題行的後兩行。
% 我們選取第 4 行、第 7 行、第 10 行... 並將它們串聯成一個字串。
vtk.CELL_DATA.Data=[vtk.CELL_DATA.Lines{4:3:end}];
% 使用 sscanf 將串聯的字串解析為浮點數。
% reshape 函數將讀取到的數字重新排列成一個矩陣。
vtk.CELL_DATA.Data=reshape(sscanf(sprintf('%s ', vtk.CELL_DATA.Data),'%f'),[], length(vtk.CELL_DATA.DataHeader));
%--
disp('整理CELL_DATA...完成!')
%--------------------------------------------
disp('--')
%--------------------------------------------
% 提取所有節點清單
% 從之前整理的 vtk.POINTS.Data 中提取所有點的 x 和 y 座標。假設我們繪製的是 2D 圖形。
% 如果是 3D 圖形，則應提取 vtk.POINTS.Data(:,1:3)。
all_Vertices = vtk.POINTS.Data(:,1:2); % 2D節點座標
%--
% 三角形部分資料整理
% 檢查 vtk.CELL_TYPES.Data 中是否存在類型編號為 5 的 Cell，5 代表三角形。
if sum(vtk.CELL_TYPES.Data==5)>0
    %--
    % 設定一個標誌，表示需要繪製三角形。
    need_plot_triangle=1;
    %--
    % 提取三角形面的節點索引(從哪3個節點依序連到次個節點)
    triangle_Faces = vtk.CELLS.Data(vtk.CELLS.Data(:, 1) == 3, 2:4);
    % 提取對應於三角形面要填入的顏色值，例如: 第4個CELL_DATA
    disp(vtk.CELL_DATA.DataHeader{4})
    triangle_FaceVertexCData = vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 3,4);
    % 提取對應於三角形面要填入的透明度值，例如: 第1個CELL_DATA
    disp(vtk.CELL_DATA.DataHeader{1})
    triangle_FaceVertexAlphaData_raw = vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 3,1);
    % 使用 Coverage 數值，調整透明度比例Coverage數值最高的透明度=1，最低的透明度=0
    triangle_FaceVertexAlphaData = triangle_FaceVertexAlphaData_raw - min(triangle_FaceVertexAlphaData_raw);
    triangle_FaceVertexAlphaData = triangle_FaceVertexAlphaData / max(triangle_FaceVertexAlphaData);
    % 使用 S_Coverage 數值，調整透明度比例使部分網格透明度大於1
    disp(vtk.CELL_DATA.DataHeader{5})
    triangle_FaceVertexAlphaData = triangle_FaceVertexAlphaData + vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 3,5);
    triangle_FaceVertexAlphaData=coverageToAlpha(vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 3,1), 0.4);
    %--
else
    disp('提示:沒有三角形網格需要繪製!')
    disp('--')
    need_plot_triangle=0;
end
%--
% 三角形部分繪圖
if need_plot_triangle
    %--
    disp('三角形部分繪圖...')
    % 繪圖
    figure;
    triangle_patch_handle=patch( ...
        'Vertices', all_Vertices, ...
        'Faces', triangle_Faces, ...
        'FaceColor', 'flat', ...
        'FaceVertexCData', triangle_FaceVertexCData, ...
        'FaceAlpha','flat', ...
        'FaceVertexAlphaData', triangle_FaceVertexAlphaData, ...
        'AlphaDataMapping','none', ...
        'EdgeColor', 'none' ...
    );
    %--
    axis equal;
    xlabel(vtk.POINTS.DataHeader{1});
    ylabel(vtk.POINTS.DataHeader{2});
    title('VTK 三角形網格 (依 Coverage + S\_Coverage 調整透明度)');
    colorbar; 
    %--
    disp('三角形部分繪圖...完成!')
    %--
end
%--
% 四邊形部分資料整理
% 檢查 vtk.CELL_TYPES.Data 中是否存在類型編號為 9 的 Cell，9 代表四邊形。
if sum(vtk.CELL_TYPES.Data==9)>0
    %--
    % 設定一個標誌，表示需要繪製四邊形。
    need_plot_quadrilateral=1;
    %--
    % 提取四邊形面的節點索引(從哪4個節點依序連到次個節點)
    quadrilateral_Faces = vtk.CELLS.Data(vtk.CELLS.Data(:, 1) == 4, 2:5);
    % 提取對應於四邊形面要填入的顏色值，例如: 第4個CELL_DATA
    %disp(vtk.CELL_DATA.DataHeader{4})
    quadrilateral_FaceVertexCData = vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 4,4);
    % 提取對應於四邊形面要填入的透明度值，例如: 第1個CELL_DATA
    %disp(vtk.CELL_DATA.DataHeader{1})
    quadrilateral_FaceVertexAlphaData_raw = vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 4,1);
    % 使用 Coverage 數值，調整透明度比例Coverage數值最高的透明度=1，最低的透明度=0
    quadrilateral_FaceVertexAlphaData = quadrilateral_FaceVertexAlphaData_raw - min(quadrilateral_FaceVertexAlphaData_raw);
    quadrilateral_FaceVertexAlphaData = quadrilateral_FaceVertexAlphaData / max(quadrilateral_FaceVertexAlphaData);
    % 使用 S_Coverage 數值，調整透明度比例使部分網格透明度大於1
    %disp(vtk.CELL_DATA.DataHeader{5})
    quadrilateral_FaceVertexAlphaData = quadrilateral_FaceVertexAlphaData + vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 4,5);
    quadrilateral_FaceVertexAlphaData=coverageToAlpha(vtk.CELL_DATA.Data(vtk.CELLS.Data(:, 1) == 4,1), 0.4);
    %--
else
    disp('提示:沒有四邊形網格需要繪製!')
    disp('--')
    need_plot_quadrilateral=0;
end
%--
% 四邊形部分繪圖
if need_plot_quadrilateral
	%--
    disp('四邊形部分繪圖...')
    % 繪圖
    figure;
    triangle_patch_handle=patch( ...
        'Vertices', all_Vertices, ...
        'Faces', quadrilateral_Faces, ...
        'FaceColor', 'flat', ...
        'FaceVertexCData', quadrilateral_FaceVertexCData, ...
        'FaceAlpha','flat', ...
        'FaceVertexAlphaData', quadrilateral_FaceVertexAlphaData, ...
        'AlphaDataMapping','none', ...
        'EdgeColor', 'none' ...
    );
    %--
    axis equal;
    xlabel(vtk.POINTS.DataHeader{1});
    ylabel(vtk.POINTS.DataHeader{2});
    title('VTK 四邊形網格 (依 Coverage + S\_Coverage 調整透明度)');
    colorbar; 
    %--
    disp('四邊形部分繪圖...完成!')
    disp('--')
    %--
end
```

### 透明度
```matlab
function alphaValues = coverageToAlpha(coverageData, dropThreshold)
% coverageToAlpha 將任意範圍的 coverage 值映射到 [0,1] 的 alpha 值
%
%   alphaValues = coverageToAlpha(coverageData, dropThreshold)
%
%   輸入：
%     coverageData  - 原始 coverage 向量 (Nx1)
%     dropThreshold - 累積比例閾值 (0~1)，預設 0.4
%   輸出：
%     alphaValues   - 大小同 coverageData 的 alpha 向量，所有值 ? [0,1]
%
    if nargin < 2
        dropThreshold = 0.4;
    end

    % 保證為列向量
    coverageData = coverageData(:);

    %% 1) 計算直方圖：50 個等寬區間
    numBins    = 50;
    % binEdges 長度 numBins+1，從 min 到 max 等距切分
    binEdges   = linspace(min(coverageData), max(coverageData), numBins+1);
    % histc 回傳每個 binEdges 槽的計數，長度 = numBins+1
    binCountsAll = histc(coverageData, binEdges);
    % 取前 numBins 個對應 [binEdges(i),binEdges(i+1)) 的計數
    binCounts    = binCountsAll(1:numBins);

    %% 2) 計算累積分布（CDF）
    cumulativeCounts = cumsum(binCounts);       % 累加每個區間的筆數
    totalCount       = sum(binCounts);          % 樣本總數
    cdf              = cumulativeCounts / totalCount;  % 累積比例 ? (0,1]

    %% 3) 找下限 lowerBound：第一個 cdf 超過 2% 的 bin 左邊界
    idxLower = find(cdf > 0.02, 1, 'first');
    if isempty(idxLower)
        lowerBound = binEdges(1);  % 全部 cdf 都 ?2%，用最小邊界
    else
        lowerBound = binEdges(idxLower);
    end

    %% 4) 找上限 upperBound
    if cdf(1) > dropThreshold
        % 若最小那格的累積比例就超過閾值，直接取原始最大值
        upperBound = max(coverageData);
    else
        idxHigher = find(cdf < dropThreshold);
        if isempty(idxHigher)
            upperBound = binEdges(end);  % 全部 cdf 都 ?閾值，取最大邊界
        else
            % 取最後一個累積比例仍小於閾值的 bin 左邊界
            upperBound = binEdges(idxHigher(end));
        end
    end

    %% 5) 線性映射並截斷到 [0,1]
    alphaValues = (coverageData - lowerBound) / (upperBound - lowerBound);
    alphaValues(alphaValues < 0) = 0;
    alphaValues(alphaValues > 1) = 1;
end
```
