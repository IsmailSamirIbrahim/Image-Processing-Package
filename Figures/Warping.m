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
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for untitled
handles.output = hObject;
h = findobj('Tag','Gui1');
handles.Gui1data= guidata(h);
axes(handles.axes3);
handles.Image1=handles.Gui1data.OriginalImage;
imshow(handles.Image1);
handles.Image2=imread('black.bmp');
axes(handles.axes4);
imshow(handles.Image2);
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
function e8_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function e8_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e6_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e4_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e5_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e7_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e9_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e10_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e11_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e12_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e13_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e16_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e16_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function e15_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e15_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function e14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.Image2=imread('black.bmp');
guidata(hObject,handles);
axes(handles.axes4);
imshow(handles.Image2);

[X ,Y]=ginput;
Tmp1(1,:)=X;
Tmp1(2,:)=Y;

[XX ,YY]=ginput;
Tmp2(1,:)=XX;
Tmp2(2,:)=YY;

handles.Pst1=Tmp1;
handles.Pst2=Tmp2;

guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
x1=str2num(get(handles.e1,'String'));
x2=str2num(get(handles.e2,'String'));
x3=str2num(get(handles.e3,'String'));
x4=str2num(get(handles.e4,'String'));

y1=str2num(get(handles.e5,'String'));
y2=str2num(get(handles.e6,'String'));
y3=str2num(get(handles.e7,'String'));
y4=str2num(get(handles.e8,'String'));

Pst1(1,:)=[x1,x2,x3,x4];
Pst1(2,:)=[y1,y2,y3,y4];


x5=str2num(get(handles.e9,'String'));
x6=str2num(get(handles.e10,'String'));
x7=str2num(get(handles.e11,'String'));
x8=str2num(get(handles.e12,'String'));

y5=str2num(get(handles.e13,'String'));
y6=str2num(get(handles.e14,'String'));
y7=str2num(get(handles.e15,'String'));
y8=str2num(get(handles.e16,'String'));

Pst2(1,:)=[x5,x6,x7,x8];
Pst2(2,:)=[y5,y6,y7,y8];

Tmp=get(handles.Select,'SelectedObject');
Check=get(Tmp,'String');
if(strcmp(Check,'Manual'))
R=Warp(handles.Image1,handles.Pst1,handles.Pst2);
elseif(strcmp(Check,'Given'));
R=Warp(handles.Image1,Pst1,Pst2);
end
handles.Result=R;
axes(handles.axes5);
imshow(handles.Result);
guidata(hObject, handles);

% --- Executes on selection change in File.
function File_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Open'))
[FileName,~,~] = uigetfile({'*.*;*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' });
handles.Image1=imread(FileName);
axes(handles.axes3);
imshow(handles.Image1);

handles.Image2=imread('black.bmp');
axes(handles.axes4);
imshow(handles.Image2);
guidata(hObject, handles);
elseif(strcmp(str{val},'Save'))
imsave(handles.axes5);
elseif(strcmp(str{val},'Exit'))
close(Warping);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes3,'reset');
handles.axes3.Visible='off';
cla(handles.axes4,'reset');
handles.axes4.Visible='off';
cla(handles.axes5,'reset');
handles.axes5.Visible='off';
end

% --- Executes during object creation, after setting all properties.
function File_CreateFcn(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
setappdata(0,'ReturnImage',handles.Result);
close(Warping);
