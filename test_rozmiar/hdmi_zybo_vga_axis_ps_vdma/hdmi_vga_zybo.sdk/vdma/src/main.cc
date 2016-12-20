/*
 * Empty C++ Application
 */

#include "xparameters.h"
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "sleep.h"
#include "xaxivdma.h"

//#include "image_processing_functions.h"
//#include "bgModelFloat.h"
//#include "bgModelFixed.h"

//#include "labellerOnePass.h"
//#include "objectAnalysis.h"

#include "xil_cache.h"
#include "xtime_l.h"

// VDMA (write) registers
#define S2MM_VDMACR 0x30
#define S2MM_VDMASR 0x34
#define S2MM_VSIZE 0xA0
#define S2MM_HSIZE 0xA4
#define S2MM_FRMDLY_STRIDE 0xA8
#define S2MM_START_ADDRESS 0xAC

#define PART_PTR_REG 0x28

#define MM2S_VDMACR 0x00
#define MM2S_VDMASR 0x04
#define MM2S_VSIZE 0x50
#define MM2S_HSIZE 0x54
#define MM2S_FRMDLY_STRIDE 0x58
#define MM2S_START_ADDRESS 0x5C

// Full (with blanking) input image sizes
#define HSIZE_FULL 1980
#define VSIZE_FULL 750

// Active (only video) image sizes
#define HSIZE_ACTIVE 1280
#define VSIZE_ACTIVE 720
#define XX HSIZE_ACTIVE
#define YY VSIZE_ACTIVE


// Buffer for input image
u8 hdmi_image_in[VSIZE_ACTIVE*HSIZE_ACTIVE*3] ={0};

// foreground segmentation result
//u8 imageYCbCr[VSIZE_ACTIVE*HSIZE_ACTIVE*3] ={0};
//u8 imageYCbCr_fixed[VSIZE_ACTIVE*HSIZE_ACTIVE*3] ={0};

//u8 fgMask[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};
//u8 fgMaskMedian[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};
//u8 moMask[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};

//u8 edgeFGmask[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};
//u8 edgeInput[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};
//u8 edgeBG[VSIZE_ACTIVE*HSIZE_ACTIVE] ={0};


//u32 hdmi_image_out[VSIZE_ACTIVE*HSIZE_ACTVIE];


// buffers for labelling
//unsigned int ymax[MAX_LABELS];
//unsigned int ymin[MAX_LABELS];
//unsigned int xmax[MAX_LABELS];
//unsigned int xmin[MAX_LABELS];

XAxiVdma AxiVdma;

