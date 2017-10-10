# Basic_Nasm_Tools
Basic Nasm based tools that emulate Irvine's MASM library for those learning assembly  
Designed for students of HPU's CSCI 3001 that are having issues with Visual Studio
## Table of Contents
1. Files
2. Usage
3. Resources
4. TODOS
5. Contributing

### Files
The two main files are the [x86](https://github.com/Scryfox/Basic_Nasm_Tools/blob/master/nasm_tools_32.asm) and [x64](https://github.com/Scryfox/Basic_Nasm_Tools/blob/master/nasm_tools_64.asm) libraries. These contain macros that should aid in basic tasks so that you can focus on the logic of your program rather than basic functionality.  
Each should be commented thoroughly, though if any confusion arises, please do not hesitate to raise an issue or contact me to help ensure they are as clear as possible.

### Usage
Depending on your situation, the use of this library may vary, though the major use cases of linux/mac and online are covered.  
* **Online**  
The recommended online assembler at this time is the [TutorialsPoint Assembler](https://www.tutorialspoint.com/compile_assembly_online.php).  
An important note is that this assembler using 32-bit nasm, thus you should use the 32-bit library.  
Also, you will need to copy and paste text from the library into the text window, as you do not have access to the current working directory of the system.
* **Linux/Mac**  
If you are operating on a linux or mac operating system, nasm installation instructions can be found [here](http://ubuntusoftwareinstall.blogspot.com/2017/07/install-nasm-on-ubuntu-1604.html) for linux (ubuntu), [here](http://macappstore.org/nasm/) for mac.  

  Once you have nasm installed, including a library is as easy as moving the library file to the same directory as your code, and adding **_%include "LIBRARY_NAME"_**, where LIBRARY_NAME is simply the name of the library you wish to use.
### Resources
The following resources have been of great help to me in learning nasm, and I hope they are just as helpful to you.

* [x64 Linux Assembly Textbook](https://github.com/Scryfox/Basic_Nasm_Tools/blob/master/64_Bit_Intel_Assembly_Language_Programming_for_Linux.pdf) - Textbook for x64 assembly, though very helpful for 32-bit as well. Mainly, just remember that registers start with _e_ rather than _r_ in 32-bit assembly.

* [The Art of Picking Registers](http://www.swansontec.com/sregisters.html) - While not necessary, I highly recommend taking a bit of time and reading this post, it sheds quite a bit of light on how to use the various registers most efficiently, and helps make sense of why certain instructions behave the way they do.

* [x86-64 Instruction Set Reference](http://www.felixcloutier.com/x86/) - A fairly complete table of instructions available to the user, though quite a bit of information. I recommend using it to look up instructions from the text, though still worth poking around.

* [Linux Syscall Reference](https://syscalls.kernelgrok.com/) - Helpful site if you wish to try your hand at assembly without the use of the above libraries, or want to do something that isn't already included.

* [Nasm Homepage](http://www.nasm.us/) - It would be remiss not to mention the main site of the language, a helpful resource for any issues, though may be a bit daunting for newcomers.

### TODOS
* ~~Add x64 library~~
* ~~Add macro for printing multiple digit numbers~~
* Add support for reading from stdin
* Add support for reading command-line args

### Contributing
If you like this resource and wish to make it better, feel free to fork and update it, or simply open an issue to bring it to our attention.

If you wish to contact the maintainer directly, please direct all inquiries to wayne.tonnesen@gmail.com.