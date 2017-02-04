function varargout = SlideShowGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SlideShowGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SlideShowGUI_OutputFcn, ...
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

% --- Executes just before SlideShowGUI is made visible.
function SlideShowGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SlideShowGUI (see VARARGIN)

% Choose default command line output for SlideShowGUI
handles.output = hObject;
handles.Index=1;
handles.Flage=0;
handles.Count=1;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = SlideShowGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
handles.Flage=1;
Value=get(handles.edit1 ,'String');
handles.Time=str2num(Value);
pause on;
for i=1:size(handles.imgNameList,1)
    a=imread(handles.imgNameList(i,:));
    imshow(a);
    drawnow;
    handles.Index=i;
    guidata(hObject,handles);
    pause(handles.Time);
end
cla(handles.axes1,'reset');
handles.axes1.Visible='off';

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Open'))
[handles.Files, ~, ~] = uigetfile({'*.*'}, 'Select file(s)', 'MultiSelect', 'on');
handles.imgNameList=char(handles.Files);
Image=imread(handles.imgNameList(1,:));
axes(handles.axes1);
imshow(Image);
guidata(hObject, handles);
elseif(strcmp(str{val},'Exit'))
close(SlideShowGUI);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
if(handles.Index >= 1 && handles.Flage == 1)
a=imread(handles.imgNameList(handles.Index,:));
imshow(a);
drawnow;
else
handles.Count=handles.Count-1; 
a=imread(handles.imgNameList(handles.Count,:));
imshow(a);
drawnow;
guidata(hObject,handles);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
if(handles.Index+1 <= size(handles.imgNameList,1) &&handles.Flage == 1)
a=imread(handles.imgNameList(handles.Index+1,:));
imshow(a);
drawnow;
else
handles.Count=handles.Count+1;    
a=imread(handles.imgNameList(handles.Count,:));
imshow(a);
drawnow;    
guidata(hObject,handles);
end
