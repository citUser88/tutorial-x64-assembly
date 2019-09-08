# Assembly language programming tutorials
### With x86 / x64 Instruction Set Architectures (ISA)

 -  Tutorials are created on a ***x64 Windows 10 PC*** with **Windows SDK 10.0.17763.132** and **Visual Studio Community 2017**
 -  Presently these tutorials are using **ml64.exe** TO ASSEMBLE AND LINK .ASM files (Microsoft's Assembler)
 -  Plans to include Linux and other popular OSes
---
### 01 - Hello World, Message Box, Tutorial
 - **HelloWorld.ASM** located in source folder
 - Simple runme.bat file to assemble and link the .ASM file to produce a running executable file
 - requires **kernel32.lib**
 - requires **user32.lib**
---
### ***WHAT*** content to expect in later tutorials
 - Explanations of the **GPRS (General Purpose Registers)**
 - More about linking **DLLS** and **LIBS** into your **ASM** files
 - **Gotchas!** What to look out for when writing assembly code, considerations, directives and memory management
 - More, about using **DLLs** and **LIBs**, specific library functions, where they are located and how to successfully bring them into your assembly code to implement their various functionalities.
 - Writing **DLLS** and **SOs** in assembly and linking them into your C/C++, etc. programs
 - Live debugging your assembly code 
 - Info on using important command-line options of various assemblers effectively
 - Using alternate linkers for your **OBJ** files (*instead of assembler*) and writing assembly code for embedded hardware applications
 - Each tutorial will dynamically develop accompanying information focused around each individual idea, along with insights and use case scenarios where applicable
 - Files, HTML and information concerning where to find information regarding specific programming patterns, personal reads, other tutorials and other people's insights into writing effective assembly code etc..
 - De-constructions, taking apart higher level code to understand how it equates to pure assembly, how opcodes are generated
 - Light coverage of how compilers optimize code and produce optimized assembly code, with deeper coverage of how to hand write, profile and optimize assembly code.
 - Advanced Level content, using the media and streaming instruction sets (also known as vectorization) in both ***AMD*** and ***INTEL*** **CPUS** to fully unlock the potential of vectorizing algorithms with regards to speed, performance and mathematics aimed at 3D graphics, audio, Digital Signal Processing (DSP), real time media streaming, transcoding, etc..
 - Virtualization, security and writing safe, robust and debuggable code which accounts for modern day software/hardware vulnerabilities by focusing on specific types of attacks and how to limit exposure to these risks, within your assembly code based on specific features contained in **Intel** and **AMD** processor technologies.
---
This is my first tutorial series.  I am planning on delivering more content, and have already begun brainstorming a more thorough set of accompanying information and subsequent tutorials to aid entirely in making learning assembly language programming approachable, whilst also revealing how this knowledge can contribute to all your current and future programming projects.  Additionally, towards that end, I will also be engaging the importance of understanding at the conceptual level how a Central Processing Unit (CPU) behaves as a state machine with various physical logic gates at its core levels.  Future material will also include a decent treatment of how the higher level language abstractions, such as object oriented data structures, virtual tables, and memory management end up looking/working after compiling into assembly code.  It is my sincerest hope, that with these tutorials one will be able to develop a deeper understanding of their personal higher level code.  That this will assist in improving one's overall code quality and performance when writing software programs and libraries, which reflect within them, a clearer and deeper understanding of these lower level abstractions.  Have fun!  Be open minded about assembly, it is an art form, which demands a careful minding of how a processor and basic logic circuits work together to run software on your personal computer, smart phone and pretty much all products that employ microprocessor based architectures.

---
