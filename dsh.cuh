void dsf(float *a,float *b,int w,int h,int n0,int n1){
	for(int i=0;i<h/n1;i++){
		for(int j=0;j<w/n0;j++){
			float v=0;
			for(int k=0;k<n1;k++){
				for(int l=0;l<n0;l++){
					v+=b[((n1*i+k)<h?(n1*i+k):h-1)*w+(n0*j+l<w?n0*j+l:w-1)];

				}
			}
			a[i*(w/n0)+j]=v/n1/n0;
		}
	}
}

void wtrdh(float *a,char *fn,int v){//write data in device
	int i;
	FILE *fp;
	char name[250];
	float *b;
	//MAL(b,float,v);
	//CUCP(b,a,float,v,D2H);
	myf(&fp,fn,"wb");
	fwrite(a,4,v,fp);
	fclose(fp);
	//free(b);
#ifdef PRT
	printf("writing %s finished\n",fn);
#else

#endif
}

void main(int argc,char *argv[]){
	int w,h,n0,n1;
	float *arr,*b;
	printf("w:");scanf("%d",&w);printf("h:");scanf("%d",&h);

	printf("n0:");scanf("%d",&n0);printf("h:");scanf("%d",&n1);
	MAL(arr,float,w*h);
	MAL(b,float,w/n0*(h/n1));
	rdr(&arr,argv[1],2,w,h,0,0);
	dsf(b,arr,w,h,n0,n1);
	char s[256];
	sprintf(s,"%s-ds%d-%d",argv[1],n0,n1);
	wtrdh(b,s,w/n0*(h/n1));
}