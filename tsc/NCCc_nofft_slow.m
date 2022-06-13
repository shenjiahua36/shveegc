function cross_correlation_sequence = NCCc_nofft_slow(x,y)

n=length(x);
xc=zeros(2*n-1,1);

for i=1:2*n-1
     if(i>n)
         j1=1;
         k1=2*n-i;
         j2=i-n+1;
         k2=n;
     else
         j1=n-i+1;
         k1=n;
         j2=1;
         k2=i;
     end
     
     thesum = 0;
     
     innerproduct = conj(x(j1:k1)) .* y(j2:k2);
     
     for w=1:length(innerproduct)
         thesum = thesum + innerproduct(w);
     end
     
     xc(i)=thesum;
     
 end
 cross_correlation_sequence=flipud(xc)/(norm(x)*norm(y));