function varargout = PaintGUI(varargin)
% PAINTGUI MATLAB code for PaintGUI.fig
%      PAINTGUI, by itself, creates a new PAINTGUI or raises the existing
%      singleton*.
%
%      H = PAINTGUI returns the handle to a new PAINTGUI or the handle to
%      the existing singleton*.
%
%      PAINTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAINTGUI.M with the given input arguments.
%
%      PAINTGUI('Property','Value',...) creates a new PAINTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PaintGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PaintGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PaintGUI

% Last Modified by GUIDE v2.5 15-Dec-2016 13:23:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PaintGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PaintGUI_OutputFcn, ...
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


% --- Executes just before PaintGUI is made visible.
function PaintGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PaintGUI (see VARARGIN)

% Choose default command line output for PaintGUI
handles.output = hObject;

h = findobj('Tag','Gui1');
handles.Gui1data = guidata(h);
axes(handles.axes1);
handles.Image=handles.Gui1data.OriginalImage;
imshow(handles.Image);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PaintGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PaintGUI_OutputFcn(hObject, eventdata, handles) 
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
imsave(handles.axes1);
elseif(strcmp(str{val},'Exit'))
close(PaintGUI);
elseif(strcmp(str{val},'Close Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
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
c = uisetcolor; 
cc=[255,255,255];
cc=cc .*c;
handles.Color=cc;

handles.text10.BackgroundColor=c;
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.Result = Paint(handles.Image, handles.Color);
axes(handles.axes1);
imshow(handles.Result);
handles.Image=handles.Result;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
setappdata(0,'ReturnImage',handles.Result);
close(PaintGUI);
