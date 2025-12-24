# 一些運行範例或小工具程式

### 格式提醒
+ TRN File
  + REF: EarthImager2DManual.pdf page 80 of 136
```
; TRN File // A semicolon (;) starts a comment line
unit=meters // Unit of distance measure
1 // 1 = horizontal distance is given, 2 = tape measure is given
-1, 0.3 // X, elevation (positive upward)
1.0, -0.3
3.6, -1.2
6.1, -2.7
7.4, -2.3
9.0, -1.3
10.5, -1.0
13.7, -1.5
15.2, -2.5
17.0, -1.0
19.2, -0.2
```
+ 



### 網格繪圖範例(WxH=1280x720,DPI=100)
+ 範例1:
```
#==============================================================================
# Pygimli網格繪圖範例#01:  繪製電阻率及電極位置
#--
# 可填入的資訊
PNG_Profile_Name='XP1_Model'
PNG_NumPy_Electrode_x = Ohm_data.sensors().array()[:, 0]
PNG_NumPy_Electrode_y = Ohm_data.sensors().array()[:, 1]
PNG_NumPy_Electrode_z = Ohm_data.sensors().array()[:, 2]
PNG_mesh = pg.Mesh(mesh)
PNG_mesh_data = PNG_mesh['Resistivity_(log10)']
PNG_mesh_showMesh = True # True / False
PNG_DPI = 100
PNG_Width = 1280
PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
# 繪製網格
ax, cbar = pg.show(PNG_mesh, 
    data=PNG_mesh_data, 
    ax=ax,
    markers=False,
    showMesh=PNG_mesh_showMesh,
    label='Resistivity (log10 Ωm)',   # colorbar的標題。
    axisLabels=False,                 # 阻止自動標籤，否則特定條件下會把Y軸轉換成深度..
    cMap='jet')
# 繪製電極
ax.plot(PNG_NumPy_Electrode_x, PNG_NumPy_Electrode_z, 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')
ax.set_title(f'{PNG_Profile_Name}\n Electrode_Count= {len(PNG_NumPy_Electrode_x)}, Mesh_Node_Count={PNG_mesh.nodeCount()}, Mesh_Cell_Count={PNG_mesh.cellCount()} ' ,pad=15)  
# 調整繪圖參數
ax.set_xlabel('Distance (m)')
ax.set_ylabel('Elevation (m)')
ax.legend(loc='upper right',ncol=2,framealpha=0.4)
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
# 調整邊界
x_min, x_max = ax.get_xlim()
y_min, y_max = ax.get_ylim()
x_range = x_max - x_min
y_range = y_max - y_min
ax.set_ylim(y_min , y_max + 0.1 * y_range)
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
print(f'儲存 {PNG_Profile_Name} 圖片...')
Output_PNG_FileName = 'ABC.png'
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
plt.close(fig)
print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
#==============================================================================
```
