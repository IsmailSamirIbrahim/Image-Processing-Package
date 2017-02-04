function varargout = Task3(varargin)
% TASK3 MATLAB code for Task3.fig
%      TASK3, by itself, creates a new TASK3 or raises the existing
%      singleton*.
%
%      H = TASK3 returns the handle to a new TASK3 or the handle to
%      the existing singleton*.
%
%      TASK3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK3.M with the given input arguments.
%
%      TASK3('Property','Value',...) creates a new TASK3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task3

% Last Modified by GUIDE v2.5 24-Dec-2016 18:12:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task3_OpeningFcn, ...
                   'gui_OutputFcn',  @Task3_OutputFcn, ...
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


% --- Executes just before Task3 is made visible.
function Task3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task3 (see VARARGIN)

% Choose default command line output for Task3
handles.output = hObject;
handles.Count=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Task3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Task3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in File.
function File_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Open'))
[FileName,~,~] = uigetfile({'*.*;*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' });
if(handles.Count==0)
handles.Image1=imread(FileName);
axes(handles.axes1);
imshow(handles.Image1);
handles.Count=handles.Count+1;
else
handles.Image2=imread(FileName);
axes(handles.axes2);
imshow(handles.Image2);
handles.Count=handles.Count-1;
end
guidata(hObject, handles);
elseif(strcmp(str{val},'Save'))
imsave(handles.axes2);
elseif(strcmp(str{val},'Exit'))
close(Task3);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
cla(handles.axes2,'reset');
handles.axes2.Visible='off';
handles.Count=0;
handles.text4.Visible='off';
handles.text8.Visible='off';
handles.text9.Visible='off';
guidata(hObject, handles);
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
DW=str2num(get(handles.edit1,'String'));
DH=str2num(get(handles.edit2,'String'));
[AlignedImage, ~] = Align(handles.Image1, DW, DH);
handles.Result=AlignedImage;
axes(handles.axes2);
imshow(handles.Result);
guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
[Endpoints ,Bifurcations] = ExtractMinutiae(handles.Image1);

handles.text8.Visible='on';
handles.text9.Visible='on';
set(handles.text8,'String',num2str(size(Endpoints,2)));
set(handles.text9,'String',num2str(size(Bifurcations,2)));

axes(handles.axes2);
imshow(handles.Image1);
hold on
plot(Endpoints(2,:),Endpoints(1,:),'ro');
hold off
hold on
plot(Bifurcations(2,:),Bifurcations(1,:),'bo');
hold off
axes(handles.axes1);
imshow(handles.Image1);
guidata(hObject, handles);


% --- Executes on button press in ptnMatch1.
function ptnMatch1_Callback(hObject, eventdata, handles)
[Endpoints ,Bifurcations] = ExtractMinutiae(handles.Image);
axes(handles.axes2);
imshow(handles.Image);
hold on
plot(Endpoints(2,:),Endpoints(1,:),'ro');
hold off
hold on
plot(Bifurcations(2,:),Bifurcations(1,:),'bo');
hold off
axes(handles.axes1);
imshow(handles.Image);
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
D = MatchFingers(handles.Image1,handles.Image2,10,25);
handles.text4.Visible='on';
if(D==1)
    set(handles.text4,'String','Accepted');
else
    set(handles.text4,'String','Rejected');
end
