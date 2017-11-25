## Inputs 
inp_file = open("matlab_file_inputs.csv", "r"); 
fetched_str = inp_file.read(); 
inp_str = ""; 
inp_str = inp_str + '00000001'
for i in range(0, len(fetched_str)):
    if(fetched_str[i] != ','):
        inp_str = inp_str + fetched_str[i]; 
fh = open("result_inputs.txt","w")

out_str = ''; 
for i in range(0,400):
    for j in range(0, 8):
        out_str = out_str + inp_str[(i*8)+j];
    out_str = out_str + '\n';

fh.write(out_str);  
fh.close(); 

## Theta 1
inp_file1 = open("matlab_file_theta1.csv", "r"); 
fetched_str1 = inp_file1.read(); 
inp_str = ""; 
out_str = "";
for i in range(0, len(fetched_str1)):
    if((fetched_str1[i] != ',') and (fetched_str1[i] != '\n')):
        inp_str = inp_str + fetched_str1[i]; 
fh = open("result_theta1.txt","w")

out_str = ''; 
for z in range(0, 25):
    for i in range(0,401):
        for j in range(0, 8):
            out_str = out_str + inp_str[(z*401*8) +(i)+j*401]; 
        out_str = out_str + '\n';

fh.write(out_str);  
fh.close(); 

## Theta 2
inp_file2 = open("matlab_file_theta2.csv", "r"); 
fetched_str2 = inp_file2.read(); 
inp_str = ""; 
out_str = ""; 
for i in range(0, len(fetched_str2)):
    if((fetched_str2[i] != ',') and (fetched_str2[i] != '\n')):
        inp_str = inp_str + fetched_str2[i]; 
fh = open("result_theta2.txt","w")

out_str = ''; 
for z in range(0, 10):
    out_str = out_str + '[';
    for i in range(0,26):
        for j in range(0, 8):
            out_str = out_str + inp_str[(z*26*8) +(i)+j*26];
        if(i != 25):    
            out_str = out_str + ', ';
    out_str = out_str + ']';
    if(z != 9):
        out_str = out_str + ',' + '\n'; 

fh.write(out_str);  
fh.close(); 