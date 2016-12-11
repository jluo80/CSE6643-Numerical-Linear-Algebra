function [xNew,it,mu] = CG(A,b,x)
    xOpt=A\b;
    mu=[];
    r=b-A*x;
    p=r;
    tol=1e-9;
    it=1;
    maxIt=length(b);
    while it<maxIt
        Ap=A*p;
        alpha=(r'*r)/(p'*Ap);
        con1=norm(x-xOpt);
        xNew=x+alpha*p;
        rNew=r-alpha*Ap;
        if sqrt(rNew'*rNew)<tol
              break;
        end
        beta=(rNew'*rNew)/(r'*r);
        con2=norm(xNew-xOpt);
        mu(it,1)=con2/con1;
        pNew=rNew+beta*p;
        p=pNew;
        r=rNew;
        x=xNew;
        it=it+1;
    end
end