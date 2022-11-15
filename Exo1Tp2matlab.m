function varargout = Exo1Tp2matlab(varargin)
% EXO1TP2MATLAB MATLAB code for Exo1Tp2matlab.fig
%      EXO1TP2MATLAB, by itself, creates a new EXO1TP2MATLAB or raises the existing
%      singleton*.
%
%      H = EXO1TP2MATLAB returns the handle to a new EXO1TP2MATLAB or the handle to
%      the existing singleton*.
%
%      EXO1TP2MATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXO1TP2MATLAB.M with the given input arguments.
%
%      EXO1TP2MATLAB('Property','Value',...) creates a new EXO1TP2MATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exo1Tp2matlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exo1Tp2matlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exo1Tp2matlab

% Last Modified by GUIDE v2.5 01-Nov-2022 22:25:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exo1Tp2matlab_OpeningFcn, ...
                   'gui_OutputFcn',  @Exo1Tp2matlab_OutputFcn, ...
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


% --- Executes just before Exo1Tp2matlab is made visible.
function Exo1Tp2matlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exo1Tp2matlab (see VARARGIN)

% Choose default command line output for Exo1Tp2matlab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exo1Tp2matlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Exo1Tp2matlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
img = handles.img;
imshow('img1.jpg','Parent',img);
logo = handles.axes3;
imshow('univlogo.png','Parent',logo);


% --- Executes on button press in calculatebtn.
function calculatebtn_Callback(hObject, eventdata, handles)
% hObject    handle to calculatebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

R1 = str2double(get(handles.R1, 'String'));
R2 = str2double(get(handles.R2, 'String'));
E = str2double(get(handles.E, 'String'));
Rmin = str2double(get(handles.rmin, 'String'));
Rmax = str2double(get(handles.rmax, 'String'));

if isnan(R1) || R1 == 0
    msgbox('R1 is not exist', 'error','error')
elseif isnan(R2) || R2 == 0
    msgbox('R2 is not exist', 'error','error')
elseif isnan(E) 
    msgbox('E is not exist', 'error','error')
elseif isnan(Rmin)
    msgbox('Rmin is not exist', 'error','error')
elseif isnan(Rmax) || Rmax == 0
    msgbox('Rmax is not exist', 'error','error')
elseif Rmin == Rmax 
    msgbox('Rmin == Rmax ', 'error','error')
elseif E == 0 
    msgbox('There are no current in circuit', 'error','error')
elseif Rmin > Rmax 
    msgbox('Rmax less than Rmin', 'error','error')
