function varargout = Task6(varargin)
% TASK6 MATLAB code for Task6.fig
%      TASK6, by itself, creates a new TASK6 or raises the existing
%      singleton*.
%
%      H = TASK6 returns the handle to a new TASK6 or the handle to
%      the existing singleton*.
%
%      TASK6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK6.M with the given input arguments.
%
%      TASK6('Property','Value',...) creates a new TASK6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task6

% Last Modified by GUIDE v2.5 24-Dec-2016 19:06:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task6_OpeningFcn, ...
                   'gui_OutputFcn',  @Task6_OutputFcn, ...
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


% --- Executes just before Task6 is made visible.
function Task6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task6 (see VARARGIN)

% Choose default command line output for Task6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Task6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Task6_OutputFcn(hObject, eventdata, handles) 
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
elseif(strcmp(str{val},'Exit'))
close(Task6);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
handles.text4.Visible='off';
handles.text5.Visible='off';
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
[NumberOfFlowers, NumberOfPetalsPerFlower] = SegmentFlowers(handles.Image);
handles.text4.Visible='on';
handles.text5.Visible='on';
set(handles.text4,'String',num2str(NumberOfFlowers));
set(handles.text5,'String',num2str(NumberOfPetalsPerFlower));
