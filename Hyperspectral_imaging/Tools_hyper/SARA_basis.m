function [Psi, Psit] = SARA_basis(im, nlevel)



[C1,S1]=wavedec2(im,nlevel,'db1'); 
ncoef1=length(C1);
[C2,S2]=wavedec2(im,nlevel,'db2'); 
ncoef2=length(C2);
[C3,S3]=wavedec2(im,nlevel,'db3'); 
ncoef3=length(C3);
[C4,S4]=wavedec2(im,nlevel,'db4'); 
ncoef4=length(C4);
[C5,S5]=wavedec2(im,nlevel,'db5'); 
ncoef5=length(C5);
[C6,S6]=wavedec2(im,nlevel,'db6'); 
ncoef6=length(C6);
[C7,S7]=wavedec2(im,nlevel,'db7'); 
ncoef7=length(C7);
[C,S]=wavedec2(im,nlevel,'db8'); 
 ncoef=length(C);

% %Sparsity averaging operator
% 
 Psit = @(x) [wavedec2(x,nlevel,'db1')'; wavedec2(x,nlevel,'db2')';wavedec2(x,nlevel,'db3')';...
    wavedec2(x,nlevel,'db4')'; wavedec2(x,nlevel,'db5')'; wavedec2(x,nlevel,'db6')';...
    wavedec2(x,nlevel,'db7')';wavedec2(x,nlevel,'db8')']/sqrt(8); 

Psi = @(x) (waverec2(x(1:ncoef1),S1,'db1')+waverec2(x(ncoef1+1:ncoef1+ncoef2),S2,'db2')+...
    waverec2(x(ncoef1+ncoef2+1:ncoef1+ncoef2+ncoef3),S3,'db3')+...
    waverec2(x(ncoef1+ncoef2+ncoef3+1:ncoef1+ncoef2+ncoef3+ncoef4),S4,'db4')+...
    waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5),S5,'db5')+...
    waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6),S6,'db6')+...
    waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7),S7,'db7')+...
    waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef),S,'db8'))/sqrt(8);


end