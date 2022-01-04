function M=julia(zmin,zmax,hpx,niter,c,
                 f=@(z,c) z.^2.+c,
                 r=2)
  vpx=round(hpx*abs(imag(zmax-zmin)/real(zmax-zmin)));
  [zRe,zIm]=meshgrid(linspace(real(zmin),real(zmax),hpx),
                     linspace(imag(zmin),imag(zmax),vpx));
  z=zRe+i*zIm;
  cc=zeros(vpx,hpx)+c;
  M=mjcore(z,cc,niter,f,r);
endfunction 
