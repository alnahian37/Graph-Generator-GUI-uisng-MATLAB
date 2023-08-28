
function varargout = nahian_grapher_update(varargin)
% NAHIAN_GRAPHER_UPDATE M-file for nahian_grapher_update.fig
%      NAHIAN_GRAPHER_UPDATE, by itself, creates a new NAHIAN_GRAPHER_UPDATE or raises the existing
%      singleton*.
%
%      H = NAHIAN_GRAPHER_UPDATE returns the handle to a new NAHIAN_GRAPHER_UPDATE or the handle to
%      the existing singleton*.
%
%      NAHIAN_GRAPHER_UPDATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NAHIAN_GRAPHER_UPDATE.M with the given input arguments.
%
%      NAHIAN_GRAPHER_UPDATE('Property','Value',...) creates a new NAHIAN_GRAPHER_UPDATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nahian_grapher_update_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nahian_grapher_update_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nahian_grapher_update

% Last Modified by GUIDE v2.5 03-Nov-2014 22:18:22

% Begin initialization code - DO NOT EDIT

 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nahian_grapher_update_OpeningFcn, ...
                   'gui_OutputFcn',  @nahian_grapher_update_OutputFcn, ...
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


% --- Executes just before nahian_grapher_update is made visible.
function nahian_grapher_update_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




function varargout = nahian_grapher_update_OutputFcn(hObject, eventdata, handles) 


function equationpanel_Callback(hObject, eventdata, handles)



function equationpanel_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowerx_Callback(hObject, eventdata, handles)
function lowerx_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function upperx_Callback(hObject, eventdata, handles)

function upperx_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number_Callback(hObject, eventdata, handles)


function number_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

        xmin=str2double(get(handles.lowerx,'string'));
        xmax=str2double(get(handles.upperx,'string'));
        numpoints=str2double(get(handles.number,'string'));
        scale=(xmax-xmin)/numpoints;

       
        x=xmin:scale:xmax;
        eqnstr=get(handles.equationpanel,'string');
        
        y=eval(eqnstr);
        axes(handles.axes1)
     
      plot(x,y,'b')
      
       grid on
        set(handles.axes1,'Color',[.9,.9,.6])
        v=axis;
        ymin=v(3);
        ymax=v(4);
        v(3)=ymin-0.2*(ymax-ymin);
        v(4)=ymax+0.2*(ymax-ymin);
        axis(v)
       


% --- Executes on button press in rootpush.
function rootpush_Callback(hObject, eventdata, handles)

 abc=ginput(1);
        eqnstr=get(handles.equationpanel,'string');
        eqn=fcnchk(eqnstr);
        z=fzero(eqn,abc(1));
        line(z,0,'linestyle','none','marker','*',...
            'markersize',15,'color','blue')   
        rootText=sprintf('%.4f,0',z);
        text(z,0,rootText,...
            'horiz','center',...
            'vert','top')


% --- Executes on button press in differentiation.
function differentiation_Callback(hObject, eventdata, handles)

 xmin=str2double(get(handles.lowerx,'string'));
        xmax=str2double(get(handles.upperx,'string'));
        numpoints=str2double(get(handles.number,'string'));
        scale=(xmax-xmin)/numpoints;

        
        x=xmin:scale:xmax;
        eqnstr=get(handles.equationpanel,'string');
        
        f=inline(eqnstr);
        n=length(x);
        h=1/32;
        for i=1:n
            fderiv(i)=(f(x(i)+h)-f(x(i)-h))/(2*h);
        end
         axes(handles.axes1)
      plot(x,fderiv,'r')
     
       grid on
        set(handles.axes1,'Color',[.9,.9,.6])
        grid on
        v=axis;
        ymin=v(3);
        ymax=v(4);
        v(3)=ymin-0.2*(ymax-ymin);
        v(4)=ymax+0.2*(ymax-ymin);
        axis(v)
       

% --- Executes on button press in intfunc.
function intfunc_Callback(hObject, eventdata, handles)


 xmin=str2double(get(handles.lowerx,'string'));
        xmax=str2double(get(handles.upperx,'string'));
        n=99;
h=(xmax-xmin)/n;
x(1)=xmin;
sum=0;
for i=1:n+1
    x(i+1)=x(i)+h;
