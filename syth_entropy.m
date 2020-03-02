
mm = {'m1_110322.csv', 'm1_110324.csv','m1_110327.csv', 'm1_110329.csv','m1_110330.csv','m1_110403.csv'};
acc=[];md = {};
for m = 1:6
    
ca2=[];
data =  csvread(mm{m});
for i = 1:10
     
    m3 = []; 
    for j = 1:size(data,2)
        m1 = data(1:60*i* fix(length(data)/(60*i)) ,:);
        M=sum(reshape(m1(:,j),60*i,[])); 
        m3 = horzcat(m3,M'); 
    end 
    
    
alldist = m3;
alldist = alldist(:);
alldist = sort(alldist);
dd = length(alldist);

ab = [];h = 5;df = 5;

while dd>=2
    df =  mean(alldist(1:dd));
    ab = vertcat(ab,df);
    dd = numel(find(alldist<=df));
end

ca=[];
bound = sort(ab);
ent_ropy = entro(m3,size(m3,2),bound); 
ca2 = horzcat(ca2, mean(ent_ropy) );ca=[];

    
    ab=[];
    
    
end

   mm{m} = find(ca2==max(ca2));
   md{m} = ent_ropy;

end
   
 
 
 
                 

