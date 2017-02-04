function varargout = Task4(varargin)
% TASK4 MATLAB code for Task4.fig
%      TASK4, by itself, creates a new TASK4 or raises the existing
%      singleton*.
%
%      H = TASK4 returns the handle to a new TASK4 or the handle to
%      the existing singleton*.
%
%      TASK4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK4.M with the given input arguments.
%
%      TASK4('Property','Value',...) creates a new TASK4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task4

% Last Modified by GUIDE v2.5 24-Dec-2016 18:46:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task4_OpeningFcn, ...
                   'gui_OutputFcn',  @Task4_OutputFcn, ...
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


% --- Executes just before Task4 is made visible.
function Task4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task4 (see VARARGIN)

% Choose default command line output for Task4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Task4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Task4_OutputFcn(hObject, eventdata, handles) 
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
handles.Image=imread(FileName);
axes(handles.axes1);
imshow(handles.Image);
guidata(hObject, handles);
elseif(strcmp(str{val},'Save'))
imsave(handles.axes2);
elseif(strcmp(str{val},'Exit'))
close(Task4);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
cla(handles.axes2,'reset');
handles.axes2.Visible='off';
cla(handles.axes3,'reset');
handles.axes3.Visible='off';
handles.text3.Visible='off';
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
[SegmentedSign, SignShape] = SegmentSign(handles.Image);
handles.text3.Visible='on';
if(SignShape==1)
    set(handles.text3,'String','Circle');
elseif(SignShape==0)
    set(handles.text3,'String','Triangle');
else
    set(handles.text3,'String','Diamond');
end

if(size(SegmentedSign,2) == 1)
axes(handles.axes2);
imshow(SegmentedSign{1});
else
axes(handles.axes2);
imshow(SegmentedSign{1});
axes(handles.axes3);
imshow(SegmentedSign{2});
end
guidata(hObject, handles);
