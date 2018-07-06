function varargout = untitled(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%初始置换IP
function pushbutton1_Callback(hObject, eventdata, handles)
global opencode 
IP = [58,50,42,34,26,18,10,2,60,52,44,36,28,20,12,4,62,54,46,38,30,22,14,6,64,56,48,40,32,24,16,8,57,49,41,33,25,17,9,1,59,51,43,35,27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,39,31,23,15,7];

for i=1:64
    temp(i)=opencode(IP(i));
end

global L0;
global R0;

for i=1:32
    opencode(i)=temp(i);
    L0(i)=temp(i);
end

for i=33:64
    opencode(i)=temp(i);
    R0(i-32)=temp(i)
end

set(handles.edit2, 'string',strcat(num2str(L0)));
set(handles.edit3, 'string',strcat(num2str(R0)));


function edit1_Callback(hObject, eventdata, handles)
global opencode;
opencode = str2num(get(hObject, 'string'));


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)


function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Untitled_1_Callback(hObject, eventdata, handles)



function edit4_Callback(hObject, eventdata, handles)
global keycode;
keycode = str2num(get(hObject, 'string'));


function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)


function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%选择置换PC-1
function pushbutton2_Callback(hObject, eventdata, handles)
global keycode;
PC_1 = [57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4];
for i=1:56
    temp(i)=keycode(PC_1(i));
end

global C0;
global D0;
global Key;
for i=1:28
    Key(i)=temp(i);
    C0(i)=temp(i);
end

for i=29:56
    Key(i)=temp(i);
    D0(i-28)=temp(i);
end

set(handles.edit5, 'string',strcat(num2str(C0)));
set(handles.edit6, 'string',strcat(num2str(D0)));


%选择置换PC-2
function pushbutton3_Callback(hObject, eventdata, handles)
global Key;
global KeyFinal;
PC_2 = [14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32];
for i=1:48
    temp(i)=Key(PC_2(i));
end

for i=1:48
    KeyFinal(i)=temp(i);
end

set(handles.edit7, 'string',strcat(num2str(KeyFinal)));


%循环左移1位
function pushbutton4_Callback(hObject, eventdata, handles)
global C0;
global D0;
global Key;

for i=1:27
    temp(i)=C0(i+1);
end
temp(28)=C0(1);

for i=1:28
    Key(i)=temp(i);
    C0(i)=temp(i);
end

for i=1:27
    temp(i)=D0(i+1);
end
temp(28)=D0(1);

for i=1:28
    Key(i+28)=temp(i);
    D0(i)=temp(i);
end

set(handles.edit5, 'string',strcat(num2str(C0)));
set(handles.edit6, 'string',strcat(num2str(D0)));


%循环左移2位
function pushbutton5_Callback(hObject, eventdata, handles)
global C0;
global D0;
global Key;

for i=1:26
    temp(i)=C0(i+2);
end
temp(27)=C0(1);
temp(28)=C0(2);

for i=1:28
    Key(i)=temp(i);
    C0(i)=temp(i);
end

for i=1:26
    temp(i)=D0(i+2);
end
temp(27)=D0(1);
temp(28)=D0(2);

for i=1:28
    Key(i+28)=temp(i);
    D0(i)=temp(i);
end

set(handles.edit5, 'string',strcat(num2str(C0)));
set(handles.edit6, 'string',strcat(num2str(D0)));



function edit7_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%位选择函数E
function pushbutton6_Callback(hObject, eventdata, handles)
global R0;
E = [32,1,2,3,4,5,4,5,6,7,8,9,8,9,10,11,12,13,12,13,14,15,16,17,16,17,18,19,20,21,20,21,22,23,24,25,24,25,26,27,28,29,28,29,30,31,32,1];
global R;
for i=1:48
    R(i) = R0(E(i));
end

set(handles.edit8, 'string',strcat(num2str(R)));


%置换函数P
function pushbutton7_Callback(hObject, eventdata, handles)
global R0;
P=[16,7,20,21,29,12,28,17,1,15,23,26,5,18,31,10,2,8,24,14,32,27,3,9,19,13,30,6,22,11,4,25];
for i=1:32
    temp(i)=R0(P(i));
end

for i=1:32
    R0(i)=temp(i);
end
set(handles.edit3, 'string',strcat(num2str(R0)));


function edit8_Callback(hObject, eventdata, handles)


function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%异或运算XOR
function pushbutton8_Callback(hObject, eventdata, handles)
global KeyFinal;
global R;
for i=1:48
    R(i)=xor(R(i),KeyFinal(i));
end

set(handles.edit8, 'string',strcat(num2str(R)));


%S盒运算
function pushbutton9_Callback(hObject, eventdata, handles)
global R;
global B;
global R0;
t=1;
for i=1:8
    for j=1:6
        B(i,j)=R(t);
        t=t+1;
    end
