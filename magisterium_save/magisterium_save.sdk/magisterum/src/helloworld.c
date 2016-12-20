/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

//ptz protocol
//My headers
#include "platform.h"
//End

/***************************** Include Files *******************************/

#include "xparameters.h"
#include "xplatform_info.h"
#include "xuartps.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "sleep.h"
#include "xscugic.h"
#include "AXI_Slave.h"

/************************** Constant Definitions **************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define INTC		XScuGic
#define UART_DEVICE_ID		XPAR_XUARTPS_1_DEVICE_ID
#define UART_PMOD_ID		XPAR_XUARTPS_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_INT_IRQ_ID		XPAR_XUARTPS_1_INTR
#define UART_INT_PMOD_ID	XPAR_XUARTPS_0_INTR
#define AXI_INT_IRQ_ID		XPS_FPGA0_INT_ID
/*
 * The following constant controls the length of the buffers to be sent
 * and received with the UART,
 */
#define TEST_BUFFER_SIZE	10

/*
 * The following constants control the behavior of tracking algorithm.
 */

#define H_SIZE 720
#define W_SIZE 1280
#define MIN_X 3696
#define MAX_X 7232
#define MIN_Y 3640
#define MAX_Y 7200
#define yang 100
#define xang 140
#define pulse_90 2000
#define Kp 1
#define Ki 0//2
#define Kd 0//1
//#define N 75
#define Ts 1/60

/************************** Function Prototypes *****************************/

int UartPsIntrExample(INTC *IntcInstPtr, XUartPs *UartInstPtr,
			u16 DeviceId, u16 UartIntrId, XUartPs_Handler Handle);

static int SetupInterruptSystem(INTC *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId);

static int SetupInterruptAXI(INTC *IntcInstancePtr);

void Handler_UART1(void *CallBackRef, u32 Event, unsigned int EventData);

void Handler_UART0(void *CallBackRef, u32 Event, unsigned int EventData);

void Handler_AXI(void *CallBackRef, u32 Event, unsigned int EventData);

void set_pos(u16 pos1,u16 pos2);

void set_speed(u16 speed1, u16 speed2);

void set_acc(u16 acc1,u16 acc2);

void get_pos();

double PID_x(double diff);

double PID_y(double diff);

/************************** Variable Definitions ***************************/

XUartPs UartPs;		/* Instance of the UART Device */
XUartPs UartPs_Pmod;
INTC InterruptController;	/* Instance of the Interrupt Controller */

/*
 * The following buffers are used in this example to send and receive data
 * with the UART.
 */
static u8 SendBuffer[TEST_BUFFER_SIZE];	/* Buffer for Transmitting Data */
static u8 RecvBuffer[TEST_BUFFER_SIZE];	/* Buffer for Receiving Data */
static u8 RecvBuffer_Pmod[TEST_BUFFER_SIZE];
static u8 SendBuffer_Pmod[TEST_BUFFER_SIZE];

/*
 * The following counters are used to determine when the entire buffer has
 * been sent and received.
 */
volatile int TotalReceivedCount;
volatile int TotalSentCount;
int TotalErrorCount;
static u8 rec1=0;
static u8 rec0=0;
static u8 AXI_interrupt=0;
double ku1, ku2, ke0, ke1, ke2;
double e2_x=0, e1_x=0, e0_x=0, u2_x=0, u1_x=0, u0_x=0;
double e2_y=0, e1_y=0, e0_y=0, u2_y=0, u1_y=0, u0_y=0;

