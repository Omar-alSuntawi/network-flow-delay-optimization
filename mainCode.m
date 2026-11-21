%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linear and non-Linear Programming Course (MATH 404)
% Final Project, Fall 2019

% Supervised By: Prof. Ahmed abd alSamee

% Reem Hesham Farahat, 201700543
% Omar Muh Shams alDeen, 201600337
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NETWORK FLOW AND DELAY
%
% X(i,j): the flow from node i to node j
% X1 = X(1,2) , X2 = X(1,3) , X3 = X(2,3) , X4 = X(2,4) , X5 = X(3,4)
%
% X4 ***** X2 **** X1
%   *      *      *
%     *    *    *
%       *  *  *
%         X3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [1] Network flow problem

%%
% Solve Flow Problem Using linprog built-in function
f = [0 0 0 -1 -1];      % max f = X4 + X5;
A = [0 0 0 0 0;0 0 0 0 0;0 0 0 0 0];
Aeq = [0 -1 1 0 1;1 0 1 -1 0;1 1 0 -1 -1];
b = [0 0 0];
beq = [0 0 0];
lb = [0,0,0,0,0];
C1 = 10; C2 = 30; C3 = 10; C4 = 30; C5 = 10;
ub = [C1,C2,C3,C4,C5];
result = linprog(f,A,b,Aeq,beq,lb,ub)
f_opt = (result(4)+result(5))

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting f_opt vs X1 capacity from 0 to 20
% Net Network Flow Vs Road 1 Capacity
y = zeros(1,21);
ub = [C1,C2,C3,C4,C5];
for i=0:20
    ub(1) = i;
    result = linprog(f,A,b,Aeq,beq,lb,ub);
    f_opt = (result(4)+result(5));
    y(1,i+1) = f_opt;
end
plot1 = subplot(5,1,1);
t = 0:20;
plot(plot1,t,y);
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting f_opt vs X2 capacity from 20 to 40
% Net Network Flow Vs Road 2 Capacity
y = zeros(1,21);
ub = [C1,C2,C3,C4,C5];
for i=20:40
    ub(2) = i;
    result = linprog(f,A,b,Aeq,beq,lb,ub);
    f_opt = (result(4)+result(5));
    y(1,i-19) = f_opt;
end
plot2 = subplot(5,1,2);
t = 20:40;
plot(plot2,t,y); 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting f_opt vs X3 capacity from 0 to 20
% Net Network Flow Vs Road 3 Capacity
y = zeros(1,21);
ub = [C1,C2,C3,C4,C5];
for i=0:20
    ub(3) = i;
    result = linprog(f,A,b,Aeq,beq,lb,ub);
    f_opt = (result(4)+result(5));
    y(1,i+1) = f_opt;
end
plot3 = subplot(5,1,3);
t = 0:20;
plot(plot3,t,y); 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting f_opt vs X4 capacity from 20 to 40
% Net Network Flow Vs Road 4 Capacity
y = zeros(1,21);
ub = [C1,C2,C3,C4,C5];
for i=20:40
    ub(4) = i;
    result = linprog(f,A,b,Aeq,beq,lb,ub);
    f_opt = (result(4)+result(5));
    y(1,i-19) = f_opt;
end
plot4 = subplot(5,1,4);
t = 20:40;
plot(plot4,t,y);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting f_opt vs X5 capacity from 0 to 20
% Net Network Flow Vs Road 5 Capacity
y = zeros(1,21);
ub = [C1,C2,C3,C4,C5];
for i=0:20
    ub(5) = i;
    result = linprog(f,A,b,Aeq,beq,lb,ub);
    f_opt = (result(4)+result(5));
    y(1,i+1) = f_opt;
end
plot5 = subplot(5,1,5);
t = 0:20;
plot(plot5,t,y); 
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % [2] Network delay problem
% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % [2] Network delay problem
 c1=10;
 c2=30;
 c3=10;
 c4=30;
 c5=10;
 
% %t1 = @(X1) ((5+0.1*X1)/(1-X1)/c1);
% %t2 = @(X2) (X2/((1-X2)/c2));
% %t3 = @(X3) ((1+X3)/(1-X3)/c3);
% %t4 = @(X4) ((X4)/(1-X4)/c4);
% %t5 = @(X5) ((5+X5)/(1-X5)/c5);
% 

%%
%  F = 5;
%  func =  @(X) ((((5+0.1*X(1))/(1-X(1))/c1)*X(1))+ ((X(2)/((1-X(2))/c2))*X(2)) + (((1+X(3))/(1-X(3))/c3)*X(3)) + (((X(4))/(1-X(4))/c4)*X(4)) + (((5+X(5))/(1-X(5))/c5)*X(5)));
%  lb = [0,0,0,0,0];
%  ub = [10,30,10,30,10];
%  x0 = [5,15,5,15,5];
%  A = [];
%  b = [];
%  Aeq = [0 -1 1 0 1 
%         1 0 1 -1 0
%         0 0 0 1 1];
%  beq = [0 0 F];
%  x = fmincon(func,x0,A,b,Aeq,beq,lb,ub);
%  f_opt = func(x);
%  
%  
% %%
% % Plotting f_opt vs vechiles number
% y = zeros(1,5);
% for i=4:8
%     F = i
%     beq = [0 0 F];
%     x = fmincon(func,x0,A,b,Aeq,beq,lb,ub);
%     f_opt = func(x)
%     y(1,i-3) = f_opt;
% end
% t = 4:8;
% plot(t,y);
% %%