end

S(:,:,1)=[14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7, 
           0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8,
           4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0,
          15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13];  
             
S(:,:,2)=[15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,
           3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,  
           0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,
          13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9]; 
            
S(:,:,3)=[10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,
          13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1, 
          13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7, 
           1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12];  
              
 S(:,:,4)=[7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15;  
          13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9;
          10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4;  
           3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14];  
          
 S(:,:,5)=[2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,
           14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,  
            4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,  
           11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3];  
    
 S(:,:,6)=[12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11, 
           10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,  
            9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,  
            4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13];  
            
 S(:,:,7)=[4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1, 
          13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6' 
           1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2'  
           6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12];  
             
 S(:,:,8)=[13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7, 
            1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,  
            7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,  
            2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11];
 
 H =[0,0,0,0;0,0,0,1;0,0,1,0;0,0,1,1;0,1,0,0;0,1,0,1;0,1,1,0;0,1,1,1;1,0,0,0;1,0,0,1;1,0,1,0;1,0,1,1;1,1,0,0;1,1,0,1;1,1,1,0;1,1,1,1];
 for i=1:8
     if     (B(i,1)==0) && (B(i,6)==0) t=1;
     elseif (B(i,1)==0) && (B(i,6)==1) t=2;
     elseif (B(i,1)==1) && (B(i,6)==0) t=3;
     elseif (B(i,1)==1) && (B(i,6)==1) t=4;
     end
     if     (B(i,2)==0) && (B(i,3)==0) &&(B(i,4)==0) && (B(i,5)==0) j=1;
     elseif (B(i,2)==0) && (B(i,3)==0) &&(B(i,4)==0) && (B(i,5)==1) j=2;
     elseif (B(i,2)==0) && (B(i,3)==0) &&(B(i,4)==1) && (B(i,5)==0) j=3;
     elseif (B(i,2)==0) && (B(i,3)==0) &&(B(i,4)==1) && (B(i,5)==1) j=4;
     elseif (B(i,2)==0) && (B(i,3)==1) &&(B(i,4)==0) && (B(i,5)==0) j=5;   
     elseif (B(i,2)==0) && (B(i,3)==1) &&(B(i,4)==0) && (B(i,5)==1) j=6;    
     elseif (B(i,2)==0) && (B(i,3)==1) &&(B(i,4)==1) && (B(i,5)==0) j=7;    
     elseif (B(i,2)==0) && (B(i,3)==1) &&(B(i,4)==1) && (B(i,5)==1) j=8   
     elseif (B(i,2)==1) && (B(i,3)==0) &&(B(i,4)==0) && (B(i,5)==0) j=9;   
     elseif (B(i,2)==1) && (B(i,3)==0) &&(B(i,4)==0) && (B(i,5)==1) j=10;
     elseif (B(i,2)==1) && (B(i,3)==0) &&(B(i,4)==1) && (B(i,5)==0) j=11;   
     elseif (B(i,2)==1) && (B(i,3)==0) &&(B(i,4)==1) && (B(i,5)==1) j=12;
     elseif (B(i,2)==1) && (B(i,3)==1) &&(B(i,4)==0) && (B(i,5)==0) j=13;   
     elseif (B(i,2)==1) && (B(i,3)==1) &&(B(i,4)==0) && (B(i,5)==1) j=14;
     elseif (B(i,2)==1) && (B(i,3)==1) &&(B(i,4)==1) && (B(i,5)==0) j=15;
     elseif (B(i,2)==1) && (B(i,3)==1) &&(B(i,4)==1) && (B(i,5)==1) j=16;
     end
     temp(i)=S(t,j,i);
 end
 
 t=1;
 for i=1:8
    for k=1:4
        R0(t)=H(temp(i)+1,k);
        t=t+1;
    end
 end
 
 set(handles.edit8, 'string',strcat(num2str(R0)));


%交换L, R
function pushbutton10_Callback(hObject, eventdata, handles)
global L0;
global R0;
for i=1:32
    temp=L0(i);
    L0(i)=R0(i);
    R0(i)=temp;
end

set(handles.edit2, 'string',strcat(num2str(L0)));
set(handles.edit3, 'string',strcat(num2str(R0)));


%逆初始置换IP逆
function pushbutton11_Callback(hObject, eventdata, handles)
global closecode;
global L0;
global R0;
for i=1:32
    closecode(i)=L0(i);
end
for i=1:32
    closecode(i+32)=R0(i);
end
IPR=[40,8,48,16,56,24,64,32,39,7,47,15,55,23,63,31,38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29,36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27,34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25];
for i=1:64
    temp(i)=closecode(IPR(i));
end
for i=1:64
    closecode(i)=temp(i)
end

set(handles.edit9, 'string',strcat(num2str(closecode)));

function edit9_Callback(hObject, eventdata, handles)

function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
