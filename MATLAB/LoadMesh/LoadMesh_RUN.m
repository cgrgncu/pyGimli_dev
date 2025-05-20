clear;clc;close all

filename = 'Mesh01b.png'; if exist(filename, 'file') == 2, delete(filename); end
filename = 'Mesh02b.png'; if exist(filename, 'file') == 2, delete(filename); end

cmd_str='.\PythonEnv\python.exe LoadMesh.py';
system(cmd_str);

filename = 'Mesh01b.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
filename = 'Mesh02b.png'; if exist(filename, 'file') == 2, figure;imshow(filename), title(filename); end
