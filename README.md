## Arithmetic Series
Assembly program that gets the sum of an arithmetic series.
> Authors: Cedric Caquilala, Will Nigel De Jesus

## Task
You are to create an assembly program that would get the sum of an arithmetic series.

## Procedure
The program should accept a starting number 𝑎𝑎0 , a common difference 𝑑𝑑, and the last number 
𝑎𝑎𝑛𝑛. Your program should display the arithmetic series, ∑ 𝑏𝑏𝑘𝑘𝑛𝑛𝑖𝑖=0  such that, 𝑏𝑏0 = 𝑎𝑎0 and 𝑏𝑏𝑛𝑛−1 <
𝑎𝑎𝑛𝑛 ≤𝑏𝑏𝑛𝑛. Your program should also check for errors from the very start, such as 𝑎𝑎0 > 𝑎𝑎𝑛𝑛 when 
𝑑𝑑  >  0. 

## Usage
Compiling/Running:
> nasm -f elf aseries.asm
> 
> gcc aseries.o -o aseries -m32
> 
> ./aseries

Required lib: gcc-multilib g++multilib
Installation:
> sudo apt-get install gcc-multilib g++-multilib