/**************************************************************************/
int main(void)
{
	int Status;
	/* Previous regulator
	double a0=1+N*Ts;
	ku1=-(2+N*Ts)/a0;
	ku2=1/a0;
	ke0=Kp+Ki*Ts+Kd*N/a0;
	ke1=-(Kp*(2+N*Ts)+Ki*Ts+2*Kd*N)/a0;
	ke2=(Kp+Kd*N)/a0;
	*/
	/* Run the UartPs Interrupt example, specify the the Device ID */
	Status = UartPsIntrExample(&InterruptController, &UartPs,
				UART_DEVICE_ID, UART_INT_IRQ_ID, (XUartPs_Handler) Handler_UART1);
	if (Status != XST_SUCCESS) {
		xil_printf("UART Interrupt Example Test Failed\r\n");
		return XST_FAILURE;
	}
	Status = UartPsIntrExample(&InterruptController, &UartPs_Pmod,
				UART_PMOD_ID, UART_INT_PMOD_ID, (XUartPs_Handler) Handler_UART0);
	if (Status != XST_SUCCESS) {
		xil_printf("UART Interrupt Example Test Failed\r\n");
		return XST_FAILURE;
	}

	Status = SetupInterruptAXI(&InterruptController);
	if (Status != XST_SUCCESS) {
			xil_printf("AXI Interrupt Initialize Failed\r\n");
			return XST_FAILURE;
		}

	xil_printf("Successfully ran UART Interrupt Example Test\r\n");

	//UART operation
	u8 works[7];
	memcpy(works,"Works\n\r",7);
	XUartPs_Recv(&UartPs,RecvBuffer,5);
	//u8 data='0'+UartPs.ReceiveBuffer.RemainingBytes;
	rec1=0;
	rec0=0;
	u16 val1=6000;
	u16 val2=6000;
	int16_t xsr;
	int16_t ysr;
	double dx=0;
	double dy=0;
	u16 posx=6000;
	u16 posy=6000;
	//u8 sr[4];
	u8 menu=0;
	u8 automatic=0;
	while(1)
	{
		//data='0'+UartPs.ReceiveBuffer.RemainingBytes;
		//XUartPs_Send(&UartPs_Pmod, works, TEST_BUFFER_SIZE);
		//XUartPs_Send(&UartPs, works, TEST_BUFFER_SIZE);
		if(rec0)
		{
			val1=RecvBuffer_Pmod[0]|(RecvBuffer_Pmod[1]<<8);
			val2=RecvBuffer_Pmod[2]|(RecvBuffer_Pmod[3]<<8);
			XUartPs_Recv(&UartPs_Pmod,RecvBuffer_Pmod,0);
			rec0-=1;
		}
		if(rec1)
		{
			menu=RecvBuffer[0];
			val1=(RecvBuffer[1]<<8)|RecvBuffer[2];
			val2=(RecvBuffer[3]<<8)|RecvBuffer[4];
			switch(menu)
			{
			case 0:
				set_pos(val1,val2);
				posx=val1;
				posy=val2;
				break;
			case 1:
				set_speed(val1,val2);
				break;
			case 2:
				set_acc(val1,val2);
				break;
			case 3:
				get_pos();
				XUartPs_Recv(&UartPs_Pmod,RecvBuffer_Pmod,4);
				break;
			case 4:
				automatic=!automatic;
				break;
			default:
				break;
			}
			XUartPs_Recv(&UartPs,RecvBuffer,5);
			rec1-=1;
			XUartPs_Send(&UartPs,works,7);
		}
		if(AXI_interrupt)
		{
			xsr=AXI_SLAVE_mReadReg(XPAR_AXI_SLAVE_0_S00_AXI_BASEADDR,AXI_SLAVE_S00_AXI_SLV_REG0_OFFSET);
			ysr=AXI_SLAVE_mReadReg(XPAR_AXI_SLAVE_0_S00_AXI_BASEADDR,AXI_SLAVE_S00_AXI_SLV_REG1_OFFSET);

			if(automatic)
			{
				dx=W_SIZE/2-xsr;
				dy=H_SIZE/2-ysr;
				//posx=6000+PID_x(xang*dx/W_SIZE)*pulse_90/90;
				//posy=6000+PID_y(yang*dy/H_SIZE)*pulse_90/90;
				posx=posx+dx*xang/8/W_SIZE*pulse_90/90;
				posy=posy+dy*yang/8/H_SIZE*pulse_90/90;
				if(posx<MIN_X) posx=MIN_X;
				else if(posx>MAX_X) posx=MAX_X;
				if(posy<MIN_Y) posy=MIN_Y;
				else if(posy>MAX_Y) posy=MAX_Y;
				set_pos(posx,posy);
			}
			//sr[0]=(xsr>>8)&0xFF;
			//sr[1]=xsr&0xFF;
			//sr[2]=(ysr>>8)&0xFF;
			//sr[3]=ysr&0xFF;
			//XUartPs_Send(&UartPs,sr,4);
			AXI_interrupt=0;
		}
		usleep(20000);
	}
	return XST_SUCCESS;
}

/**************************************************************************/

