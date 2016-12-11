function [x,it,mu] = PCG(A,b,x,M)
    xOpt=A\b;
    mu=[];
    r=b-A*x;
    z=M\r;
    p=z;
    tol=1e-9;
    it=1;
    maxIt=length(b);
    while it<maxIt
        Ap=A*p;
        alpha=(r'*z)/(p'*Ap);
        con1=norm(x-xOpt);
        x=x+alpha*p;
        rNew=r-alpha*Ap;
        if sqrt(rNew'*rNew)<tol
            break;
        end
        zNew=M\rNew;
        beta=(zNew'*rNew)/(z'*r);
        con2=norm(x-xOpt);
        mu(it,1)=con2/con1;
        pNew=zNew+beta*p;        
        p=pNew;
        r=rNew;
        z=zNew;
        it=it+1;
    end
end