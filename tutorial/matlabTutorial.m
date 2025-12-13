% Tutorial for Matlab

%% GUI
% to clear the command window
clc

% workspace stores all the variables and their values

% we can suppress the output using the semicolon ;
4 + 7;

%% Variables
x = 9;
y = 6 + x

% Change format
format long
help format % to get the help about a particular function

% remove variables from workspace
clear all % removes all variables in the workspace
clear x % removes only the variable x
clear x* % removes all the variables that start with x

% call variables in the workspace
who % lists all the variables
whos % lists the variables and details about them

x = 1+3; y = 5+6; z = x+y; % executing multiple commands

pi % gives the value of pi

%% relational operators
4 > 5 % gives a logical answer 0 or 1

%% built-in functions
sin(5); sind(30) % etc, there are a lot of built-in functions

%% vectors and matrices
b = [1 2 3]; % a row vector
c = b' % gives a column vector
A = [1 2 3; 4 5 6; 7 8 9] % a matrix

%% indexing : counting is from 1 and not from 0
v = A(:,2) % gives all rows and 2nd column of the matrix A
w = A(1:3) % gives the (1,3) element in the matrix
A(end, :) = 0 % assigns 0 to the last row of matrix
A1 = [1:5, 6:10, 11:15, 16:20] % defining a matrix with 4 columns and 5 rows
B1 = ones(size(A, 1), 1) % gives a matrix with 1 column and the number of rows as in the column 1 of matrix A

%% special matrices
zeros(5) % gives a matrix of 0 of size 5x5
zeros(1, 5) % gives a row vector of 5 columns
ones(5) % gives a 5x5 matrix of 1
eye(3) % gives a 3x3 identity matrix

%% other keywords
length(A) % gives the length of each row vector in matrix A
size(A) % gives the size of the matrix A, basically the number of rows and columns
numel(A) % gives the number of elements in matrix A
trace(A) % gives the trace of A

%% matrix commands
eig(A) % gives the eigenvalues of matrix A
inv(A) % gives the inverse of matrix A
det(A) % gives the determinant of A

%% matrix operations
A = rand(5); B = rand(5);
A + B % element wise sum/subtraction of the matrices
A>B % elementwise evaluating which elements of A are bigger than corresponding elements of B
A*B % gives the standard multiplication of A and B
A .* B % gives the elementwise multiplication of A and B
A^2 % squares matrix A
A.^2 % gives the elementwise square of matrix A

%% solve a system of linear equations
A = [1,2,3; 4,5,6; 7,8,9]
b = [1 1 1]'
x = A\b

%% .m scripts
% these are matlab files containing the entire codebase
%%main heading
% subheading
% the three Cs
clear all
close all
clc

%% loops
counter = 0;
for i = 1:5;
    counter = counter + 1;
    disp(counter)
end

while counter > 0;
    counter = counter - 1;
    disp(counter)
end

%% plotting
x = 0:0.1:5; % define values from 0 to 5 with increments of 0.1
y = x.^2;
plot(x, y, 'r+')
title('My First Plot')
xlabel('x-values')
ylabel('y-values')
grid on
hold
y2 = x.^3
y3 = x.^4
plot(x,y2,'g*')
plot(x, y3)
hold off
legend('Plot 1', 'Plot 2', 'Plot 3')

%% subplotting
subplot(311)
plot(x, y)
subplot(312)
plot(x, y2)
subplot(313)
plot(x, y3)

% H1 comment -> functions
% call function help by using "help function_name"
% -> common errors
% space in variable name
% function name and script name same
% too many or too few arguments passed
function a = triangle_area(w, h)
    a = 0.5*w*h;
end

%% debugging
% dubugging process follows 6 steps
% 1. prepare for debugging
% 2. set break points
% 3. run a m file with one or multiple break points
% 4. step through the m file  and examine the values
% 5. see if there are any problems, identify them
% 6. correct the problems and end debugging