end;
format long
eqnstr=get(handles.equationpanel,'string');
        
        f=inline(eqnstr);
        for i=1:3:n-2
    sum=sum+(f(x(i))+3*f(x(i+1))+3*f(x(i+2))+f(x(i+3)));
end
I=sum*3*h/8;
set(handles.intval,'string',I)


function intval_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function intval_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)

function x1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)

function x2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function x3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function x4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function x5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function y3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y4_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function y4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function y5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in curvefit.
function curvefit_Callback(hObject, eventdata, handles)
% hObject    handle to curvefit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x(1)=str2double(get(handles.x1,'string'));
x(2)=str2double(get(handles.x2,'string'));
x(3)=str2double(get(handles.x3,'string'));
x(4)=str2double(get(handles.x4,'string'));
x(5)=str2double(get(handles.x5,'string'));
x(6)=str2double(get(handles.x6,'string'));
x(7)=str2double(get(handles.x7,'string'));

y(1)=str2double(get(handles.y1,'string'));
y(2)=str2double(get(handles.y2,'string'));
y(3)=str2double(get(handles.y3,'string'));
y(4)=str2double(get(handles.y4,'string'));
y(5)=str2double(get(handles.y5,'string'));
y(6)=str2double(get(handles.y6,'string'));
y(7)=str2double(get(handles.y7,'string'));

sumx=0;
sumy=0;
sumxy=0;
sumx2y=0;
sumx3y=0;
 
sumx2=0;
sumx3=0;
sumx4=0;
sumx5=0;
sumx6=0;
 
for i=1:7
    sumx=sumx+x(i);
    sumy=sumy+y(i);
    
    sumx2=sumx2+x(i)^2;
    sumx3=sumx3+x(i)^3;
    sumx4=sumx4+x(i)^4;
    sumx5=sumx5+x(i)^5;
    sumx6=sumx6+x(i)^6;
   
    sumxy=sumxy+x(i)*y(i);
    sumx2y=sumx2y+y(i)*x(i)^2;
    sumx3y=sumx3y+y(i)*x(i)^3;
    
end

format long;
 
A=[7 sumx sumx2 sumx3;sumx sumx2 sumx3 sumx4;sumx2 sumx3 sumx4 sumx5;sumx3 sumx4 sumx5 sumx6];
B=[sumy sumxy sumx2y sumx3y]';
a=inv(A)*B;
 ym=a(1)+a(2).*x+a(3).*x.*x+a(4).*x.*x.*x;
axes(handles.axes1);
plot(x,y,'o',x,ym,'m');
 set(handles.axes1,'Color',[.9,.9,.6])
 grid on




function x6_Callback(hObject, eventdata, handles)

function x6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x7_Callback(hObject, eventdata, handles)

function x7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y6_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function y6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y7_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function y7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Interpolate.
function Interpolate_Callback(hObject, eventdata, handles)
% hObject    handle to Interpolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x(1)=str2double(get(handles.x1,'string'));
x(2)=str2double(get(handles.x2,'string'));
x(3)=str2double(get(handles.x3,'string'));
x(4)=str2double(get(handles.x4,'string'));
x(5)=str2double(get(handles.x5,'string'));
x(6)=str2double(get(handles.x6,'string'));
x(7)=str2double(get(handles.x7,'string'));

y(1)=str2double(get(handles.y1,'string'));
y(2)=str2double(get(handles.y2,'string'));
y(3)=str2double(get(handles.y3,'string'));
y(4)=str2double(get(handles.y4,'string'));
y(5)=str2double(get(handles.y5,'string'));
y(6)=str2double(get(handles.y6,'string'));
y(7)=str2double(get(handles.y7,'string'));

xi=x(1):0.01:x(7);
for k=1:length(xi)
sum=0;
for i= 1:length(x)
t=1;
for j=1:length(x)
if i~=j
t=t*(xi(k)-x(j))/(x(i)-x(j));
end
end
t=t*y(i);
sum=sum+t;
end

yi(k)=sum;
end

plot(x,y,'o',xi,yi,'r');
 set(handles.axes1,'Color',[.9,.9,.6])
 grid on
