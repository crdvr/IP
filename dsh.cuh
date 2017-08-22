
#define AR3 printf("(e:%d,d:%d)",e,d);a[i*w1+j]+=u*v*b[(d)*w+e];

#define REP3(a,b,c,d,e,f,h,i,g) for(int a=h*i;a<OVU(h,i,c);a++){if(a*b/c==(a+1)*b/c){e=(a*b/c);f=((float)b/c);g;}else{if(a*b%c!=0){\
	e=(a*b/c);f=a*b/c+1-(float)a*b/c;g;}
else{ e=(a*b/c);f=1;g; }for(int d=a*b/c+1;d<(a+1)*b/c;d++){
	\
		e=d;f=1;g;
}if((a+1)*b%c!=0){ e=(a+1)*b/c;f=(float)(a+1)*b/c-(a+1)*b/c;g; }}}

#define LOAD printf("(l:%d,k:%d)\n",l,k);rdrh2(b,s,(l*X*w/w1),(OVU(l,X,w1)*w%w1!=0?OVU(l,X,w1)*w/w1+1:OVU(l,X,w1)*w/w1),(k*Y*h/h1),(OVU(k,Y,h1)*h%h1!=0?OVU(k,Y,h1)*h/h1+1:OVU(k,Y,h1)*h/h1),w,h);printf("suc\n");//for(int ind=0;ind<w*h;ind++){b[ind]=1;}
//
#define FT printf("\n");//printf("%f %f %f %f",a[0],a[1],a[2],a[3]);
void dsf2d(float *a,float *b,int w,int h,int w1,int h1,char *s){
	for(int i=0;i<w1*h1;i++)a[i]=0;
	int X=2,Y=2,k,l;

	int d,e;
	float u,v;
	REPREM(k,h1,Y,REPREM(l,w1,X,LOAD REP3(i,h,h1,p,d,u,k,Y,REP3(j,w,w1,q,e,v,l,X,AR2)) FT));


	for(int i=0;i<w1*h1;i++)a[i]/=(float)w/w1*h/h1;

}



void main(int argc,char *argv[]){
	int w,h,n0,n1,w1,h1;
	float *arr,*b,*c;
	printf("w:");scanf("%d",&w);printf("h:");scanf("%d",&h);

	//printf("n0:");scanf("%d",&n0);printf("n1:");scanf("%d",&n1);
	printf("w1:");scanf("%d",&w1);printf("h1:");scanf("%d",&h1);
	MAL(arr,float,w*h);
	MAL(b,float,w1*h1);
	rdr(&arr,argv[1],2,w,h,0,0);
	dsf2d(b,arr,w,h,w1,h1,argv[1]);
	char s[256];
	sprintf(s,"%s-ds-%d-%d",argv[1],w1,h1);
	wtrdh(b,s,w1*h1);
	int i;scanf("%d",&i);
}