else 
   
   R = Rmin:Rmax;
    v = ((R2.*R)./((R2.*R)+(R1.*R)+R2*R1)).*E;
    P =(v.^2)./R;
    Pmax= max(P) 
    t = [R',v',P'];
    Rmaxi = t(P == Pmax)
   set(handles.Pmax,'string',['Pmax = ',num2str(Pmax),'  wattes'])
   set(handles.Rmaxi,'string',['R(Pmax) = ',num2str(Rmaxi),' ohms'])
end




function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E as text
%        str2double(get(hObject,'String')) returns contents of E as a double


% --- Executes during object creation, after setting all properties.
function E_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R1_Callback(hObject, eventdata, handles)
% hObject    handle to R1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R1 as text
%        str2double(get(hObject,'String')) returns contents of R1 as a double


% --- Executes during object creation, after setting all properties.
function R1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R2_Callback(hObject, eventdata, handles)
% hObject    handle to R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R2 as text
%        str2double(get(hObject,'String')) returns contents of R2 as a double


% --- Executes during object creation, after setting all properties.
function R2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmin_Callback(hObject, eventdata, handles)
% hObject    handle to rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmin as text
%        str2double(get(hObject,'String')) returns contents of rmin as a double


% --- Executes during object creation, after setting all properties.
function rmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rmax_Callback(hObject, eventdata, handles)
% hObject    handle to rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rmax as text
%        str2double(get(hObject,'String')) returns contents of rmax as a double


% --- Executes during object creation, after setting all properties.
function rmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pmax_Callback(hObject, eventdata, handles)
% hObject    handle to Pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pmax as text
%        str2double(get(hObject,'String')) returns contents of Pmax as a double


% --- Executes during object creation, after setting all properties.
function Pmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rmaxi_Callback(hObject, eventdata, handles)
% hObject    handle to Rmaxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rmaxi as text
%        str2double(get(hObject,'String')) returns contents of Rmaxi as a double


% --- Executes during object creation, after setting all properties.
function Rmaxi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rmaxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pfr.
function pfr_Callback(hObject, eventdata, handles)
% hObject    handle to pfr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pfr


% --- Executes on button press in vfr.
function vfr_Callback(hObject, eventdata, handles)
% hObject    handle to vfr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vfr
R1


% --- Executes when selected object is changed in Func.
function Func_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Func 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R1 = str2double(get(handles.R1, 'String'));
R2 = str2double(get(handles.R2, 'String'));
E = str2double(get(handles.E, 'String'));
Rmin = str2double(get(handles.rmin, 'String'));
Rmax = str2double(get(handles.rmax, 'String'));
R = Rmin:Rmax ;
v = ((R2.*R)./((R2.*R)+(R1.*R)+R2*R1)).*E;
P =(v.^2)./R;
Pmax = max(P) ;

t = [R',v',P'];
Rmaxi = t(P == Pmax);

Vmax = v(end);

hax = handles.plot1;
p1 = P;
p1(:) = Pmax;
r1  =R;
r1(:) = Rmaxi;
r2  =R;
r2(:) = max(R);
v1  =v;
v1(:) = Vmax;
fun = get(handles.Func, 'Selectedobject');
funtag = get(fun, 'Tag');

switch funtag 
        case 'pfr'
            cla(hax)
            hold(hax,'on');
            plot(hax,R,P,'r')
            plot(hax, 0,Pmax,'rx')
            plot(hax,Rmaxi, 0, 'yx')
            plot(hax,Rmaxi,Pmax,'b*')

            plot(hax,R, p1,'k--')
            plot(hax, r1,P,'k--')

            xlabel(hax,'R (ohms) ', 'color','white')
            ylabel(hax,'P (Wattes)', 'color','white')
            title(hax,'P = f(R) ', 'color','white')
            legend(hax,'P = f(R)', 'Pmax','Rmax','m(Rmax,Pmax)')
        case 'vfr'
            cla(hax)
            plot(hax,R,v,'r')
            plot(hax, 0,Vmax,'rx')
            plot(hax,max(R), 0, 'yx')
            plot(hax,max(R),Vmax,'b*')
            
            plot(hax,R, v1,'k--')
            plot(hax, r2,v,'k--')
            
            xlabel(hax,'R (ohms) ', 'color','white')
            ylabel(hax,'v (Volts)', 'color','white')
            title(hax,'v = f(R) ', 'color','white')
            legend(hax,'v = f(R)', 'vmax','Rmax','m(Rmax,vmax)')
    case 'vfp'
        cla(hax)
        plot(hax,P,v );
        xlabel(hax,'P(Wattes) ', 'color','white')
        ylabel(hax,'v (Volts)', 'color','white')
        title(hax,'v = f(P) ', 'color','white')
        legend(hax,'v = f(P)')
    case 'pfv'
        cla(hax)
        plot(hax,v,P);
        ylabel(hax,'P(Wattes) ', 'color','white')
        xlabel(hax,'v (Volts)', 'color','white')
        title(hax,'P= f(v) ', 'color','white')
        legend(hax, 'P = f(v)')
    
end


% --- Executes on button press in grid.
function grid_Callback(hObject, eventdata, handles)
% hObject    handle to grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of grid
gridon = get(handles.grid, 'Value');
hax = handles.plot1
if gridon 
    grid(hax,'on')
else
    grid(hax,'off')
end



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_Callback(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p as text
%        str2double(get(hObject,'String')) returns contents of p as a double


% --- Executes during object creation, after setting all properties.
function p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_Callback(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v as text
%        str2double(get(hObject,'String')) returns contents of v as a double


% --- Executes during object creation, after setting all properties.
function v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rcalbtn.
function rcalbtn_Callback(hObject, eventdata, handles)
% hObject    handle to rcalbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R1 = str2double(get(handles.R1, 'String'));
R2 = str2double(get(handles.R2, 'String'));
E = str2double(get(handles.E, 'String'));
Rmin = str2double(get(handles.rmin, 'String'));
Rmax = str2double(get(handles.rmax, 'String'));
r = str2double(get(handles.r, 'String'));
if isnan(R1)
    msgbox('R1 is not exist', 'error','error')
elseif isnan(R2)
    msgbox('R2 is not exist', 'error','error')
elseif isnan(E)
    msgbox('E is not exist', 'error','error')
elseif isnan(Rmin)
    msgbox('Rmin is not exist', 'error','error')
elseif isnan(Rmax)
    msgbox('Rmax is not exist', 'error','error')
elseif Rmin == Rmax 
    msgbox('Rmin == Rmax ', 'error','error')
elseif E == 0 
    msgbox('There are no current in circuit', 'error','error')
elseif Rmin > Rmax 
    msgbox('Rmax less than Rmin', 'error','error')
elseif r < Rmin || r > Rmax || isnan(r)
    msgbox('R is not in the range', 'error','error')
else 
    v = ((R2*r)/((R2*r)+(R1*r)+R2*R1))*E;
    P =(v^2)/r;
    set(handles.p,'string',['P = ',num2str(P),'  wattes'])
    set(handles.v,'string',['V =  ',num2str(v),' volts'])
end


% --- Executes on button press in resetbtn.
function resetbtn_Callback(hObject, eventdata, handles)
% hObject    handle to resetbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.R1, 'String', '0');
set(handles.R2, 'String', '0');
set(handles.E, 'String', '0');
set(handles.rmax, 'String', '0');
set(handles.rmin, 'String', '0');
set(handles.Rmaxi, 'String', '0');
set(handles.Pmax, 'String', '0');
set(handles.r, 'String', '0');
set(handles.p, 'String', '0');
set(handles.v, 'String', '0');
hax = handles.plot1
cla(hax)


% --- Executes on button press in closebtn.
function closebtn_Callback(hObject, eventdata, handles)
% hObject    handle to closebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes on button press in credit.
function credit_Callback(hObject, eventdata, handles)
% hObject    handle to credit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
readme
