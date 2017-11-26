clear 
load('inp.mat')
load('theta1.mat');
load('theta2.mat');

decimal_array = fixed_point( X(18, :), 8, 4 )
csvwrite('matlab_file_inputs.csv', decimal_array)

decimal_array = fixed_point( Theta1, 8, 4 )
csvwrite('matlab_file_theta1.csv', decimal_array)

decimal_array = fixed_point( Theta2, 8, 4 )
csvwrite('matlab_file_theta2.csv', decimal_array)