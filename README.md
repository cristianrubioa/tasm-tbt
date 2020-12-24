# tasm_tbt

## Brief

[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/cristianrubioa?tab=repositories)
[![GitHub issues open](https://img.shields.io/bitbucket/issues-raw/cristianrubioa/tasm_tbt)](https://github.com/cristianrubioa/tasm_tbt/issues)
[![support level: community](https://img.shields.io/badge/support%20level-community-lightgray.png)](http://wiki.ros.org/Industrial)



> DOS emulation environment configuration in addition to the assembly of the work unit to run some of the code snippets .asm implemented and/or prototypes made some time ago as an initiation to this language. -> 
"If you have any doubts, open an [issue](https://github.com/cristianrubioa/tasm_tbt/issues/new)"



## Set up environment

- [Download](https://www.dosbox.com/download.php?main=1) and install the emulator
- Set up the working folder
```
cd ~/Desktop
git clone https://github.com/cristianrubioa/tasm_tbt.git
cd tasm_tbt/
```
- Print working directory ```pwd```
```
pwd
> /Users/<user>/Desktop/tasm_tbt      #e.g. path
```

## Mount unit
- Open DOSBox
- Configure keyboard input
```
keyb sp 850
```
- Mount working directory
```
MOUNT C: /Users/<user>/Desktop/tasm_tbt
C:
```

## Test unit
1. Test ```debug.exe```

- Multiplying two numbers in assembly MS-DOS [see in gist](https://gist.github.com/cristianrubioa/a181e0f577f0a1cd73c00a0015793109)
```
# To view memory, enter programs into it, 
# and track its execution
debug
a100

# Clean records and multiply
sub ax,ax
mov cx,4
add ax,8
loop 105
nop

# View and execute the process 
# for each instruction
r
t
```

2. Test ```TASM.exe``` and ```TLINK.exe```
- Take a .asm code and generate executable, ```bandera.asm``` for example

```
tasm mayus.asm
tlink mayus.obj

# Run
mayus
```
**Note:** is the same step for each .asm file.


## Snippets:
- rescal.asm -> Resistor color calculator prototype (unfinished)
- mayus.asm  -> Convert text to upper case
- minus.asm  -> Convert text to lower case

## EMU8086:

8086 microprocessor emulator with built-in assembler.

- Install [emu8086](https://github.com/cristianrubioa/tasm_tbt/tree/main/emu8086) emulator found in the folder

**Note:** with this emulator you can also program in assembly language since it has an integrated editor.


