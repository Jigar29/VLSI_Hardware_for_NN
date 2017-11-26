function [ float_array ] = fixed_point( data_array, no_total_bits, no_int_bits )
    NO_OF_BITS_IN_REP = no_total_bits; 
    NO_OF_BITS_INT = no_int_bits;
    INT_START_BIT = 2; 
    INT_END_BIT = NO_OF_BITS_INT + 1; 
    FLOAT_START_BIT = INT_END_BIT +1; 

    [row_coeff, col_coeff] = size(data_array);
    float_array = zeros(row_coeff, col_coeff, NO_OF_BITS_IN_REP); 
    decimal_array = zeros(row_coeff, col_coeff); 

    for ro= 1:row_coeff
        for co= 1:col_coeff
            number = data_array(ro,co); 
            isneg = 0; 
            array= zeros(1,NO_OF_BITS_IN_REP+1);

            %Assigning Sign Bit 
            if(number <0)
                number = -number; 
                isneg = 1; 
            else
                array(1,1) = 0; 
            end

            %Checking the number Exeed
            if(number >= power(2, NO_OF_BITS_INT))
                disp('Number Exeeds'); 
                return;
            end

            %Extracting integer part 
            temp = number; 
            for i = INT_END_BIT:-1:INT_START_BIT
                array(1,i) = mod(floor(temp), 2);
                temp = temp /2;  
            end

            %Extracting Floting part 
            temp_num = number - floor(number); 

            for i= FLOAT_START_BIT: NO_OF_BITS_IN_REP
                temp_num = temp_num * 2; 
                array(1,i) = floor(temp_num); 
                if(temp_num >=1)
                    temp_num = temp_num -1; 
                end
            end

            % Rounding and saturation 
            c = array(1,NO_OF_BITS_IN_REP+1); 
            for i=NO_OF_BITS_IN_REP:-1:INT_START_BIT
               if(c)
                  [sum, carry] = adder(array(1,i) , 1);
                  array(1,i) = sum; 
                  c = carry; 
               end
               if((i == INT_START_BIT) && (c))
                   array(1,INT_START_BIT:NO_OF_BITS_IN_REP) = ones(1,NO_OF_BITS_IN_REP -1);  % Sign bit stays the same and the rest of the bits are padded with all ones 
               end
            end

            decimal_num = 0; 
            for i=INT_START_BIT:NO_OF_BITS_IN_REP
                decimal_num = decimal_num + array(1,i)*power(2,INT_END_BIT-i); 
            end
            if(isneg)
                decimal_num = -decimal_num; 
            end

            % for i=2:
            flag = 0; 
            % 2's Xomplent
            if(isneg)
              for j=NO_OF_BITS_IN_REP:-1:1
                  if(flag == 0)
                      if(array(1,j) == 1) 
                        flag =1 ; 
                      end 
                  else 
                      array(1,j) = ~array(1,j); 
                  end
              end
            end
            for p=NO_OF_BITS_IN_REP:-1:1
                float_array(ro,co,p) = array(1,p);
            end
            decimal_array(ro, co) = decimal_num;
        end
    end

end

