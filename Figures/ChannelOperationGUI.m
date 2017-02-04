function varargout = ChannelOperationGUI(varargin)
% CHANNELOPERATIONGUI MATLAB code for ChannelOperationGUI.fig
%      CHANNELOPERATIONGUI, by itself, creates a new CHANNELOPERATIONGUI or raises the existing
%      singleton*.
%
%      H = CHANNELOPERATIONGUI returns the handle to a new CHANNELOPERATIONGUI or the handle to
%      the existing singleton*.
%
%      CHANNELOPERATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANNELOPERATIONGUI.M with the given input arguments.
%
%      CHANNELOPERATIONGUI('Property','Value',...) creates a new CHANNELOPERATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChannelOperationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChannelOperationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChannelOperationGUI

% Last Modified by GUIDE v2.5 24-Dec-2016 20:17:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChannelOperationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ChannelOperationGUI_OutputFcn, ...
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

% --- Executes just before ChannelOperationGUI is made visible.
function ChannelOperationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChannelOperationGUI (see VARARGIN)

% Choose default command line output for ChannelOperationGUI
handles.output = hObject;

h = findobj('Tag','Gui1');
handles.Gui1data = guidata(h);
axes(handles.axes1);
handles.Image=handles.Gui1data.OriginalImage;
imshow(handles.Image);
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes ChannelOperationGUI wait for user response (see UIRESUME)
% uiwait(handles.Gui2);

% --- Outputs from this function are returned to the command line.
function varargout = ChannelOperationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Operation.
function Operation_Callback(hObject, eventdata, handles)
handles.str = get(hObject,'String') ;
handles.val = get(hObject,'Value');
if(strcmp(handles.str{handles.val},'Brightness'))
imshow(handles.Image);       
handles.Brightness.Visible='on';
handles.Gamma.Visible='off';
handles.Contrast.Visible='off';
handles.Channel.Visible='off';
handles.BrightChannel.Visible='off';
elseif(strcmp(handles.str{handles.val},'Gamma'))
imshow(handles.Image);       
handles.Brightness.Visible='off';
handles.Gamma.Visible='on';
handles.Contrast.Visible='off';
handles.Channel.Visible='off';
handles.BrightChannel.Visible='off';
elseif(strcmp(handles.str{handles.val},'Contrast'))
imshow(handles.Image);       
handles.Brightness.Visible='off';
handles.Gamma.Visible='off';
handles.Contrast.Visible='on';
handles.Channel.Visible='off';
handles.BrightChannel.Visible='off';
elseif(strcmp(handles.str{handles.val},'BrightChannel'))
handles.Brightness.Visible='off';
handles.Gamma.Visible='off';
handles.Contrast.Visible='off';
handles.Channel.Visible='on';
handles.BrightChannel.Visible='on';
end
axes(handles.axes1);
imshow(handles.Image);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Operation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Brightness_Callback(hObject, eventdata, handles)
if(strcmp(handles.str{handles.val},'Brightness'))
Value=get(handles.Brightness,'Value');
set(handles.text3,'String',num2str(Value));
handles.Result=handles.Image +Value;
imshow(handles.Result);
guidata(hObject,handles);
end  
% --- Executes during object creation, after setting all properties.
function Brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


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
close(ChannelOperationGUI);
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


% --- Executes on slider movement.
function Gamma_Callback(hObject, eventdata, handles)
if(strcmp(handles.str{handles.val},'Gamma'))
Value=get(handles.Gamma,'Value');
set(handles.text3,'String',num2str(Value));
handles.Result= Gamma(handles.Image,Value);
axes(handles.axes1);
imshow(handles.Result);
guidata(hObject,handles);
end
% --- Executes during object creation, after setting all properties.
function Gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Contrast_Callback(hObject, eventdata, handles)
if(strcmp(handles.str{handles.val},'Contrast'))
Value=get(handles.Contrast,'Value');
set(handles.text3,'String',num2str(Value));
handles.Result=Contrast(handles.Image, 0, Value);
axes(handles.axes1);
imshow(handles.Result);
guidata(hObject,handles);
end
% --- Executes during object creation, after setting all properties.
function Contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
setappdata(0,'ReturnImage',handles.Result);
close(ChannelOperationGUI);


% --- Executes on selection change in Channel.
function Channel_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
handles.SelectedChannel = str{val}; 
% Save the handles structure.

axes(handles.axes1);
imshow(handles.Image);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function BrightChannel_Callback(hObject, eventdata, handles)
if(strcmp(handles.str{handles.val},'BrightChannel'))
Value=get(handles.BrightChannel,'Value');
set(handles.text3,'String',num2str(Value));
handles.Result = Brightness(handles.Image,handles.SelectedChannel, Value);
axes(handles.axes1);
imshow(handles.Result);
guidata(hObject,handles);
end  

% --- Executes during object creation, after setting all properties.
function BrightChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BrightChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
