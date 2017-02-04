function varargout = ImageShop(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageShop_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageShop_OutputFcn, ...
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


% --- Executes just before ImageShop is made visible.
function ImageShop_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for ImageShop
handles.output = hObject;

handles.Index=0;
handles.NumOfImage=0;
handles.ImageCell=[];

handles.Count=0;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ImageShop_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in File.
function File_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Open'))
    
handles.Index=0;
handles.NumOfImage=0;
handles.ImageCell=[];
        
[FileName,~,~] = uigetfile({'*.*;*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' });
handles.OriginalImage=imread(FileName);

handles.NumOfImage=handles.NumOfImage+1;
handles.Index=handles.NumOfImage;
handles.ImageCell{handles.NumOfImage}=handles.OriginalImage;

axes(handles.axes10);
imshow(handles.OriginalImage);

cla(handles.axes11,'reset');
handles.axes11.Visible='off';
cla(handles.axes12,'reset');
handles.axes12.Visible='off';
cla(handles.axes13,'reset');
handles.axes13.Visible='off';
cla(handles.axes14,'reset');
handles.axes14.Visible='off';
cla(handles.axes15,'reset');
handles.axes15.Visible='off';
cla(handles.axes16,'reset');
handles.axes16.Visible='off';
cla(handles.axes17,'reset');
handles.axes17.Visible='off';

axes(handles.axes1);
imshow(handles.OriginalImage);

Red=handles.OriginalImage;
Red(:,:,2)=0;
Red(:,:,3)=0;
axes(handles.axes2);
imshow(Red);

Green=handles.OriginalImage;
Green(:,:,1)=0;
Green(:,:,3)=0;
axes(handles.axes3);
imshow(Green);

Blue=handles.OriginalImage;
Blue(:,:,1)=0;
Blue(:,:,2)=0;
axes(handles.axes4);
imshow(Blue);

Gray=rgb2gray(handles.OriginalImage);
axes(handles.axes5);
imshow(Gray);


Red = handles.OriginalImage(:,:,1);
Green = handles.OriginalImage(:,:,2);
Blue = handles.OriginalImage(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);

axes(handles.axes6);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');


guidata(hObject, handles);
elseif(strcmp(str{val},'Save'))
imsave(handles.axes1);
elseif(strcmp(str{val},'Exit'))
close(ImageShop);
elseif(strcmp(str{val},'Close All Windows'))
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
cla(handles.axes2,'reset');
handles.axes2.Visible='off';
cla(handles.axes3,'reset');
handles.axes3.Visible='off';
cla(handles.axes4,'reset');
handles.axes4.Visible='off';   
cla(handles.axes5,'reset');
handles.axes5.Visible='off';   
cla(handles.axes6,'reset');
handles.axes6.Visible='off';   
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
% --- Executes on selection change in GeometricOperations.
function GeometricOperations_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Translate'))
TranslateGUI;    
elseif(strcmp(str{val},'Scale'))
ScaleGUI;
elseif(strcmp(str{val},'Rotate'))
RotateGUI;    
elseif(strcmp(str{val},'Shearing'))
ShearingGUI;
elseif(strcmp(str{val},'ALL Geometric Transformation'))
AllGUI;    
elseif(strcmp(str{val},'Flipping'))
FlippingGUI;
elseif(strcmp(str{val},'Warpping'))
Warping;
elseif(strcmp(str{val},'Crop'))
CropGUI;    
end    
% --- Executes during object creation, after setting all properties.
function GeometricOperations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GeometricOperations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in PixelOperations.
function PixelOperations_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Channel Operation'))
ChannelOperationGUI;    
elseif(strcmp(str{val},'Color Correction'))
ColorCorrGUI;
elseif(strcmp(str{val},'Image Algebra'))
AlgebraGUI;
elseif(strcmp(str{val},'Bordering'))
BorderGUI;
elseif(strcmp(str{val},'Bit Plan Slicing'))
SlicingGUI;
elseif(strcmp(str{val},'Paint'))
PaintGUI;
elseif(strcmp(str{val},'Image Effects'))
ImageEffectGUI;    
end    
% --- Executes during object creation, after setting all properties.
function PixelOperations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PixelOperations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in openptn.
function openptn_Callback(hObject, eventdata, handles)

handles.Index=0;
handles.NumOfImage=0;
handles.ImageCell=[];

[FileName,~,~] = uigetfile({'*.*;*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' });
handles.OriginalImage=imread(FileName);

handles.NumOfImage=handles.NumOfImage+1;
handles.Index=handles.NumOfImage;
handles.ImageCell{handles.NumOfImage}=handles.OriginalImage;

axes(handles.axes10);
imshow(handles.OriginalImage);

cla(handles.axes11,'reset');
handles.axes11.Visible='off';
cla(handles.axes12,'reset');
handles.axes12.Visible='off';
cla(handles.axes13,'reset');
handles.axes13.Visible='off';
cla(handles.axes14,'reset');
handles.axes14.Visible='off';
cla(handles.axes15,'reset');
handles.axes15.Visible='off';
cla(handles.axes16,'reset');
handles.axes16.Visible='off';
cla(handles.axes17,'reset');
handles.axes17.Visible='off';


axes(handles.axes1);
imshow(handles.OriginalImage);

Red=handles.OriginalImage;
Red(:,:,2)=0;
Red(:,:,3)=0;
axes(handles.axes2);
imshow(Red);

Green=handles.OriginalImage;
Green(:,:,1)=0;
Green(:,:,3)=0;
axes(handles.axes3);
imshow(Green);

Blue=handles.OriginalImage;
Blue(:,:,1)=0;
Blue(:,:,2)=0;
axes(handles.axes4);
imshow(Blue);

Gray=rgb2gray(handles.OriginalImage);
axes(handles.axes5);
imshow(Gray);


Red = handles.OriginalImage(:,:,1);
Green = handles.OriginalImage(:,:,2);
Blue = handles.OriginalImage(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);

axes(handles.axes6);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
guidata(hObject, handles);

% --- Executes on button press in closeptn.
function closeptn_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
handles.axes1.Visible='off';
cla(handles.axes2,'reset');
handles.axes2.Visible='off';
cla(handles.axes3,'reset');
handles.axes3.Visible='off';
cla(handles.axes4,'reset');
handles.axes4.Visible='off';   
cla(handles.axes5,'reset');
handles.axes5.Visible='off';   
cla(handles.axes6,'reset');
handles.axes6.Visible='off';  

handles.Index=0;
handles.NumOfImage=0;
handles.ImageCell=[];

cla(handles.axes10,'reset');
handles.axes10.Visible='off';
cla(handles.axes11,'reset');
handles.axes11.Visible='off';
cla(handles.axes12,'reset');
handles.axes12.Visible='off';
cla(handles.axes13,'reset');
handles.axes13.Visible='off';
cla(handles.axes14,'reset');
handles.axes14.Visible='off';
cla(handles.axes15,'reset');
handles.axes15.Visible='off';
cla(handles.axes16,'reset');
handles.axes16.Visible='off';
cla(handles.axes17,'reset');
handles.axes17.Visible='off';

guidata(hObject,handles);

% --- Executes on button press in saveptn.
function saveptn_Callback(hObject, eventdata, handles)
imsave(handles.axes1);

% --- Executes on button press in refreshptn.
function refreshptn_Callback(hObject, eventdata, handles)
handles.OriginalImage=getappdata(0,'ReturnImage');

handles.NumOfImage=handles.NumOfImage+1;
handles.Index=handles.NumOfImage;
handles.ImageCell{handles.NumOfImage}=handles.OriginalImage;

if(handles.NumOfImage == 1)
axes(handles.axes10);
elseif(handles.NumOfImage == 2)
axes(handles.axes11);
elseif(handles.NumOfImage == 3)
axes(handles.axes12);
elseif(handles.NumOfImage == 4)
axes(handles.axes13);
elseif(handles.NumOfImage == 5)
axes(handles.axes14);
elseif(handles.NumOfImage == 6)
axes(handles.axes15);
elseif(handles.NumOfImage == 7)
axes(handles.axes16);
elseif(handles.NumOfImage == 8)
axes(handles.axes17);
end
imshow(handles.OriginalImage);


axes(handles.axes1);
imshow(handles.OriginalImage);

Red=handles.OriginalImage;
Red(:,:,2)=0;
Red(:,:,3)=0;
axes(handles.axes2);
imshow(Red);

Green=handles.OriginalImage;
Green(:,:,1)=0;
Green(:,:,3)=0;
axes(handles.axes3);
imshow(Green);

Blue=handles.OriginalImage;
Blue(:,:,1)=0;
Blue(:,:,2)=0;
axes(handles.axes4);
imshow(Blue);

Gray=rgb2gray(handles.OriginalImage);
axes(handles.axes5);
imshow(Gray);



Red = handles.OriginalImage(:,:,1);
Green = handles.OriginalImage(:,:,2);
Blue = handles.OriginalImage(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
axes(handles.axes6);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
guidata(hObject,handles);

% --- Executes on button press in undoptn.
function undoptn_Callback(hObject, eventdata, handles)
if(handles.Index >1)
    
handles.Index=handles.Index-1;    
handles.OriginalImage=handles.ImageCell{handles.Index};    
    
axes(handles.axes1);
imshow(handles.OriginalImage);

Red=handles.OriginalImage;
Red(:,:,2)=0;
Red(:,:,3)=0;
axes(handles.axes2);
imshow(Red);

Green=handles.OriginalImage;
Green(:,:,1)=0;
Green(:,:,3)=0;
axes(handles.axes3);
imshow(Green);

Blue=handles.OriginalImage;
Blue(:,:,1)=0;
Blue(:,:,2)=0;
axes(handles.axes4);
imshow(Blue);

Gray=rgb2gray(handles.OriginalImage);
axes(handles.axes5);
imshow(Gray);

Red = handles.OriginalImage(:,:,1);
Green = handles.OriginalImage(:,:,2);
Blue = handles.OriginalImage(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
axes(handles.axes6);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
guidata(hObject,handles);
        
end

% --- Executes on button press in doptn.
function doptn_Callback(hObject, eventdata, handles)

if(handles.NumOfImage - handles.Index > 0 )
handles.Index=handles.Index+1;    
handles.OriginalImage=handles.ImageCell{handles.Index};    
    
axes(handles.axes1);
imshow(handles.OriginalImage);

Red=handles.OriginalImage;
Red(:,:,2)=0;
Red(:,:,3)=0;
axes(handles.axes2);
imshow(Red);

Green=handles.OriginalImage;
Green(:,:,1)=0;
Green(:,:,3)=0;
axes(handles.axes3);
imshow(Green);

Blue=handles.OriginalImage;
Blue(:,:,1)=0;
Blue(:,:,2)=0;
axes(handles.axes4);
imshow(Blue);

Gray=rgb2gray(handles.OriginalImage);
axes(handles.axes5);
imshow(Gray);



Red = handles.OriginalImage(:,:,1);
Green = handles.OriginalImage(:,:,2);
Blue = handles.OriginalImage(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
axes(handles.axes6);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
guidata(hObject,handles);
end

% --- Executes on selection change in Themes.
function Themes_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Gray'))
handles.Gui1.Color=[0.863,0.863,0.863];
handles.P1.BackgroundColor=[0.247,0.247,0.247];
handles.P2.BackgroundColor=[0.314,0.314,0.314];
handles.P3.BackgroundColor=[0.314,0.314,0.314];
handles.text32.BackgroundColor=[0.314,0.314,0.314];
handles.text2.BackgroundColor=[0.314,0.314,0.314];
elseif(strcmp(str{val},'Green'))
handles.Gui1.Color=[0.839,0.91,0.851];
handles.P1.BackgroundColor=[0.247,0.247,0.247];
handles.P2.BackgroundColor=[0.314,0.314,0.314];
handles.P3.BackgroundColor=[0.314,0.314,0.314];
handles.text32.BackgroundColor=[0.314,0.314,0.314];
handles.text2.BackgroundColor=[0.314,0.314,0.314];
elseif(strcmp(str{val},'Blue'))
handles.Gui1.Color=[0.7,0.7,1.0];    
handles.P1.BackgroundColor=[0.3,0.3,0.5];
handles.P2.BackgroundColor=[0.3,0.3,0.5];
handles.P3.BackgroundColor=[0.3,0.3,0.5];
handles.text32.BackgroundColor=[0.3,0.3,0.5];
handles.text2.BackgroundColor=[0.3,0.3,0.5];
elseif(strcmp(str{val},'Black'))
handles.Gui1.Color=[0.1,0.1,0.1];    
handles.P1.BackgroundColor=[0.247,0.247,0.247];
handles.P2.BackgroundColor=[0.314,0.314,0.314];
handles.P3.BackgroundColor=[0.314,0.314,0.314];
handles.text32.BackgroundColor=[0.314,0.314,0.314];
handles.text2.BackgroundColor=[0.314,0.314,0.314];
end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function Themes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Themes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
SlideShowGUI;


% --- Executes on selection change in Tasks.
function Tasks_Callback(hObject, eventdata, handles)
str = get(hObject,'String') ;
val = get(hObject,'Value');
if(strcmp(str{val},'Fingerprint Recognition'))
Task3;
elseif(strcmp(str{val},'Detect Road Signs'))
Task4;
elseif(strcmp(str{val},'Seperate Yin-Yang'))
Task5;    
elseif(strcmp(str{val},'Count Flowers&Petals'))
Task6;    
elseif(strcmp(str{val},'Detect And Remove ("Moire Patterns") '))
Task7;    
end

% --- Executes during object creation, after setting all properties.
function Tasks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tasks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
