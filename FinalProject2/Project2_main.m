clc
clear all 
%% Preprocessing
% Loading A, b, c ...
fun2AData = fopen('fun2_A.txt','r');
A = fscanf(fun2AData,'%e ',[500,100]);
fclose(fun2AData);

fun2BData=importdata('fun2_B.txt');
b=fun2BData(:,:)';

fun2CData=importdata('fun2_C.txt');
c=fun2CData(:,:)';
% Finish loading

% Initial Values
% x for func2
x = zeros(100,1)-0.49;
% x = A\(b-1);
% y for func1
y = randi(100,100,1);
% z for func3
z = [-20;20];
%% Using functions only
% Gradient Descent
% [xstar, f_xstar, err] = grad_descent(@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), x ,1000);
% [xstar, f_xstar, err] = grad_descent(@function1, @gradf1, x+100,1000);
% [xstar, f_xstar, err] = grad_descent(@function3, @gradf3, z,1000);


% Newton
% [xstar2, f_xstar2, err2] = Newton(@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), @(z) hessf2(z,A,b,c), x ,100);
% [xstar2, f_xstar2, err2] = Newton(@function1, @gradf1, @hessf1, y,100);
% [xstar2, f_xstar2, err2] = Newton(@function3, @gradf3, @hessf3, z ,100);

% Quasi
% [xstar3, f_xstar3, err3] = Quasi(@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), x ,100);
% [xstar3, f_xstar3, err3] = Quasi(@function1, @gradf1, y ,100);
% [xstar3, f_xstar3, err3] = Quasi(@function3, @gradf3, z ,100);

%% Using optimization_Demo
% GRAD
figure
% [xstar, f_xstar, err] = optimization_Demo('proj3','Gradient',@function3, @gradf3, @hessf3, z,150);
% [xstar, f_xstar, err] = optimization_Demo('quadratic','Gradient',@function1, @gradf1, @hessf1, y,1000);
[xstar, f_xstar, err] = optimization_Demo('f2','Gradient',@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), @(z) hessf2(z,A,b,c), x,1500);

%NEWTON
figure
% [xstar2, f_xstar2, err2] = optimization_Demo('proj3','Newton',@function3, @gradf3, @hessf3, z,150);
% [xstar2, f_xstar2, err2] = optimization_Demo('quadratic','Newton',@function1, @gradf1, @hessf1, y,100);
% [xstar2, f_xstar2, err2] = optimization_Demo('f2','Newton',@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), @(z) hessf2(z,A,b,c), x ,1500);

%QUASI
figure
% [xstar3, f_xstar3, err3] = optimization_Demo('proj3','Quasi',@function3, @gradf3, @hessf3, z,150);
% [xstar3, f_xstar3, err3] = optimization_Demo('quadratic','Quasi',@function1, @gradf1, @hessf1, y,100);
% [xstar3, f_xstar3, err3] = optimization_Demo('f2','Quasi',@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), @(z) hessf2(z,A,b,c), x ,1500);

%LGFBS
figure
% [xstar4, f_xstar4, err4] = optimization_Demo('proj3','LGFBS',@function3, @gradf3, @hessf3, z,150);
% [xstar4, f_xstar4, err4] = optimization_Demo('quadratic','LGFBS',@function1, @gradf1, @hessf1, y,100);
% [xstar4, f_xstar4, err4] = optimization_Demo('f2','LGFBS',@(x) function2(x,A,b,c), @(y) gradf2(y,A,b,c), @(z) hessf2(z,A,b,c), x ,1500);