int UartPsIntrExample(INTC *IntcInstPtr, XUartPs *UartInstPtr,
			u16 DeviceId, u16 UartIntrId, XUartPs_Handler Handle)
{
	int Status;
	XUartPs_Config *Config;
	int Index;
	u32 IntrMask;
	int BadByteCount = 0;

	/*
	 * Initialize the UART driver so that it's ready to use
	 * Look up the configuration in the config table, then initialize it.
	 */
	Config = XUartPs_LookupConfig(DeviceId);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(UartInstPtr, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Check hardware build */
	Status = XUartPs_SelfTest(UartInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the UART to the interrupt subsystem such that interrupts
	 * can occur. This function is application specific.
	 */
	Status = SetupInterruptSystem(IntcInstPtr, UartInstPtr, UartIntrId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the handlers for the UART that will be called from the
	 * interrupt context when data has been sent and received, specify
	 * a pointer to the UART driver instance as the callback reference
	 * so the handlers are able to access the instance data
	 */
	XUartPs_SetHandler(UartInstPtr, Handle, UartInstPtr);

	/*
	 * Enable the interrupt of the UART so interrupts will occur, setup
	 * a local loopback so data that is sent will be received.
	 */
	IntrMask =
		XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
		XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
		XUARTPS_IXR_RXOVR;

	XUartPs_SetInterruptMask(UartInstPtr, IntrMask);

	XUartPs_SetOperMode(UartInstPtr, XUARTPS_OPER_MODE_LOCAL_LOOP);

	/*
	 * Set the receiver timeout. If it is not set, and the last few bytes
	 * of data do not trigger the over-water or full interrupt, the bytes
	 * will not be received. By default it is disabled.
	 *
	 * The setting of 8 will timeout after 8 x 4 = 32 character times.
	 * Increase the time out value if baud rate is high, decrease it if
	 * baud rate is low.
	 */
	XUartPs_SetRecvTimeout(UartInstPtr, 8);


	/*
	 * Initialize the send buffer bytes with a pattern and the
	 * the receive buffer bytes to zero to allow the receive data to be
	 * verified
	 */
	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {

		SendBuffer[Index] = (Index % 26) + 'A';

		RecvBuffer[Index] = 0;
	}

	/*
	 * Start receiving data before sending it since there is a loopback,
	 * ignoring the number of bytes received as the return value since we
	 * know it will be zero
	 */
	XUartPs_Recv(UartInstPtr, RecvBuffer, TEST_BUFFER_SIZE);

	/*
	 * Send the buffer using the UART and ignore the number of bytes sent
	 * as the return value since we are using it in interrupt mode.
	 */
	XUartPs_Send(UartInstPtr, SendBuffer, TEST_BUFFER_SIZE);

	/*
	 * Wait for the entire buffer to be received, letting the interrupt
	 * processing work in the background, this function may get locked
	 * up in this loop if the interrupts are not working correctly.
	 */
	while (1) {
		if ((TotalSentCount == TEST_BUFFER_SIZE) &&
		    (TotalReceivedCount == TEST_BUFFER_SIZE)) {
			break;
		}
	}

	/* Verify the entire receive buffer was successfully received */
	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
		if (RecvBuffer[Index] != SendBuffer[Index]) {
			BadByteCount++;
		}
	}



	/* Set the UART in Normal Mode */
	XUartPs_SetOperMode(UartInstPtr, XUARTPS_OPER_MODE_NORMAL);


	/* If any bytes were not correct, return an error */
	if (BadByteCount != 0) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/**************************************************************************/

void Handler_UART1(void *CallBackRef, u32 Event, unsigned int EventData)
{
	/* All of the data has been sent */
	if (Event == XUARTPS_EVENT_SENT_DATA) {
		TotalSentCount = EventData;
	}

	/* All of the data has been received */
	if (Event == XUARTPS_EVENT_RECV_DATA) {
		TotalReceivedCount = EventData;
		rec1+=1;
	}

	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT) {
		TotalReceivedCount = EventData;
	}

	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}

	/*
	 * Data was received with an parity or frame or break error, keep the data
	 * but determine what kind of errors occurred. Specific to Zynq Ultrascale+
	 * MP.
	 */
	if (Event == XUARTPS_EVENT_PARE_FRAME_BRKE) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}

	/*
	 * Data was received with an overrun error, keep the data but determine
	 * what kind of errors occurred. Specific to Zynq Ultrascale+ MP.
	 */
	if (Event == XUARTPS_EVENT_RECV_ORERR) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}
}

void Handler_UART0(void *CallBackRef, u32 Event, unsigned int EventData)
{
	/* All of the data has been sent */
	if (Event == XUARTPS_EVENT_SENT_DATA) {
		TotalSentCount = EventData;
	}

	/* All of the data has been received */
	if (Event == XUARTPS_EVENT_RECV_DATA) {
		TotalReceivedCount = EventData;
		rec0+=1;
	}

	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT) {
		TotalReceivedCount = EventData;
	}

	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}

	/*
	 * Data was received with an parity or frame or break error, keep the data
	 * but determine what kind of errors occurred. Specific to Zynq Ultrascale+
	 * MP.
	 */
	if (Event == XUARTPS_EVENT_PARE_FRAME_BRKE) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}

	/*
	 * Data was received with an overrun error, keep the data but determine
	 * what kind of errors occurred. Specific to Zynq Ultrascale+ MP.
	 */
	if (Event == XUARTPS_EVENT_RECV_ORERR) {
		TotalReceivedCount = EventData;
		TotalErrorCount++;
	}
}

void Handler_AXI(void *CallBackRef, u32 Event, unsigned int EventData)
{
	AXI_interrupt=1;
}

/*****************************************************************************/

