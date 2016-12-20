################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

CC_SRCS += \
../src/main.cc \
../src/platform.cc 

CPP_SRCS += \
../src/bgModelFixed.cpp \
../src/bgModelFloat.cpp \
../src/image_processing_functions.cpp \
../src/labellerOnePass.cpp \
../src/objectAnalysis.cpp 

CC_DEPS += \
./src/main.d \
./src/platform.d 

OBJS += \
./src/bgModelFixed.o \
./src/bgModelFloat.o \
./src/image_processing_functions.o \
./src/labellerOnePass.o \
./src/main.o \
./src/objectAnalysis.o \
./src/platform.o 

CPP_DEPS += \
./src/bgModelFixed.d \
./src/bgModelFloat.d \
./src/image_processing_functions.d \
./src/labellerOnePass.d \
./src/objectAnalysis.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM g++ compiler'
	arm-xilinx-eabi-g++ -Wall -O3 -c -fmessage-length=0 -MT"$@" -I../../vdma_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: ARM g++ compiler'
	arm-xilinx-eabi-g++ -Wall -O3 -c -fmessage-length=0 -MT"$@" -I../../vdma_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


