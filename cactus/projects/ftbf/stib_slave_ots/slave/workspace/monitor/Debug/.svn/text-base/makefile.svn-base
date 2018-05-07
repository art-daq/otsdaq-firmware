################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
monitor.elf.size \

ELFCHECK += \
monitor.elf.elfcheck \


# All Target
all: monitor.elf secondary-outputs

# Tool invocations
monitor.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo Building target: $@
	@echo Invoking: MicroBlaze gcc linker
	mb-gcc -Wl,--no-relax -Wl,-T -Wl,../src/lscript.ld -L../../monitor_bsp/core/lib -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -o"monitor.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo Finished building target: $@
	@echo ' '

monitor.elf.size: monitor.elf
	@echo Invoking: MicroBlaze Print Size
	mb-size monitor.elf  |tee "monitor.elf.size"
	@echo Finished building: $@
	@echo ' '

monitor.elf.elfcheck: monitor.elf
	@echo Invoking: Xilinx ELF Check
	elfcheck monitor.elf -hw ../../stib/system.xml -pe core  |tee "monitor.elf.elfcheck"
	@echo Finished building: $@
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) monitor.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
