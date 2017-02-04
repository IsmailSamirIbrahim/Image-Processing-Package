function varargout = SlicingGUI(varargin)
% SLICINGGUI MATLAB code for SlicingGUI.fig
%      SLICINGGUI, by itself, creates a new SLICINGGUI or raises the existing
%      singleton*.
%
%      H = SLICINGGUI returns the handle to a new SLICINGGUI or the handle to
%      the existing singleton*.
%
%      SLICINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLICINGGUI.M with the given input arguments.
%
%      SLICINGGUI('Property','Value',...) creates a new SLICINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SlicingGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SlicingGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SlicingGUI

% Last Modified by GUIDE v2.5 15-Dec-2016 09:39:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SlicingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SlicingGUI_OutputFcn, ...
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


% --- Executes just before SlicingGUI is made visible.
function SlicingGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SlicingGUI (see VARARGIN)

% Choose default command line output for SlicingGUI
handles.output = hObject;

h = findobj('Tag','Gui1');
handles.Gui1data = guidata(h);
axes(handles.axes1);
handles.Image=handles.Gui1data.OriginalImage;
imshow(handles.Image);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SlicingGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SlicingGUI_OutputFcn(hObject, eventdata, handles) 
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
close(TranslateGUI);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
cla(handles.axes2,'reset');
handles.axes2.Visible='off';
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
handles.str = get(hObject,'String');
handles.val = get(hObject,'Value');
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
str=handles.str;
val=handles.val;
Bit=[];

if(strcmp(str{val},'0'))
Bit=1;
elseif(strcmp(str{val},'1'))
Bit=2;
elseif(strcmp(str{val},'2'))
Bit=4;
elseif(strcmp(str{val},'3'))
Bit=8;
elseif(strcmp(str{val},'4'))
Bit=16;
elseif(strcmp(str{val},'5'))
Bit=32;
elseif(strcmp(str{val},'6'))
Bit=64;
elseif(strcmp(str{val},'7'))
Bit=128;
end

handles.Result = ImageSlicing(handles.Image,Bit);
axes(handles.axes2);
imshow(handles.Result);
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
setappdata(0,'ReturnImage',handles.Result);
close(SlicingGUI);
