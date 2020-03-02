function [entropy] = socnw_entropy(c2,lsg,bound) 

%lsg represents the number of agents whose entropy we want to commpute

%bound is a vector that represents the upper and lower limits of each bin

%c2 is the timeseries of the data of interest arranged columnwise.


 

m5 = []; 
global m6
m6 = []; 


for i = 1:lsg 
    

    m4 = c2(:,i); 

    for j = 1:length(m4)  

       if (m4(j)>=bound(1) && m4(j)<bound(2))

          m4(j)='A'; 

       elseif (m4(j)>=bound(2) && m4(j)<bound(3))

          m4(j)= 'B'; 

       elseif (m4(j)>=bound(3) && m4(j)<bound(4))

          m4(j)= 'C'; 

       elseif (m4(j)>=bound(4) && m4(j)<bound(5))

          m4(j) = 'D'; 

       elseif (m4(j)>=bound(5) && m4(j)<bound(6)) 

          m4(j)= 'E'; 

       elseif (m4(j)>=bound(6) && m4(j)<bound(7))

           m4(j)= 'F'; 
           
       elseif (m4(j)>=bound(7) && m4(j)<bound(8))

           m4(j)= 'G'; 
           
       elseif (m4(j)>=bound(8) && m4(j)<bound(9))

           m4(j)= 'H'; 
       elseif (m4(j)>=bound(9) && m4(j)<bound(10))

           m4(j)= 'J'; 

       else 

           m4(j) = 'K'; 

       end                                  

    end 

       m5 = vertcat(m5,m4); 

       m6 = horzcat(m6,m5); 

       m5 = []; 

end 

m6 = char(m6); 



%Computes the distance based entropy 

 

entropy = []; 

m8 = []; 

 

for ll = 1:lsg

   

   vv = (m6(:,ll)); 

   vv1 = unique(vv); 

 

   m8 = histc(vv,vv1); 

   kj1 = m8/length(m6(:,ll)); 

   kj2 = -sum(kj1.*log2(kj1)); 

   entropy = (vertcat(entropy, kj2)); 


end 



end 

