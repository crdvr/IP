

void read_host_2d(float *a,char *fn,int x0,int x1,int y0,int y1,int X,int Y){
	FILE *in;
	int i,j,x=x1-x0,y=y1-y0,XY=X*Y;
	float *b;
	myf(&in,fn,"rb");
	_fseeki64(in,(y0*X+x0)*sizeof(float),SEEK_CUR);

	REP(i,y){
		fread(a+i*x,sizeof(float),x,in);
		_fseeki64(in,(X-x)*sizeof(float),SEEK_CUR);
	}
	fclose(in);
#ifdef PRT
	printf("reading %s completed\n",fn);
#endif
}

#define REP(i,n) for(i=0;i<n;i++)
#define REPREM(a,b,c,d) REP(a,b/c){d}if(b%c!=0){d}
#define OVR(a,b,c) ((a+1)*b>c?c%b:b)
#define OVU(a,b,c) ((a+1)*b>c?c:(a+1)*b)
#define AR2 printf("(e:%d,d:%d)",e,d);a[i*w1+j]+=u*v*b[(d-k*Y*h/h1)*((OVU(l,X,w1)*w%w1!=0?OVU(l,X,w1)*w/w1+1:OVU(l,X,w1)*w/w1)-l*X*w/w1)+e-l*X*w/w1];

#define REP3(a,b,c,d,e,f,h,i,g) for(int a=h*i;a<OVU(h,i,c);a++){if(a*b/c==(a+1)*b/c){e=(a*b/c);f=((float)b/c);g;}else{if(a*b%c!=0){\
	e=(a*b/c);f=a*b/c+1-(float)a*b/c;g;}else{ e=(a*b/c);f=1;g; }for(int d=a*b/c+1;d<(a+1)*b/c;d++){\
		e=d;f=1;g;}if((a+1)*b%c!=0){ e=(a+1)*b/c;f=(float)(a+1)*b/c-(a+1)*b/c;g; }}}

#define LOAD printf("(l:%d,k:%d)\n",l,k);read_host_2d(b,s,(l*X*w/w1),(OVU(l,X,w1)*w%w1!=0?OVU(l,X,w1)*w/w1+1:OVU(l,X,w1)*w/w1),(k*Y*h/h1),(OVU(k,Y,h1)*h%h1!=0?OVU(k,Y,h1)*h/h1+1:OVU(k,Y,h1)*h/h1),w,h);
#define FT printf("\n");




void dsf2d(float *a,float *b,int w,int h,int w1,int h1,int X,int Y,char *s){
	for(int i=0;i<w1*h1;i++)a[i]=0;
	int k,l;
	int d,e;
	float u,v;
	REPREM(k,h1,Y,REPREM(l,w1,X,LOAD REP3(i,h,h1,p,d,u,k,Y,REP3(j,w,w1,q,e,v,l,X,AR2)) FT));

	for(int i=0;i<w1*h1;i++)a[i]/=(float)w/w1*h/h1;
}



void main(int argc,char *argv[]){
	int w,h,n0,n1,w1,h1;
	float *arr,*b,*c;
	printf("w:");scanf("%d",&w);printf("h:");scanf("%d",&h);

	printf("w1:");scanf("%d",&w1);printf("h1:");scanf("%d",&h1);
	printf("X:");scanf("%d",&X);printf("Y:");scanf("%d",&Y);
	MAL(arr,float,w*h);
	MAL(b,float,w1*h1);
	rdr(&arr,argv[1],2,w,h,0,0);
	dsf2d(b,arr,w,h,w1,h1,X,Y,argv[1]);
	char s[256];
	sprintf(s,"%s-ds-%d-%d",argv[1],w1,h1);
	wtrdh(b,s,w1*h1);
	int i;scanf("%d",&i);
}