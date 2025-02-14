---
title: CS 537 Project 2
layout: default
---

# CS537 Fall 2024, Project 2

## Updates
* TBD

## Administrivia 
- **Due Date** by September 24, 2024 at 11:59 PM
- Questions: We will be using Piazza for all questions.
- Collaboration: The assignment has to be done by yourself. Copying code (from others) is considered cheating. [Read this](http://pages.cs.wisc.edu/~remzi/Classes/537/Spring2018/dontcheat.html) for more info on what is OK and what is not. Please help us all have a good semester by not doing this.
- This project is to be done on the [lab machines](https://csl.cs.wisc.edu/docs/csl/2012-08-16-instructional-facilities/), so you can learn more about programming in C on a typical UNIX-based platform (Linux).
- A few sample tests are provided in the project repository. To run them, execute run-tests.sh in the tests/ directory. Try run-tests.sh -h to learn more about the testing script. Note these test cases are not complete, and you are encouraged to create more on your own.
- Handing it in: Copy the whole project, including solution and tests folder, to ~cs537-1/handin/login/p2 where login is your CS login.
- **Slip Days**: 
  - In case you need extra time on projects, you each will have 2 slip days for the first 3 projects and and 2 more for the final three. After the due date we will make a copy of the handin directory for on time grading. 
  - To use a slip days or turn in your assignment late you will submit your files with an additional file that contains only a single digit number, which is the number of days late your assignment is(e.g 1, 2, 3). Each consecutive day we will make a copy of any directories which contain one of these slipdays.txt files. This file must be present when you submit you final submission, or we won't know to grade your code. 
  - We will track your slip days and late submissions from project to project and begin to deduct percentages after you have used up your slip days.
  - After using up your slip days you can get up to 90% if turned in 1 day late, 80% for 2 days late, and 70% for 3 days late, but for any single assignment we won't accept submissions after the third days without an exception. This means if you use both of your individual slip days on a single assignment you can only submit that assignment one additional day late for a total of 3 days late with a 10% deduction.
  - Any exception will need to be requested from the instructors.

  - Example slipdays.txt
```
1
```

## Creating an xv6 System Call
In this assignment, you will create a system call in xv6 which returns the name of the parent process of the current process.

Learning Objectives:

* Understand the xv6 OS, a simple UNIX operating system.
* Learn to build and customize the xv6 OS
* Understand how system calls work in general
* Understand how to implement a new system call
* Be able to navigate a larger codebase and find the information needed to make changes.

**VERY IMPORTANT(TL;DR):**

What follows in the next few sections is essentially a more detailed version of these 3 points and 2 tasks, so pay attention here!

- Clone the git repo named `p2`
- Do work in the `solution` directory
- Copy the entire `p2` directory to handin

**Task 1**

Create the `getparentname` system call.

**Task 2**

Create the user program `getparentname.c` that will make this system call.

**(TL;DR) ends here**

Summary of what gets turned in:
*   The **p2 directory** has to be turned in with modifications made **to the appropriate files inside the solution directory** to add the new system call and a new user program. xv6 should compile successfully when you run `make qemu-nox`. **Important: Please make sure that you run ```make clean``` inside the solution directory before submitting the p2 directory**.
Ensuring that you get the submission path correct is absolutely critical to the scripts being able to recognize your submission and grading appropriately. Use `cp -r p2 ~cs537-1/handin/<your cs login>` to turn in your submission. Just to drive this point home, the following tree structure depicts how the path to your submission should look like:
```
~cs537-1/handin/<your cs login>/p2/
|---- README.md 
|---- resources.txt
|---- tests
|---- solution 
        | ---- all the contents of xv6 with your modifications, and an additional user level program called getparentname.c
```

*   Your project should (hopefully) pass the tests we supply.
*   **Your code will be tested in the CSL Linux environment (Ubuntu 22.04.3 LTS). These machines already have qemu installed. Please make sure you test it in the same environment.**
*   Include a file called README.md describing the implementation in the top level directory. This file should include your name, your cs login, you wisc ID and email, and the status of your implementation. If it all works then just say that. If there are things which don't work, let us know. Please **list the names of all the files you changed in `solution`**, with a brief description of what the change was. This will **not** be graded, so do not sweat it.
*   Please note that `solution` already has a file called README, do not modify or delete this, just include a separate file called README.md with the above details, it will not impact the other readme or cause any issues. If you remove the xv6 README, it will cause compilation errors.
*   If applicable, a **document describing online resources used** called **resources.txt**. You are welcome to use online resources that can help you with your assignment. **We don't recommend you use Large-Language Models such as ChatGPT.** For this course in particular we have seen these tools give close, but not quite right examples or explanations, that leave students more confused if they don't already know what the right answer is. Be aware that when you seek help from the instructional staff, we will not assist with working with these LLMs and we will expect you to be able to walk the instructional staff member through your code and logic. Online resources (e.g. stack overflow) and generative tools are transforming many industries including computer science and education.  However, if you use online sources, you are required to turn in a document describing your uses of these sources. Indicate in this document what percentage of your solution was done strictly by you and what was done utilizing these tools. Be specific, indicating sources used and how you interacted with those sources. Not giving credit to outside sources is a form of plagiarism. It can be good practice to make comments of sources in your code where that source was used. You will not be penalized for using LLMs or reading posts, but you should not create posts in online forums about the projects in the course. The majority of your code should also be written from your own efforts and you should be able to explain all the code you submit.

### Getting xv6 up and running

The xv6 operating system is present inside `p2/solution` folder . This directory also contains instructions on how to get the operating system up and running in the `README.md` file.

- Simply use `git clone` to acquire a fresh copy of p2 and make your changes to the `solution` folder as mentioned above.

We encourage you to go through some resources beforehand:

1.  [Discussion video](https://www.youtube.com/watch?v=vR6z2QGcoo8&ab_channel=RemziArpaci-Dusseau) - Remzi Arpaci-Dusseau. 
2. [Discussion video](https://mediaspace.wisc.edu/media/Shivaram+Venkataraman-+Psychology105+1.30.2020+5.31.23PM/0_2ddzbo6a/150745971) - Shivaram Venkataraman.
3. [Some background on xv6 syscalls](https://github.com/remzi-arpacidusseau/ostep-projects/blob/master/initial-xv6/background.md) - Remzi Arpaci-Dusseau.

### Creating a new System Call

In this project you will add a new system call to the xv6 operating system. More specifically, you will have to implement a system call named `getparentname` with the following signature:

```
int getparentname(char* parentbuf,char* childbuf, int parentbufsize, int childbufsize)
```

The system keeps track of a process's name and the parent process as entries in the Process Control Block(PCB), which is implemented as a struct in `proc.c`.

The new system call you are adding takes two character pointers (one each for the parent and the child), and two integers `parentbufsize` and `childbufsize` which specifies the respective lengths of the passed buffers. It must then copy the name of the parent process of the process from which the system call is made into the `parentbuf` buffer and the name of the current process into the `childbuf` buffer. For example, suppose a process named `sh` has its parent named `init` and `sh` calls `getparentname()` with a character buffer named `parentbuf` and `childbuf`. When `getparentname()` returns, the name `init` should be copied into the `parentbuf` buffer and the name `sh` should be copied into the `childbuf` buffer.

- If a user program calls the system call with a null pointer for the character buffer or if non-positive integer values are passed as size it should return -1 to indicate failure.
- If the system call succeeded, the return value should be 0 to indicate success.
- Our testcases ensure that no process name exceeds 256 characters in length. 


### Creating a new user level program for testing your systemcall

You will also create a new user level program, also called ```getparentname``` which will call your system call and print its output in the following format ```XV6_TEST_OUTPUT Parent name: syscalloutput Child name: procname``` where ```syscalloutput``` is a placeholder for the output returned by your system call and ```procname``` is the name of the process from where the system call was invoked.

### Adding a user-level program to xv6

As an example we will add a new user level program called `test` to the xv6 operating system.

```
// test.c
#include "types.h"
#include "stat.h"
#include "user.h"
int main(void) 
{
  printf(1, "The process ID is: %d\n", getpid());
  exit();
}
```
    

Now we need to edit the Makefile so our program compiles and is included in the file system when we build XV6. Add the name of your program to `UPROGS` in the Makefile, following the format of the other entries.

Run `make qemu-nox` again and then run `test` in the xv6 shell. It should print the PID of the process.

You may want to write some new user-level programs to help test your implementation of `getparentname`.

### Notes
- Please note that passing parameters to syscalls and returning values from system calls is a bit tricky and does not follow the normal parameters and return semantics that we expect to see in userspace. A good starting place would be to look at how the ```chdir``` system call is implemented, and how its arguments are handled. Remember that one of the goals of this assignment is to be able to navigate a large codebase and find examples of existing code that you can base your work on.
- `proc.c` and `proc.h` are files you can look into to get an understanding of how process related structs look like.
- It is important to remember that the flavour of C used in xv6 differs from the standard C library (stdlib.c) that you might be used to. For example, in the small userspace example shown above, notice that printf takes in an extra first argument(the file descriptor), which differs from the standard printf you might be used to. It is best to use `grep` to search around in xv6 source code files to familiarize yourself with how such functions work.
- `user.h` contains a list of system calls and userspace functions (defined in `ulib.c`) available to you, while in userspace. It is important to remember that these functions can't be used in kernelspace and it is left as an exercise for you to figure out what helper functions are necessary(if any) in the kernel for successful completion of this project.