int AxiVDMASelfTestExample(u16 DeviceId)
{
	XAxiVdma_Config *Config;
	int Status = XST_SUCCESS;

	Config = XAxiVdma_LookupConfig(DeviceId);
	if (!Config) {
			return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiVdma_CfgInitialize(&AxiVdma, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XAxiVdma_Selftest(&AxiVdma);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return Status;
}


int main()
{
	init_platform();


	xil_printf("VDMA image transfer \n\r");

	// Initialize VTC
	Xil_Out32(XPAR_V_TC_0_BASEADDR,0xC);

	// Czekanie na video
	int hsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0030);
	int vsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0034);

	xil_printf("Waiting for image stream to synchornize \n\r");
	while ( hsize_input <=1 && vsize_input <=1) {
		hsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0030);
		vsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0034);
	}
	xil_printf("Stream synchornized \n\r");



	//u8 *hdmi_image_in = new u8[HSIZE_ACTIVE*VSIZE_ACTIVE*4];


	// VDMA Self test
	int  Status = AxiVDMASelfTestExample(XPAR_AXI_VDMA_0_DEVICE_ID);
    if (Status != XST_SUCCESS)
    	xil_printf("AxiVDMASelfTestExample: Failed\r\n");
	else
		xil_printf("AxiVDMASelfTestExample: Passed\r\n");


	//u32* mem_address = &hdmi_image;
	//xil_printf("Image address %X \r\n",(u32)(hdmi_image_in));
	//xil_printf("Image address %X \r\n",(&hdmi_image_in));


	// Initialize VDMA Write
	Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_VDMACR,0x8B); // run  8B (circular mode) 89 - park mode
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_START_ADDRESS, (u32)(&hdmi_image_in));
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_FRMDLY_STRIDE,HSIZE_ACTIVE*3);   // 0
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_HSIZE,HSIZE_ACTIVE*3);          // 4
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_VSIZE,VSIZE_ACTIVE);            //

    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + MM2S_VDMACR,0x8B); // run  8B
    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + MM2S_START_ADDRESS, (u32)(&hdmi_image_in));
    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + MM2S_FRMDLY_STRIDE,HSIZE_ACTIVE*3);   // 0
    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + MM2S_HSIZE,HSIZE_ACTIVE*3);          // 4
    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + MM2S_VSIZE,VSIZE_ACTIVE);            //


    // Test rysowanie bbox'ow
    //Xil_Out32(XPAR_BBOX_REGISTER_0_0 + 0,0x00FF0000);
    //Xil_Out32(XPAR_BBOX_REGISTER_0_0 + 4,0x00FF0000);




    // Clear memory
    for (int j=0; j < VSIZE_ACTIVE*HSIZE_ACTIVE*3; j++) {  //
    	hdmi_image_in[j] = 0;
    	//xil_printf("%d ",hdmi_image[j]);
    }



	//int hsize_input, vsize_input;  					// rozdzielczosc - cala ramka - wejscie
	int hsize_active_input, vsize_active_input;  	// rozdzielczosc - tylko aktywyny obszar - wejscie

	int hsize_output, vsize_output;  				// rozdzielczosc - cala ramka - wyjscie
	int hsize_active_output, vsize_active_output;  	// rozdzielczosc - tylko aktywyny obszar - wyjscie

	int active_input;
	int active_output;


	u32 vdma_write_SR,vdma_read_SR;



	int step = 0;
	int vdma_park = 0;
	int vdma_wrfrmstore =0;
	int vdma_wrfrmptrref = 0;

	//int bbox_xs, bbox_xe, bbox_ys, bbox_ye;
	//int m00;

	//bbox obToRemove;
	//obToRemove.xmax = 0;
	//obToRemove.xmin = 0;
	//obToRemove.ymax = 0;
	//obToRemove.ymin = 0;

	unsigned int noObjects;                                                         // number of objects detected on a sigle frame

	// Structure for object parameters
	//object objects[MAX_LABELS];
	//objectParameters obParameters[MAX_LABELS];


	// BG model object
	//bgModelFloat bgmf(HSIZE_ACTIVE, VSIZE_ACTIVE);
    //bgModelFixed bgmf(HSIZE_ACTIVE, VSIZE_ACTIVE);

	// Labeller object
	//labellerOnePass labeller(HSIZE_ACTIVE, VSIZE_ACTIVE);

    // Object analysis object
    //objectAnalysis oA;



    XTime tStart, tEnd;

    XTime_GetTime(&tStart);
	while(1) {
		Xil_DCacheFlush();
		sleep(1);   // delay

		hsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0030);
		vsize_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0034);
		hsize_output = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0070);
		hsize_output = hsize_output & 0x00000FFF;
		vsize_output = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0074);
		vsize_output = vsize_output & 0x00000FFF;

		active_input = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0020);
		active_output = Xil_In32(XPAR_V_TC_0_BASEADDR+0x0020);
		vsize_active_input = (active_input & 0xFFFF0000) >> 16;
		hsize_active_input = active_input & 0x0000FFFF;

		vsize_active_output = (active_output & 0xFFFF0000) >> 16;
		hsize_active_output = active_output & 0x0000FFFF;

		// VDMA Control register
		//vdma_write_SR = Xil_In32(XPAR_AXI_VDMA_0_BASEADDR+S2MM_VDMASR);
		//vdma_read_SR  = Xil_In32(XPAR_AXI_VDMA_0_BASEADDR+MM2S_VDMASR);
		//vdma_park = Xil_In32(XPAR_AXI_VDMA_0_BASEADDR + PART_PTR_REG);

		// Wyciagniecie
		//vdma_wrfrmstore = vdma_park  & 0x1F000000;
		//vdma_wrfrmptrref = vdma_park & 0x00001F00;

		// Display
    	xil_printf("-------------------------------------------\n\r");
    	xil_printf("%d\n\r",step);
    	xil_printf("Image IN ACTIVE  %d x %d \n\r",hsize_active_input,vsize_active_input);
  	    xil_printf("Image IN  %d x %d \n\r",hsize_input,vsize_input);
  	    xil_printf("Image OUT ACTIVE %d x %d \n\r",hsize_active_output,vsize_active_output);
   	    xil_printf("Image OUT %d x %d \n\r",hsize_output,vsize_output);
   	    //xil_printf("WRITE CR %X \n\r",vdma_write_SR);
   	    //xil_printf("READ CR %X \n\r",vdma_read_SR);


   	    // Kasowanie alarmów ?

   	    //Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + S2MM_VDMASR,vdma_write_SR);

   	    // Proste przetwarzanie obrazu...
   	    //simple_image_processing(hdmi_image_in,bbox_xs,bbox_xe,bbox_ys,bbox_ye,m00);
   	    //xil_printf("m00 %d \n\r",m00);
   	    //xil_printf("bbox_x %d %d \n\r",bbox_xs,bbox_xe);
   	    //xil_printf("bbox_y %d %d \n\r",bbox_ys,bbox_ye);


   	    //rgb2ycbcr(hdmi_image_in,HSIZE_ACTIVE,VSIZE_ACTIVE,imageYCbCr);
		//rgb2ycbcr_fixed(hdmi_image_in,XX,YY,imageYCbCr);

   	    //bgmf.segmentation(imageYCbCr, fgMask, moMask,obToRemove);
   	    //medianbinary5x5(fgMask,HSIZE_ACTIVE,VSIZE_ACTIVE,fgMaskMedian);

   	    // Sobel of foreground mask
   	 	//sobel1D(fgMaskMedian,XX,YY,20,edgeFGmask);
   	    //sobelYCbCr(imageYCbCr,XX,YY,150,edgeInput);

   	    //sobelY_fixed(bgmf.bgModel,XX,YY,150,edgeBG);
   	    //sobelY_float(bgmf.bgModel,XX,YY,150,edgeBG);

   	    // Proste modelowanie tla
   	    //labeller.step(fgMaskMedian,moMask, edgeInput,edgeBG,edgeFGmask);
   	    //labeller.getParameters(noObjects, objects);

   	    // Object analysis
   	    //oA.step(noObjects,objects);

   	    //oA.displayObjectParameters();

  	    //oA.getObjectParameters(noObjects,obParameters);
   	    //oA.objectToRemove(obToRemove);


   	    // Wyswietlenie bbox'a
   	   	Xil_Out32(XPAR_BBOX_REGISTER_0_0 + 0, (600 << 16) + 100);
   	   	Xil_Out32(XPAR_BBOX_REGISTER_0_0 + 4, (400 << 16) + 50);



		// Wyswietlic na konsole obraz ...


		if ( step % 5 == 0) {
			XTime_GetTime(&tEnd);
			xil_printf("Output took %d us.\n", u32(tEnd - tStart));
			XTime_GetTime(&tStart);
		}



		//sleep(1);


   	    step++;

	}



	cleanup_platform();
	//delete [] hdmi_image_in;
	return 0;
}
