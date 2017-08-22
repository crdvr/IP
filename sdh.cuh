void fo(FILE **f,char *s,char *c){
	int i;
	if((*f=fopen(s,c))==NULL){
		printf("opening %s failed\n",s);
		scanf("%d",&i);
		exit(-1);
	}
}

rd(float *a,char *s,int v,int sh){
	FILE *f;
	fo(&f,s,"rb");
	_fseeki64(in,sh*sizeof(float),SEEK_CUR);
	fread(a,sizeof(float),v,f);
	fclose(f);
}
wt(float *a,char *s,int v){
	FILE *f;
	fo(&f,s,"ab");
	fwrite(a,sizeof(float),v,f);
	fclose(f);
}

void sdf(float *b,float *a,int w,int h,int n,int m){
	for(int i=0;i<h;i++){
		for(int k=0;k<n;k++){
			for(int j=0;j<w;j++){
				for(int l=0;l<m;l++){
					b[(n*i+k)*m*w+m*j+l]=a[i*w+j];
				}
			}
		}
	}
}

#define OVR(a,b,c) ((a+1)*b>c?c%b:b)
#define OVU(a,b,c) ((a+1)*b>c?c:(a+1)*b)

void sd(char *s){
	printf("w ?");
	scanf("%d",&w);
	printf("h ?");
	scanf("%d",&h);
	printf("rows ?");
	scanf("%d",&rows);
	printf("m ?");
	scanf("%d",&m);
	printf("n ?");
	scanf("%d",&n);
	char s1[256];
	sprintf(s1,"%s-x%d-x%d",s,m,n);
	for(int i=0;i<h/rows;i++){
		rd(a,s,OVR(i,rows,h),i*rows);
		sdf(b,a,w,OVR(i,rows,h),n,m);
		wt(b,s1,n*m*w*OVR(i,rows,h));
	}
}