static int SetupInterruptSystem(INTC *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId)
{
	int Status;

	XScuGic_Config *IntcConfig; /* Config for interrupt controller */

	/* Initialize the interrupt controller driver */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				IntcInstancePtr);

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler
	 * performs the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(IntcInstancePtr, UartIntrId,
				  (Xil_ExceptionHandler) XUartPs_InterruptHandler,
				  (void *) UartInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Enable the interrupt for the device */
	XScuGic_Enable(IntcInstancePtr, UartIntrId);

	/* Enable interrupts */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

static int SetupInterruptAXI(INTC *IntcInstancePtr)
{
	int Status;
	XScuGic_Config *IntcConfig; /* Config for interrupt controller */

	/* Initialize the interrupt controller driver */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				IntcInstancePtr);

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler
	 * performs the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(IntcInstancePtr, AXI_INT_IRQ_ID,
				  (Xil_ExceptionHandler) Handler_AXI,
				  (void *) XPAR_AXI_SLAVE_0_S00_AXI_BASEADDR);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// Set max priority and rising edge
	XScuGic_SetPriorityTriggerType(IntcInstancePtr,AXI_INT_IRQ_ID,0x00,0x03);

	/* Enable the interrupt for the device */
	XScuGic_Enable(IntcInstancePtr, AXI_INT_IRQ_ID);

	/* Enable interrupts */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

void set_pos(u16 pos1,u16 pos2)
{
	SendBuffer_Pmod[0]=0x9F;
	SendBuffer_Pmod[1]=0x02;
	SendBuffer_Pmod[2]=0x0A;
	SendBuffer_Pmod[3]=pos1&0x7F;
	SendBuffer_Pmod[4]=(pos1>>7)&0x7F;
	SendBuffer_Pmod[5]=pos2&0x7F;
	SendBuffer_Pmod[6]=(pos2>>7)&0x7F;
	XUartPs_Send(&UartPs_Pmod, SendBuffer_Pmod, 7);
	/* Test application
	SendBuffer_Pmod[0]=pos1>>8;
	SendBuffer_Pmod[1]=pos1&0xFF;
	SendBuffer_Pmod[2]=pos2>>8;
	SendBuffer_Pmod[3]=pos2&0xFF;
	XUartPs_Send(&UartPs_Pmod, SendBuffer_Pmod, 4);
	*/
}

void set_speed(u16 speed1,u16 speed2)
{
	SendBuffer_Pmod[0]=0x87;
	SendBuffer_Pmod[1]=0x0A;
	SendBuffer_Pmod[2]=speed1&0x7F;
	SendBuffer_Pmod[3]=(speed1>>7)&0x7F;
	SendBuffer_Pmod[4]=0x87;
	SendBuffer_Pmod[5]=0x0B;
	SendBuffer_Pmod[6]=speed2&0x7F;
	SendBuffer_Pmod[7]=(speed2>>7)&0x7F;
	XUartPs_Send(&UartPs_Pmod, SendBuffer_Pmod, 8);
}

void set_acc(u16 acc1,u16 acc2)
{
	SendBuffer_Pmod[0]=0x89;
	SendBuffer_Pmod[1]=0x0A;
	SendBuffer_Pmod[2]=acc1&0x7F;
	SendBuffer_Pmod[3]=(acc1>>7)&0x7F;
	SendBuffer_Pmod[4]=0x89;
	SendBuffer_Pmod[5]=0x0B;
	SendBuffer_Pmod[6]=acc2&0x7F;
	SendBuffer_Pmod[7]=(acc2>>7)&0x7F;
	XUartPs_Send(&UartPs_Pmod, SendBuffer_Pmod, 8);
}

void get_pos()
{
	SendBuffer_Pmod[0]=0x90;
	SendBuffer_Pmod[1]=0x0A;
	SendBuffer_Pmod[2]=0x90;
	SendBuffer_Pmod[3]=0x0B;
	XUartPs_Send(&UartPs_Pmod, SendBuffer_Pmod, 4);
}

double PID_x(double diff)
{
	//e1_x=e0_x;
	e1_x=e0_x;
	e0_x=diff;
	e2_x=e0_x+e2_x/2;
	u0_x=Kp*e0_x+Ki*e2_x+Kd*(e0_x-e1_x);
	return u0_x;
}

double PID_y(double diff)
{
	e1_y=e0_y;
	e0_y=diff;
	e2_y=e0_y+e2_y/2;
	u0_y=Kp*e0_y+Ki*e2_y+Kd*(e0_y-e1_y);
	return u0_y;
	/* Old regulator
	e2_y=e1_y; e1_y=e0_y; u2_y=u1_y; u1_y=u0_y; // update variables
	e0_y=diff;
	u0_y=-ku1*u1_y-ku2*u2_y+ke0*e0_y+ke1*e1_y+ke2*e2_y;
	return u0_y;
	*/
}
