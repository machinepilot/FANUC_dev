---
id: FANUC_REF_FANUC_KAREL_REFERENCE
title: "KAREL Programming Language Reference"
topic: karel
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC KAREL Reference Manual (B-83144JA-1)"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# KAREL Programming Language Reference

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_KAREL_Reference.txt` as part of the TeachPendant migration. Original source: FANUC KAREL Reference Manual (B-83144JA-1). Review and update `related:` with neighbor entry IDs.

## Body


This manual (hereinafter referred to as this manual) describes the KAREL function installed in the R-30 i A control device (hereinafter referred to as the control device) equipped with FANUC's application tool software. For information on how to operate the control device, please refer to the manual for each tool. The contents of this manual cannot be used with any control device other than the R-30 i A/R-30iA Mate .

 

This manual does not cover all the features of KAREL . For details, please refer to the following manual.

FANUC Robot series R-30iA/ R-30iA Mate control device KAREL reference manual (B-83144JA-1)

 

Unauthorized reproduction of any content from this book is prohibited.

 

When checking the KAREL program you created on the actual machine, be sure to check the safety of the surrounding area and check that the robot is stopped.

 2.                                  Overview of KAREL

2.1                             What is KAREL ?

In 1920 , Czechoslovakian author Karel Capek published a play called " Rur ." This work is the first in history to feature a "robot." Karel was named after the author's first name.

 

KAREL is a robotics language for building robot systems. Users can create their own functions by creating programs using KAREL on a PC, then loading and executing the programs into a control device.

 

Programs created with KAREL are programs that can be executed on a control device. In terms of being programs that can be executed on a control device, there is no difference between them and normal programs created on a teaching pendant (hereafter referred to as " TP programs" to distinguish them from KAREL programs). However, TP programs are used to execute robot movements and application processing, while KAREL programs are used to build robot systems. TP programs and KAREL programs have different purposes of use.

 

Because their intended uses are different, TP programs are designed to be created and edited on a teaching operation panel and executed as is, whereas KAREL programs cannot be created or edited on a control device. A source program is created on a PC and converted into an executable format ( in KAREL , conversion is called "translation"), and then the executable program is loaded into the control device and executed. While TP programs are modified as needed during daily operation, KAREL programs are created and introduced when the robot system is constructed, and are not modified during daily operation.

 

A KAREL program that is loaded into the control device and set to run automatically when the power is turned on or when it is displayed on the screen is , from the perspective of the worker using the robot system, part of the system software that makes up the robot system, and is no longer recognized as a normal program.

 

2.2                             Features of KAREL

The features of KAREL are as follows:

 

・　PASCAL- based high-level language

Compiled languages

・ Structured language control structures can be used (repetition, selection, etc.)

- Numerical calculations, comparisons, logical operations, and bit operations including transcendental functions are possible

- Users can freely define and use variables

・ Structures and arrays can also be used

 

・ Programs can be incorporated as part of the robot system

 

- Various built-in functions allow you to use various functions of the control device.

 

- Signal and variable event processing can be performed independently of the program sequence

 

- Programmable file and screen input/output operations

 

- Data can be sent and received from outside via serial port or Ethernet ( A05B-2500-R648 (user socket message) is required for socket communication ).

 

KAREL is a high-level robotics language based on PASCAL .

In addition to the functions of PASCAL , KAREL has functions to process vector and position data, and a function to process I/O and other events asynchronously with the execution of the main body ( called a condition handler in KAREL ). In addition, many built-in functions are provided as standard to realize functions specific to robots and control devices, and users can use these to build their own robot systems. For details on built-in functions, please refer to the KAREL Reference Manual (B-83144JA-1) .

 

While TP programs are specialized for describing the motion sequences of robots, KAREL is specialized for performing various processes other than the motion sequences of robots. KAREL can realize dedicated functions specific to users or systems without changing the system software of the control device.

 

KAREL programs are created on a personal computer and then loaded into the control device for use. Once loaded, you can use the functions created with KAREL from then on . If you perform an initial start, you will need to load the KAREL program again, just like a TP program.

 

2.3                             Functions that can be achieved with KAREL

The following features can be achieved using KAREL :

 

Creating a dedicated screen

You can use the KAREL program to create screens to be displayed on the teaching operation panel. You can create dedicated screens to set and display system-specific data. The created screen can be added to the setting screen of the control device and can be handled in the same way as other standard screens. Data input and display on the screen, cursor processing, etc. are controlled by the screen control function of the system software, so there is no need to write these in the KAREL program.

 

Simple PLC function

KAREL programs can scan I/O input/output and data values ​​at regular intervals, and when the I/O or data reaches a specified value, they can set the I/O output or data value. Using this function, simple PLC functions can be realized. It is also possible to handle system variables and register values ​​that cannot be handled by the built-in PMC during processing .

 

Robot position teaching function

KAREL programs can set values ​​to position registers and position data of TP programs. The position calculated by a KAREL program can be set to a position register, and the current position of the robot at the time of signal input can be set to the position data of a TP program. By combining this with the robot's manual feed function, it is possible to create a robot position teaching function using external signals.

 

Numerical calculation function

TP programs can only perform the four basic arithmetic operations on integers and real numbers, but by using KAREL , you can perform operations including trigonometric functions, exponents, logarithms , transcendental functions such as roots, and matrix operations. By calling a calculation program created with KAREL as a subprogram from a TP program, you can achieve the required calculation functions.

 

Data monitoring and recording

By using the multitasking function, KAREL programs can be executed in parallel with TP programs that describe the robot's operations . KAREL programs can be executed continuously at a fixed interval, and process data can be monitored and recorded. Recorded data can also be output to an external device such as a memory card as a text file.

 

2.4                             Precautions when using KAREL

When using KAREL , please be aware of the following points:

 

-　You cannot control the robot's work movements with the KAREL program. To control the robot's work movements, you must use the TP program.

 

-　When scanning I/O or data in parallel with the execution of the main KAREL program, the minimum scan cycle is 8 msec . Scanning at cycles shorter than 8 msec is not possible.

 

-　 There is a limit to the number of I/Os and data that can be scanned in parallel with the execution of the main body of the KAREL program , and the processing that can be performed during that scan is also limited. If you need full-scale PLC functionality, please use the built-in PMC instead of KAREL .

 

・　When you run the main body of a KAREL program repeatedly at short intervals, the system performance will decrease as the number of processes performed by KAREL increases. You need to be very careful about this point. It is practically impossible to perform complex processes at short intervals (for example, every 8 msec ).

 

-　When you execute a certain process periodically in the main body of a KAREL program, the actual execution period may vary considerably. Please use the condition handler function.

 

-　 The process of inputting and outputting data from a file in a KAREL program ( read/write ) takes a certain amount of time. Therefore, if you need to input and output data quickly, you cannot use file input and output.

 

-　You cannot make changes to existing functions in a KAREL program. For example, changing the values ​​of system variables of existing functions in a KAREL program may lead to unexpected results.

 

-　If you directly reference a system variable in a KAREL program, the KAREL program may become a KAREL program that depends on the version of the system software. In the case of a KAREL program that depends on the version of the system software, you need to translate it according to the version of the system software of the control device you are using, and remake the executable program. If you reference a system variable using the GET_VAR and SET_VAR built-in functions, it will become a KAREL program that does not depend on the version of the system software, and once you have created an executable program, it can be used with any control device. However, you cannot use the GET_VAR and SET_VAR built-in functions in a condition handler . Also, if you need to execute processing at high speed, you cannot use the GET_VAR and SET_VAR built-in functions.

 

・　KAREL programs are not processed during power outages even if power outage processing is enabled. When the power is turned off and on , the program will always be executed from the beginning after the power is turned on . It is necessary to consider this when deciding the specifications of the functions created with KAREL programs.

 3.                                  Structure of KAREL Programs 

The source code for the KAERL program is a text file with the extension KL .

It translates text files with the extension KL to create executable KAREL programs. Executable KAREL programs are binary files with the extension PC .

 

For example, translating AAA.KL will give you AAA.PC.

When AAA.PC is loaded into the control unit, a program called AAA will be displayed on the program list screen of the teaching pendant . This program AAA can be selected and executed like a TP program.

If you want to view　.PC files, set the system variable $KAREL_ENB to 1 .



 

On the program list screen, select F1 [ Type ] and select All or KAREL from the displayed menu.



 

Here is a simple KAREL program as an example.

 

If you create a KAREL program that displays " Hello, world " on the user screen of the teaching operation panel and continues to run until 0 is input from the teaching operation panel, it will look like this. We will go into the detailed syntax later, but we will call this HELLO.KL .

 

************************************************** *************************

PROGRAM hello

%NOPAUSE = ERROR+COMMAND+TPENABLE

VAR

  ent_val : INTEGER

  exit_loop : BOOLEAN

BEGIN

  WRITE ( CR, CR, CR, CR, CR, CR, CR, CR, CR, CR )

  exit_loop = FALSE

  REPEAT

    WRITE ( 'Hello,world' , CR )

WRITE     ( '0 completed : ' )

    READ( ent_val )

    IF ent_val = 0 THEN

      exit_loop = TRUE

    ENDIF

  UNTIL exit_loop

  WRITE ( ' Finished ' , CR )

END hello

************************************************** *************************

 

When you translate HELLO.KL, a binary file called HELLO.PC is created.

When you load HELLO.PC from the file screen, HELLO.PC will appear on the list screen.



 

Select and run this in the same way as the TP program, and the user screen will be displayed.



 

The user screen will display " Hello, world " as shown below .



 

" Hello, world " will be displayed repeatedly until 0 is input from the teaching console .

The above steps of creating and translating programs on a computer are necessary when creating programs in KAREL .

The operation is performed using the FANUC offline programming PC software ROBOGUIDE as follows . For details, refer to Chapter 4.



KAREL source code editing screen

 

3.1 Overview of                             the KAREL Program Components 

KAREL 's grammar is based on PASCAL . Unlike C , there is no concept of a pointer that directly specifies a variable area.

 

The format of a KAREL program source code ( KL file) is as follows:

 

PROGRAM program name

% Program attribute specification

%ENVIRONMENT environment file specification

%INCLUDE include file specification

 

CONST

Declaring constants

 

TYPE

Declaring user-defined types

 

VAR

Declaring variables

 

ROUTINE routine name

Describing the routine

END routine name

 

BEGINE

Writing the main program

END program name

 

In KAREL , reserved words and built-in function names are written in uppercase, and other things are written in lowercase. The above program can be written more specifically as follows.

In addition, lines beginning with "--" in KAREL source code are comments.

 

PROGRAM my_test1

--Specifying program attributes This line begins with -- , so it is a comment line. 

%NOLOCKGROUP

%NOPAUSE=COMMAND+ERROR+TPENABLE

 

--Specify the environment file (the environment file is a binary file with the extension EV )

%ENVIRONMENT REGOPE

 

--Specify the include file (include files are text files with the extension KL )

%INCLUDE kliotyps

%INCLUDE my_const

 

--Declaration of constants ( Declare constants AAA_C and BBB_C )

CONST

AAA_C = 12

BBB_C = 14

 

--Declaration of a user-defined type ( define type AAAAA_T )

TYPE

  AAAAA_T = STRUCTURE

    id1: INTEGER

    name1 : STRING[12]

    id2 : INTEGER

    name2 : STRING[12]

  ENDSTRUCTURE

 

--Declaration  of variables

--Variables  declared here become global variables and are valid throughout the entire program.

--It  can also be referenced by other programs.

VAR

aaaaa_var : AAAAA_T

spot_count : INTEGER

num_of_gun : INTEGER

do_resume : BOOLEAN

 

--Declaration of external routine

--Declarations for using routines in other KL files within this KL file.

ROUTINE my_rtn2 FROM my_test2

 

--Declaration of internal routines

ROUTINE my_rtn1

VAR

  --Declaration of variables

--Variables declared here become local variables and can only be used within that routine.

BEGIN

  Writing local routines

END my_rtn1

 

--Start the main program

BEGIN

 

--Write the main program

--Writes various commands, calls to built-in functions and routines, numerical calculations, and other processes.

IF move_flag THEN

aaaaa_var.id1 = 1

aaaaa_var.name1 = 'My test 1'

ELSE

aaaaa_var.id2 = 2

aaaaa_var.name2 = 'My test 2'

ENDIF

 

END my_test1

 

If the main program does not use attributes, environment files, include files, constants, user-defined types, variables, or routines, there is no need to write them. For example , hello.kl is a program that uses default attributes, does not use user types or variables, and does not require routines, so there is no need to write anything other than the main program.

 

3.2 Details of                             the KAREL program components 

 

3.2.1                      Characters and symbols that can be used when writing

You can use uppercase and lowercase letters, half-width katakana characters, numbers, and half-width spaces.

The following symbols can be used : @ < > = / * + - _ , ; : . # $ ' [ ] ( ) & % { } .

 

3.2.2                      Rules for user-defined names

Users can decide the names of variables, constants, user-defined types, etc.

The rule would be:

 

- 12 characters or less

・ The first character is an alphabet

- It is not a reserved word.

- Define before you use

- Either uppercase or lowercase is acceptable

 

The following coding style is recommended:

 

uppercase letter

Constants

・Predefined type names and reserved words

Built-in functions, programs, and routine names

 

Lowercase

User-defined type name

Variable name

· comment

 

The purpose of the coding style above is to standardize notation and make the source code easier to read. If you code in a style other than the above, there will be no errors during translation.

 

3.2.3                      Comments

Everything after "--" to the end of the line is a comment.

 

Comments can be freely added in both Japanese and English. We recommend that you add comments to improve the maintainability of KAREL programs.

 

Comments are automatically removed during translation to generate an executable program, so the execution speed of a KAERL program will not be affected no matter how many comments are included.

 

3.2.4                      Attribute Specifications

Attributes of a KAREL program can be specified at translation time.

The following describes commonly used attribute specifications.

 

%COMMENT = 'THIS IS COMMENT'

If you specify this, the text from ' to ' (in the above case, THIS IS COMMENT ) will be displayed as a program comment on the control device list screen. Up to 16 characters can be set.

 

%NOLOCKGROUP

Note

In normal KAREL programs, you should always specify this attribute.

Specifies the attribute that does not have a motion group. Please specify this attribute even if the program is a robot program. If you do not specify this, the KAREL program will be specified as a program that uses all motion groups.

 

%SYSTEM

Specify the system program attribute for the KAREL program. When the system program attribute is specified, the KAREL program will not be counted as a user program when it is executed, and it will be able to run in parallel with TP programs. Also, system programs will be executed continuously even in single-step mode.

 

%NOBUSYLAMP

Specify an attribute that will not turn on the output during program execution even if the KAREL program is executed. This allows an external PLC to ignore a KAREL program that is always running.

 

%NOPAUSE=ERROR+COMMAND+TPENABLE

This attribute means that the KAREL program will not pause even if the pause event written after = occurs ( ERROR : an alarm occurs with a severity of pause, COMMAND : hold input is ON , TPENABLE : TP is enabled) . If you specify it as above, the program will not pause once it has started running, no matter what happens. Note that even if you specify %NOPAUSE=ERROR , the program will pause if an internal error occurs.

 

%NOABORT=ERROR+COMMAND

This attribute means that the KAREL program will not be terminated even if a forced termination event written after the = occurs ( ERROR : an alarm occurs with a severity of forced termination, COMMAND : CSTOPI input is ON or forced termination from the auxiliary menu) . If you specify it as above, the program will not terminate no matter what happens once it has started. Note that even if you specify %NOABORT=ERROR , the program will be terminated forcibly if an internal error occurs.

 

%NOPAUSESHFT

Specifies the attribute that does not pause even if the shift key is released. Normally, a program started from TP pauses when the shift key is released, but if this attribute is specified, the program will not pause even if the shift key is released after it is started from TP .

 

%TPMOTION

When executing an operation command in the KAREL program, specify an attribute that will cause an alarm if the TP is not valid.

 

%CMOSVARS

Specifies the attribute of the variables declared by the KAREL program to be stored on CMOS . The values ​​of variables stored on CMOS are retained even when the power is turned off . However, since the memory size of CMOS is limited, if many variables are used, the KAREL program may not be able to be loaded into the control device. If this specification is not made, the declared variables will be stored on DRAM .

 

%STACKSIZE = 1000

Specify the area size for the local variables used by the KAREL program. If you do not specify this, the area size will be 300 ( 1200 bytes). If you run a KAREL program and a stack overflow alarm occurs, you must specify this to expand the area size used.

 

3.2.5                      Specifying the environment file

The environment files to be specified are the system variable declaration file and the built-in function declaration file. The environment file is a binary file with the extension .EV , and we use the one provided by FANUC.

 

%ENVIRONMENT sysdef --System variable declaration file

%ENVIRONMENT regope --Declaration file for register-related built-in functions

 

The system variable declaration file is used only when the system variables are referenced directly. If the system variables are referenced using the GET_VAR and SET_VAR built-in functions, do not specify it. If you specify a system variable declaration file, the program will become a KAREL program that depends on the version of the system software, even if the system variables are not referenced directly .

 

When using a built-in function, specify the corresponding declaration file. The declaration file corresponding to a built-in function is listed in the description of each built-in function in Appendix A: KAREL Language Alphabetical Description in the KAREL Reference Manual (B-83144JA-1) . If the declaration file listed is SYSTEM or PBCODE , the built-in function can be used without specifying these environment files. ( The SYSTEM and PBCODE environment files are automatically referenced during translation.)

 

3.2.6                      Specifying Include Files

The include file is a text file with the extension .KL . When you specify an include file, the contents of the specified file are read directly into the specified location during translation. For example,

 

CONST

  my_number = 1

 

Declaration like this in my_const.kl :

 

PROGRAM test

%INCLUDE my_const

VAR

  Cur_number : INTEGER

BEGIN

  Cur_number = my_number

END test

 

If you specify an include file like this,

 

PROGRAM test

CONST

  my_number = 1

VAR

  Cur_number : INTEGER

BEGIN

  Cur_number = my_number

END test

 

This is the same as what you wrote.

 

Include files are usually used to describe constants, variables, and user-defined types shared by multiple KAREL programs in one file.

 

In addition to include files that you create yourself, there are also the following include files provided by FANUC.

 

%INCLUDE kliotyps -- I/O type definitions

%INCLUDE klevccdf --Character code definition for screen control

%INCLUDE klevkeys -- TP key code definitions

 

These files are located under the folder where ROBOGUIDE is installed.

C:\Program Files\FANUC\WinOPLC\Versions\V730-1\support (7DA3 series )　

C:\Program Files\FANUC\WinOPLC\Versions\V740-1\support (7DA4 series )　

C:\Program Files\FANUC\WinOPLC\Versions\V750-1\support (7DA5 series )　

C:\Program Files\FANUC\WinOPLC\Versions\V760-1\support (7DA6 series )　

C:\Program Files\FANUC\WinOPLC\Versions\V770-1\support (7DA7 series )　

If there is no folder of the same series as the actual device, please upgrade ROBOGUIDE .

 

3.2.7                      Predefined Data Types

The following data types are available in KAREL :

 

Data Types

detail

BOOLEAN

Logical type. Value is TRUE or FALSE . Data length is 4 bytes.

INTEGER

Integer type. Data length is 4 bytes.

REAL

Real type. 32 -bit floating point. Data length is 4 bytes.

STRING

String type. The data length is specified in the variable declaration. Up to 254 characters can be specified.
tmp_str : STRING[10]

VECTOR

A vector type, with the following real fields:

X: REAL

Y: REAL

Z:REAL

POSITION

Position data in matrix format. Position data is stored in matrix format. It has four VECTORs and a shape as fields. 

NORMAL : VECTOR

ORIENT: VECTOR

APPROACH: VECTOR

LOCATION: VECTOR

CONFIG_DATA : CONFIG

XYZWPR

Cartesian Position Data. Stores position data in Cartesian format. It has six real numbers and a shape as fields . 

X: REAL

Y: REAL

Z: REAL

W : REAL

P : REAL

R : REAL

CONFIG_DATA : CONFIG

XYZWPREXT

Cartesian position data with additional axis. Position data is stored in Cartesian format with additional axis. The field has nine real numbers and shapes. 

X: REAL

Y: REAL

Z: REAL

W : REAL

P : REAL

R : REAL

CONFIG_DATA : CONFIG

EXT1: REAL

EXT2: REAL

EXT3: REAL

JOINTPOS

Position data in each axis format. Position data is stored in each axis format.

A program cannot directly reference the fields of each axis value. If you want to reference each axis value, convert it to an array of real numbers using the CNV_JPOS_REL built-in function.

CONFIG

Form, which has the following fields:

CFG_TURN_NO1 : INTEGER

CFG_TURN_NO2 : INTEGER

CFG_TURN_NO3 : INTEGER

CFG_FILP : BOOLEAN

CFG_LEFT : BOOLEAN

CFG_UP : BOOLEAN

CFG_FRONT : BOOLEAN

FILE

File type. Holds information when a file is opened . Used for file operations ( READ , WRITE , etc.).

 

When you assign the value of an INTEGER variable to a REAL variable, type conversion is performed automatically.

When assigning the value of a REAL type variable to an INTEGER type variable, type conversion is not performed automatically; you must convert the real number to an integer using the TRUNC or ROUND built-in function before assigning the value.
 

The TRUNC(x) built-in function returns the integer value obtained by truncating the decimal part of the REAL variable x specified as the argument . If x=2.5, it returns 2 .

The ROUND(x) built-in function returns the integer obtained by rounding off the decimal part of the REAL variable x specified as the argument . If x=2.5, it returns 3 .

 

VAR

Int_val : INTEGER

Rel_val : REAL

BEGIN

  Rel_val = int_val

  Int_val = TRUNC( rel_val )

  Int_val = ROUND( rel_val )

END

 

To add 1 mm to the position data of a POSITION type variable in the Z direction, write it as follows:

VAR

p1: POSITION

BEGIN

p1.location.z = p1.location.z + 1

END

 

When substituting position variables, even if the data types are different, the data type is automatically converted before substituting. It is possible to substituting POSITION for XYZWPR, and JOINTPOS for POSITION .

 

When you want to access an individual field in a program, you write it as follows. This is the same for other structure variables and user-defined type variables.

 

variable = variable_name.field_name.field_name ...​​​​

variable_name.field_name.field_name ... = variable​​​

VAR

old_config : CONFIG

tmp_turn : INTEGER

BEGIN

tmp_turn = old_config.cfg_turn_no1 -- Assign the value of the structure field

old_config.cfg_turn_no1 = 5 -- Assign values ​​to the structure fields

END AAA

 

3.2.8                      User-defined Data Types

In KAREL , users can define structures as follows:

 

TYPE

person_t = STRUCTURE -- A structure with INTEGER and BOOLEAN fields.

    person_id : INTEGER

    blood_type : INTEGER

    man_flag : BOOLEAN

ENDSTRUCTURE

 

ext_person_t = STRUCTURE

    person : person_t --user- defined person_t with additional fields

    phone_num : INTEGER

ENDSTRUCTURE

 

Structure variables can also be assigned to each other, and structures can also be used as arguments or return values ​​to functions.

 

However, variables with indefinite size, such as variable-length arrays, cannot be used as fields of a structure. However, a structure can have a structure other than itself as a field.

 

3.2.9                      Arrays

In KAREL , multi-dimensional arrays up to three dimensions and variable-length arrays can be defined and used as variables.

VAR

Array variable name : ARRAY[ array length ] OF type name

Array variable name : ARRAY[ array length , array length ] OF type name

Array variable name : ARRAY[ array length , array length , array length ] OF type name

 

For example, to declare a one-dimensional INTEGER array id10 with an array length of 10 , write it as follows:

VAR

id10 : ARRAY[10] OF INTEGER

 

The declaration of an INTEGER two- dimensional array id20_10 with 20 * 10 items is written as follows:

VAR

id20_10: ARRAY[20,10] OF INTEGER

 

To access an individual field, write the following:

id10[5] = 10

id20_10[18,7] = id10[3]

 

3.2.10                Constants

Constants are declared as follows:

CONST

AAA_C = 111

CM2INCH_C = 2.5

PGNAME = 'TEST'

 

These constants used in your programs will be replaced with the actual values ​​when translated.

 

In KAREL , you cannot write hexadecimal numbers directly in a program. If you want to use hexadecimal numbers to make your program easier to read, you can declare and use constants like the following:

 

CONST

Ox000003FF = 1023

Ox0000FFFF = 65535

Ox00FF0000 = 16711680

Ox0FFFFFFF = 268435455

BEGIN

valuint = valuint AND Ox0FFFFFFF

Note

Please note that the first character of the constant you declare must be the letter O, not the number zero ( 0 ).

 

3.2.11                Available Operators

The following operators can be used when calculating or comparing variables and constants.

 

Mathematical operations : + - / * DIV MOD     

Comparison : < <= = <> >= >         

Logical operators : AND OR NOT   

 

The logical operators AND, OR, and NOT perform logical operations (resulting in TRUE or FALSE ) when used with BOOLEAN type variables, and perform bitwise operations (an operation is performed on each bit, resulting in an integer) when used with INTEGER type variables.

 

In addition, there are the following special operators:

 

>=< : Comparison operator for location data  

               Determines whether two location data are "almost the same".

               The tolerance for the decision can be specified separately in the program.

:       : Multiplication operator for position matrices. Matrix = matrix : matrix multiplication is possible.  

               The built-in function INV can be used to calculate the inverse of a matrix.

#      : Vector dot product operator. Scalar = vector # vector multiplication is possible.  

@    : This is the cross product operator for vectors. Vector = vector @ vector multiplication is possible.  

 

3.2.12                Control Structures

The following control structures can be used in KAREL :

 

IF Statement

IF Boolean THEN

      Command -- Execute if Boolean = TRUE

ENDIF

   

IF Boolean THEN

      Command -- Execute if Boolean = TRUE

ELSE

      Command -- Execute if Boolean = FALSE

ENDIF

 

SELECT Statement

SELECT variable OF

      CASE ( value ) :

        instruction

      CASE (value , value , value , value , value , value , value , value) --multiple values ​​can be specified　

        instruction

      CASE (value , value) :

        instruction

      ELSE: --If none of the cases apply, an alarm will be generated if there is no ELSE .

        instruction

ENDSELECT

   

FOR Statement

FOR variable = initial value TO target value DO -- Even if the initial value = target value, the loop will enter once

      instruction

ENDFOR

   

FOR variable = Initial value DOWNTO Target value DO -- DOWNTO to decrease the counter

      instruction

ENDFOR

 

WHILE Statement

WHILE Boolean DO --If Boolean = FALSE from the beginning , do not execute any commands.

      instruction

ENDWHILE

 

REPEAT Statement

REPEAT

      instruction

UNTIL Boolean – Execute the command once even if Boolean = TRUE from the beginning

 

GOTO Statement

GOTO label name　-- Use GOTO only where appropriate.

Label name :

 

The GOTO statement cannot be used to jump into or out of any of the above loops ( FOR, REPEAT, WHILE ).

 

3.2.13                Routine Invocation

************************************************** ***********************************************************

Here is an example of how to define and call a routine that has no arguments and no return value. Let's say the routine is named my_routine .

************************************************** ***********************************************************

PROGRAM example

 

ROUTINE my_routine -- definition of my_routine No arguments, no return value 

BEGIN

  WRITE( 'now in my_routine', CR ) -- Use the WRITE command to display a string on the TP user screen.

END my_routine -- CR is the line feed code

BEGIN

  WRITE( 'start example', CR )

  my_routine --call my_routine here

END example

 

If there are no arguments, simply write the routine name where you call it, as shown above.

 

************************************************** ***********************************************************

Here is an example of defining and calling a routine with arguments. Let's call the routine square() .

************************************************** ***********************************************************

PROGRAM example

VAR

  tmp_int: INTEGER

ROUTINE square( param_int : INTEGER ) -- takes arguments and has no return value

BEGIN

  param_int = param_int * param_int --squares the given argument

END square

BEGIN

  tmp_int = 2

  square( tmp_int ) -- tmp_int is squared by reference

  WRITE( 'tmp_int * tmp_int = ',tmp_int, CR )

END example

 

In this case, the argument tmp_int is both an input and an output to the routine .

 

************************************************** ***********************************************************

Here is an example of how to define and call a routine that has arguments and a return value. Let's call the routine multi_x() .

************************************************** ***********************************************************

PROGRAM example

VAR

  result_val: INTEGER

-- A routine that raises soc_val to the power of multi_num and returns an INTEGER as the return value .

ROUTINE multi_x ( soc_val : INTEGER; multi_num : INTEGER ) : INTEGER

VAR

  work_val : INTEGER -- local variable declaration

  i : INTEGER -- local variable declaration

BEGIN

  work_val = 1

  FOR i = 1 TO multi_num DO -- Execute the loop once even if multi_num = 1

    work_val = work_val * soc_val

  ENDFOR

  RETURN ( work_val ) -- Returns work_val as the return value.

END multi_x

--Main program

BEGIN

  result_val = multi_x( 2, 3 ) -- Returns the cube of 2

  WRITE( 'result = ', result_val, CR )

END example

 

The return type is written at the end of the routine name and arguments as shown above, separated by a : (if there is no return value, this is not necessary). Also, if a routine has multiple arguments, they are declared separated by a ; .

 

************************************************** ***********************************************************

There are two ways to specify arguments: "pass by reference" and "pass by value".

************************************************** ***********************************************************

 

PROGRAM test

VAR

  item_num : INTEGER

  item_val : REAL

ROUTINE test_1( item:INTEGER; val:REAL )

BEGIN

  :

END test_1

BEGIN

  item_num = 1

  item_val = 2.5

  Test_1( item_num, item_val )

 

As shown above, specifying the argument variable as is is called "passing by reference".

In the case of "pass by reference", when you assign a value to an argument in a routine, the value of the variable in the called program changes. For example, in the above example, if you execute the assignment command item = 5 in the routine test_1 , the value of the variable item_num in the program test will change to 5. Please note that if you do not program this intentionally, unexpected results will occur.

 

Specifying arguments enclosed in parentheses as shown below is called "passing the argument by value."

 

  Test_1( (item_num), (item_val) )

 

When you pass a value to an argument, the value of the variable in the calling program does not change even if you assign a value to the argument within the routine.

 

When calling a KAREL program as a subprogram with arguments from a TP program, the KAREL program cannot specify the arguments. The KAREL program gets the argument values ​​with the GET_TPE_PRM built-in function. In the following example, the main program of the KAREL program is called as a subprogram with arguments.

 

Program PNS0010

1: Register [2] = 2.5

2: Yobidashi cal_reg( 1, Reg [2] )

   :

[ End ]

 

PROGRAM cal_reg

%NOLOCKGROUP

CONST

  prm_int = 1

  prm_real = 2

  prm_str = 3

VAR

  item : INTEGER

  val : REAL

  data_type : INTEGER

  dmy_int : INTEGER

  dmy_real : REAL

  dmy_str : STRING[1]

  stat : INTEGER

BEGIN

  -- The value of the first argument

  GET_TPE_PRM( 1, data_type, item, dmy_real, dmy_str, stat )

  IF stat = 0 THEN

--Check argument types

    IF data_type <> prm_int THEN

      WRITE TPERROR( ' ERROR_TYPE ', 1, data_type, cr )

      ABORT

    ENDIF

  ELSE

    WRITE TPERROR( ' STATUS ', 1, stat, cr )

    ABORT

  ENDIF

 

  -- The value of the second argument

  GET_TPE_PRM( 2, data_type, dmy_int, item_val, dmy_str, stat )

  IF stat = 0 THEN

--Check argument types

    IF (data_type <> prm_int) AND (data_type <> prm_real) THEN

      --TP error (message displayed at the top)

      WRITE TPERROR( ' ERROR_TYPE ', 2, data_type, cr )

      --Forced termination

      ABORT

    ENDIF

　ELSE

    WRITE TPERROR( ' STATUS ', 2, stat, cr )

    ABORT

  ENDIF

  :

END cal_reg

 

The built-in function GET_TPE_PRM used above is explained below. For details, please refer to Appendix A of the KAREL Reference Manual (B-83144JA-1) .

 

3.2.14                Global/local variables

3.2.14.1          Global Variables

Variables defined in the main program of a KAREL program become global variables. Global variables are automatically generated when a KAREL executable program is loaded into the control device, and will exist until they are deleted on the list screen. Even if you delete a KAREL executable program (a program with the extension .PC ) on the list screen, the global variables will not be deleted. In this way, when the main program body is deleted and only the global variables remain, it will be displayed as a program with the extension .VR on the list screen. If you delete this program with the extension .VR again on the list screen, the global variables will be deleted.

 

Global variables can be used throughout the KAREL program. They can also be referenced from other KAREL programs. If you want to reference global variables declared in programs test_1 and test_2 from test_3 , you can do so by declaring them as follows :

 

PROGRAM test_1

%CMOSVARS

VAR

  Val_1 : INTEGER

 

PROGRAM test_2

VAR

  Val_2: REAL

 

PROGRAM test_3

VAR

  Val_1 IN CMOS FROM test_1 : INTEGER

  Val_2 IN DRAM FROM test_2 : REAL

 

IN CMOS specifies that the variable is stored in CMOS . IN DRAM specifies that the variable is stored in DRAM . Variables stored in DRAM lose their stored values ​​when the power is turned OFF/ON .

 

The value of a global variable can be viewed and changed from the TP data screen. Select the KAREL program that defines the global variable from the list screen, and view and change the value on the KAREL variable screen and KAREL position variable screen of the data screen.



 



 

Global variables make it easy to exchange data between KAREL programs. On the other hand, there is a possibility that data may be set or referenced from multiple places in a KAREL program at the same time, which may cause the functions created in the KAREL program to not work properly .

When using global variables, you must design with careful consideration of how data is referenced and changed.

 

3.2.14.2          Local Variables

Variables defined within a routine in a KAREL program are local variables: they are created when the routine that defined them is called and deleted when the routine ends.

A local variable is available only within the routine in which it is defined.

 

Since the valid range of local variables is limited, it is safer to use local variables for variables that are only used within that routine. For example, if a global variable is used as the loop counter variable of a FOR statement, if a routine is called within that FOR statement and the same global variable is used as the loop counter in the FOR statement within that routine, the FOR statement within the routine will operate correctly, but the FOR statement that called the routine will no longer operate correctly.

PROGRAM bad_i

VAR

  i : INTEGER -- loop counter

 

ROUTINE disp_num( cnt:INTEGER )

VAR

  wrk : INTEGER

BEGIN

  wrk = cnt

  FOR i = 1 TO 5 DO --Use global variable i as loop counter

    WRITE( 'CNT', wrk, CR) --In this case, call this routine from within the FOR statement of the main program.

    wrk = wrk + 1 --If you call it, something strange will happen.

  ENDFOR

END disp_num

 

BEGIN

  FOR i = 1 TO 10 DO --Use global variable i as loop counter

    disp_num( i )

  ENDFOR

END bad_i

 

Note

Because local variables only exist while a routine is being called, their values ​​cannot be viewed or changed on a data screen like global variables.

 

3.2.15                User coordinate system and tool coordinate system used in KAREL

In KAREL 's position data related commands, the values ​​set in the system variables $GROUP[n].$FRAME and $GROUP[n].$UTOOL ( n : group number) are used as the user coordinate system and tool coordinate system. The values ​​of these coordinate systems must be set to appropriate values ​​in the KAREL program before executing commands related to position data .

 

The currently selected user coordinate system and tool coordinate system are used in the action statements of the TP program. If you want to use these user coordinate systems and tool coordinate systems in the KAREL program, you must set the currently selected user coordinate system and tool coordinate system values ​​in $GROUP[n].$FRAME and $GROUP[n].$UTOOL as follows:

 

VAR

  uframe_num : INTEGER

  utool_num : INTEGER

  pos1 : XYZWPR IN GROUP[1]

 

BEGIN

uframe_num = $MNUFRAMENUM[1] -- the number of the currently selected user coordinate system

$GROUP[1].$FRAME = $MNUFRAME[1, uframe_num] -- Returns the value of the currently selected user coordinate system.

-- Set to the user coordinate system used in        KAREL

 

utool_num = $MNUTOOLNUM[1]     -- the number of the currently selected tool coordinate system　

$GROUP[1].$UTOOL = $MNUTOOL[1, utool_num] -- the value of the currently selected tool coordinate system

-- Set to the tool coordinate system used in              KAREL

Unlike the position data of a TP program, the user coordinate system number or tool coordinate system number at the time of teaching is not stored in the position data of KAREL . Therefore, the position data of KAREL is the position on the user coordinate system and tool coordinate system set in $GROUP[n].$FRAME and $GROUP[n].$UTOOL at the time of use.

 

If you want to set the world coordinate system values ​​to the user coordinate system or tool coordinate system of KAERL , set it as follows.

 

$GROUP[1].$FRAME = $MOR_GRP[1].$NILPOS

$GROUP[1].$UTOOL = $MOR_GRP[1].$NILPOS

 

$NILPOS is always set to a value in the world coordinate system.

 

3.2.16                KAREL signal input/output

The signal names used in KAERL are as follows, compared to the TP program.

 

KAREL

Signal names in

Data Types

TP Program

Signal names in

Corresponding Signal

DIN

BOOLEAN

DI

Digital I/O (Input)

DOUT

DO

Digital I/O (Output)

RDI

RI

Robot I/O (input)

RDO

RO

Robot I/O (output)

GIN

INTEGER

G.I.

Group I/O (input)

GOUT

GO

Group I/O (Output)

AIN

AI

Analog I/O (Input)

AOUT

AO

Analog I/O (Output)

OPIN

BOOLEAN

-

Operation panel I/O (input)

OPOUT

-

Operation panel I/O (input)

TPOUT

-

Teaching operation panel LED output

 

The operation of each signal is as follows:

 

%INCLUDE kliotyps --I/O type definitions

 

IF (DIN[1] = ON) AND (RDI[1]=OFF) THEN

  DOUT[10] = ON

  RDO[1] = ON

ELSE

  DOUT[10] = OFF

  RDO[1] = OFF

ENDIF

 

gin_val : INTEGER

 

gin_val = GIN[1] * 2

GOUT[1] = gin_val

 

To output a pulse, specify as follows:

 

PULSE DOUT[1] FOR 100

PULSE DOUT[2] FOR 100 NOWAIT

PULSE DOUT[3] FOR 100

 

If you do not specify NOWAIT , the next line will not be executed until the pulse output ends. If you specify NOWAIT , the next line will be executed as soon as the pulse output starts. In the above example, DO[1] will be ON for 2 seconds , and when DO[1] turns OFF , DO[2] and DO[3] will be ON simultaneously for 2 seconds .

 

The relationship between the AIN/AOUT value and the actual analog voltage (± 10V ) output differs depending on the I/O device used . For details on the conversion value, please contact us.

OPIN/OPOUT can refer to the operation panel I/O ( SI/SO ) and peripheral device I/O ( UI/UO ).

 

OPIN

SI

Signal meaning ( R-30 i A )

OPOUT

SO

Signal meaning ( R-30 i A )

0

0

       -

0

0

      REMOTE ( *1 )

1

1

       FAULT RESET

1

1

      BUSY ( *1 )

2

2

       REMOTE

2

2

      HELD ( *1 )

3

3

       *HOLD

3

3

      FAULT

4

4

       USER1

4

4

      BTAL ( *1 )

5

5

       USER2

5

5

      -

6

6

       CYCLE START

6

6

      -

7

7

       -

7

7

      TPENBL ( *1 )

8

8

       CE/CR Select b0

8

8

-

9

9

       CE/CR Select b1

9

9

-

10

10

       -

10

10

-

11

11

       -

11

11

-

12

12

       -

12

12

-

13

13

       -

13

13

-

14

14

       -

14

14

-

15

15

       -

15

15

-

( *1 ) These signals are not located on the operation box.

 

OPIN

UI

Signal meaning ( R-30 i A ) 

OPOUT

UO

Signal meaning ( R-30 i A ) 

16

1

                   *IMSTP

16

1

                   CMDENBL

17

2

                   *HOLD

17

2

                   SYSRDY

18

3

                   *SFSPD

18

3

                   PROGRUN

19

4

                   CSTOPI

19

4

                   PAUSED

20

5

                   FAULT RESET

20

5

                   HELD

twenty one

6

                   START

twenty one

6

                   FAULT

twenty two

7

                   -

twenty two

7

                   ATPERCH

twenty three

8

                   ENBL

twenty three

8

                   TPENBL

twenty four

9

                   RSR1/PNS1

twenty four

9

                   BATALM

twenty five

10

                   RSR2/PNS2

twenty five

10

                   BUSY

26

11

                   RSR3/PNS3

26

11

                   ACK1/SNO1

27

12

                   RSR4/PNS4

27

12

                   ACK2/SNO2

28

13

                   RSR5/PNS5

28

13

                   ACK3/SNO3

29

14

                   RSR6/PNS6

29

14

                   ACK4/SNO4

30

15

                   RSR7/PNS7

30

15

                   ACK5/SNO5

31

16

                   RSR8/PNS8

31

16

                   ACK6/SNO6

32

17

                   PNSTROBE

32

17

                   ACK7/SNO7

33

18

                   PROD_START

33

18

                   ACK8/SNO8

34

19

                   -

34

19

                   SNACK

35

20

                   -

35

20

                   -

 

When referencing the peripheral I/O status with OPIN/OPOUT , you can refer to the UI/UO signal number plus 15 .

 

Note

The OPOUT value is output by the system software according to the system status, so you should not change the OPOUT value in KAREL .

 

TPOUT allows you to check the status of the teaching panel LED .

TPOUT

Meaning of LED ( R- 30iA ) 

1

             alarm

2

             hold

3

             Steps

4

             Processing

5

             Program running

6

(Application dependent)

7

(Application dependent)

8

(Application dependent)

9

             Manual each axis

10

             Manual Orthogonal

11

             Manual tools

 

Note

The TPOUT value is also output by the system software according to the system status, so you should not change the TPOUT value with KAREL .

 

3.2.17                About condition handlers

A condition handler is a function provided by the control device's system software that monitors specified conditions and performs a specified process when the conditions are met. It is like a software version of a PLC function. You can use this condition handler function from a KAREL program. Using a condition handler allows you to monitor and process conditions in parallel with program execution, making it an essential function for creating PLC- like functions in KAREL . Here we will explain how to use a condition handler from KAREL .

 

3.2.17.1          Monitor Block Overview

What is a monitor block?

" Continuously monitor DI[1] , and when it turns ON , turn DO[12] ON ."

Such requests to the condition handler are

　(What to monitor and its condition) + (What to do when it happens)

It is defined in the format:

 

A monitor block is always defined in the form "if A happens, then do B ".

From now on, A will be called the condition and B will be called the action.

When a condition is met, the action is said to be "triggered."

 

Now, just creating a monitor block in a KAREL program doesn't do anything. You have to ask the condition handler to start scanning the conditions it is monitoring. If you don't do this, the scan won't happen. In other words, you have to enable the monitor block.

 

Enabling a monitor block is called " ENABLE ".

 

There is also an option to disable a monitor block that has been enabled.

When disabled, the condition handler stops scanning that monitor block.

This is called " DISABLE ."

 

Also, the operation of deleting a monitor block that you have created is called " PURGE ".

 

That is, at the KAREL programming level, there are the following operations for monitor blocks:

These will become KAREL commands as they are.

·          create

・         ENABLE

-          DISABLE

・         PURGE

 

A global monitor is used when you want to " continue scanning until a trigger occurs once ENABLE is enabled."

 

Once a global monitor is triggered, it is automatically disabled and scanning will not resume unless the monitor is enabled again in the program .

Even if the monitor is triggered and becomes DISABLE , it is not purged, so it can be enabled again .

 

By writing it as follows, you can create a global monitor that turns DO [10] OFF when DI[1] turns ON .

 

CONDITION[1]:

  WHEN DIN[1] = ON DO

   DOUT[10] = OFF

ENDCONDITION

 

 

3.2.17.2          Global Monitor

The global monitor is manipulated in a program as follows:

 

--create​

CONDITION[i]: -- i is the identifier for this monitor.

WHEN condition1 DO -- In   condition1 , write the condition, such as DIN[1] = ON .

action1 -- In     action1 , write the action such as DOUT[1] = ON .

    action2

  WHEN condition2 DO

    action3

    ENABLE CONDITION[1] -- Re-enables CONDITION[i]

ENDCONDTION[i] --Creation completed

 

--valid​

ENABLE CONDITION[i] --This will start scanning CONDITION[i]

 

--invalid​

DISABLE CONDITION[i] --CONDITION [i] will no longer be scanned

 

--erase​

PURGE CONDITION[i] -- CONDITION[i] is cleared.

 

A global monitor is automatically DISABLED once it has been triggered . By specifying an enabling condition action, like condition2 above, you can create a global monitor that will remain enabled once enabled.

 

Also, each monitor you create must be given a unique number that only that monitor has.

However, as long as there is never a moment when the numbers on the two monitors overlap while the program is running, it doesn't matter.

 

In other words, you can repeatedly create and purge a monitor named CONDITION [1] without any problems. If you create a new CONDITION[1] before purging the old one, an alarm will occur.

 

In addition, ENABLE / DISABLE / PURGE operations on a monitor that does not exist will not cause an alarm and will have no effect. Performing the same operation on a monitor that has already been ENABLEd / DISABLEd will not cause an alarm.

 

Also, when you create a monitor, a monitor can have multiple conditions.

And each condition can have multiple actions.

In this case, if any one condition is triggered the entire monitor will be DISABLED .

 

3.2.17.3          Global Conditions

The following conditions can be specified as global monitor conditions:

WHEN DOUT[1]=ON DO ... -- Trigger when DOUT[1] becomes ON

                                                                     -- DOUT can be replaced with other inputs and outputs such as DIN

WHEN DOUT[1]=OFF DO ... -- Trigger when DOUT[1] becomes OFF

WHEN DOUT[1]+ DO ... -- Trigger when DOUT[1] changes from OFF to ON

WHEN DOUT[1]- DO ... -- Trigger when DOUT[1] changes from ON to OFF

WHEN variable 1 = variable 2 DO ... -- Trigger when the values ​​of variable 1 and variable 2 match

        -- "=" can also be { <>,<,<=,>,>= }

        --Variables can be constants or GIN[i]

WHEN ERROR[n] DO ... -- Triggers when a specified error occurs

-- ERROR[*] ( if any alarm occurs ) is also possible

WHEN ABORT DO ... --Triggered when the program is terminated

WHEN PAUSE DO ... --Triggers when the program is paused

WHEN CONTINUE DO ... --Triggered when program execution resumes

 

There are also other conditions for events, etc.

Furthermore, only INTEGER can be used as a variable . BYTE and SHORT cannot be used.

 

You can also combine each condition with AND/OR to create a single condition. However, you cannot mix AND and OR in a single condition.

 

CONDITION[1]: -- All of DIN[1-3] are ON at the same time, or

WHEN DIN[1] AND DIN[2] AND DIN[3] DO -- When one of   DIN[4-6] is ON

    DOUT[1] = ON -- Trigger.

  WHEN DIN[4] OR DIN[5] OR DIN[6] DO

    DOUT[2] = ON

ENDCONDITION

 

3.2.17.4          Actions

The actions that can be specified are listed below.

variable = (variable, constant, DIO )           -- assignment to variable

DOUT = (variable, constant) -- output of                I/O

CANCEL -- Cancel an action

Routine Call                               -- Causes a routine to be executed as an interrupt ( ISR , see below)

                                     -- Cannot have arguments.

ENABLE CONDTION[index] --Enables the monitor, including itself .

                                     --This action keeps you ENABLE

                                                                      --You can create a monitor that

DISABLE CONDITION[index] --disables the monitor

PULSE DOUT[n] FOR time --Pulse output of the signal

ABORT -- Force the program to terminate

PAUSE --pauses a program

 

In addition, there are CONTINUE actions and signal events.

Furthermore, only INTEGER can be used as a variable . BYTE and SHORT cannot be used.

 

3.2.17.5          Interrupt Routines (ISR)

If you specify an interrupt service routine as the action of a condition handler , when the condition is triggered, the currently running KAREL program will be interrupted and the specified routine will be executed.

 

ROUTINE my_routine

BEGIN

  trig_cnt = trig_cnt + 1

  IF trig_cnt = 10 THEN

DOUT[1] = ON

ELSE

  ENABLE CONDITION[1]

ENDIF

END my_routine

:

:

CONDITION[1]:

  WHEN DIN[1] DO

    my_routine

ENDCONDITION

ENABLE CONDITION[1]

 

When the above condition is executed, when DIN[1] turns ON , a local routine called my_routine is called, which counts up the number of times it has been triggered, and when it has triggered 10 times , it outputs DOUT[1] . The action of a condition handler can only perform limited processing, but if you specify an interrupt routine as the action, you can use all the functions available in KAREL .

 

However, since an interrupt routine is executed by suspending the execution of a KAREL program when a condition is triggered, creating an interrupt routine that performs too many processes can cause the execution of a KAREL program to become unstable.

 

Interrupt routines are a useful feature, but they must be used with care.

4.                                  Creating a KAREL program

This chapter explains how to create a KAREL program. You will need the FANUC computer software ROBOGUIDE . Start ROBOGUIDE , create a work cell, and create a virtual robot using a backup of the actual robot.



 

4.1                             How to add and translate KAREL files in ROBOGUIDE

4.1.1                      Example of adding a new

Right-click on a file in the Cell Browser and select " KAREL Source" from New File . If you want to add a KAREL source that you have already created, select "Add." The figure below is an example of the display. (If the Cell Browser is not displayed, select Cell Browser from the View menu.)



 

The newly added file is empty. It will be named Untitiled1.kl , etc. Press the "Save As" button and enter a KAREL file name of 8 characters or less . Example: formtest.kl



 

After inputting the KAREL program, click Build on the top right to translate the KAREL . If the build goes well, it will be automatically loaded into the virtual robot.



 

When you start the build, the results will be displayed in a separate window. If there are any errors, a brief explanation will be displayed.



 

4.1.2                      Example of adding an existing KAREL

Right-click on the file in the Cell Browser and select Add.

The figure below is an example of the display.

(If the Cell Browser is not visible, select Cell Browser from the View menu.)

 



The following screen will be displayed, so select the KAREL program you want to add.



 

Right-click on the file you added and select Build. This will translate your KAREL program.

(In the example below, a file called getattr.pc is created after selecting Build .)

The translated KAREL file will be automatically loaded into the virtual robot.



 

As with the "New Example" example, you can also build the KAREL by opening it and clicking the build button in the upper right corner.

4.2                             KAREL program syntax

4.2.1                      Basic Syntax

-------------------------------------------------- -----------------------------

PROGRAM sample --program name

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

VAR – Variable Definition

  status : INTEGER --Define an INTEGER variable called status

-------------------------------------------------- -----------------------------

BEGIN – The execution part of the program

-------------------------------------------------- -----------------------------

 

SET_INT_REG(1, 100, STATUS)

 

END sample – program name

 

Add the above sample.kl to ROBOGUIDE . For KAREL programs, enter the program name at the beginning and end. The settings for program attributes and loading environment variables are listed below. ( Attributes, etc. are defined with %** .)

Use VAR to define variables.

The part from BEGIN to END is the execution part of the program.

"--" Anything from the two hyphens to the end of the line is a comment. This part will be ignored when building.

 

In the above example, the built-in function SET_INT_REG is used to set register number 1 (i.e. register [1] ) to 100. For details on built-in functions, please refer to the appendix of the KAREL Reference Manual (B-83144JA-1) .

Even if you change this to the following, it will still set register [1] to 100 .

 

-------------------------------------------------- -----------------------------

PROGRAM sample

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

 

CONST

  REG_NUM_C = 1

  REG_VAL_C = 100

VAR

  status : INTEGER

-------------------------------------------------- -----------------------------

BEGIN

-------------------------------------------------- -----------------------------

 

SET_INT_REG(REG_NUM_C, REG_VAL_C, STATUS)

 

END sample

 

CONST means a constant definition.

Change it as follows and build sample.kl . When you run sample.pc , register [1: KAREL sample] = 100 will be set.

-------------------------------------------------- -----------------------------

PROGRAM sample

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

 

CONST

  REG_NUM_C = 1

  REG_VAL_C = 100

  K_SMPL = 'KAREL sample'

VAR

  status : INTEGER

-------------------------------------------------- -----------------------------

BEGIN

-------------------------------------------------- -----------------------------

 

SET_INT_REG(REG_NUM_C, REG_VAL_C, STATUS)

SET_REG_CMT(REG_NUM_C,K_SMPL,STATUS)

 

END sample

 

If you run the program and view the register screen, you can see that the values ​​have been set.



 

SET_REG_CMT is a built-in function that sets a comment in a register.

SET_REG_CMT(REG_NUM_C,'KAREL sample',STATUS)

You can get the same results by setting it as follows:

To set a string within a KAREL program , enclose it in single quotation marks ( ' ).

 

CONST allows you to define strings and numbers.

If you have a large number of constants to define, create a separate KAREL file ( sample2.kl ) and use that KAREL , for example.

%include sample2

If you write it like this, you will be able to use the constants listed in sample2 .

4.2.2                      Programs using routines

The above program can be written using routines, for example as follows:

 

-------------------------------------------------- -----------------------------

PROGRAM sample

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

CONST

  REG_NUM_C = 1

  REG_VAL_C = 100

  K_SMPL = 'KAREL sample'

VAR

  STATUS : INTEGER

 

-------------------------------------------------- -----------------------------

ROUTINE setreg

-------------------------------------------------- -----------------------------

BEGIN

 

SET_INT_REG(REG_NUM_C, REG_VAL_C, STATUS)

SET_REG_CMT(REG_NUM_C,K_SMPL,STATUS)

 

END setreg

-------------------------------------------------- -----------------------------

BEGIN – The execution part of the program

-------------------------------------------------- -----------------------------

 

setreg – calls the routine setreg

 

END sample

  

 

The routine setreg is called. It sets the comment and value in register [1] . setreg has no arguments and does not return any value.

For example, the following program can be written using a routine to add numbers from 1 to 10 and output the result to a cash register [2] .

 

-------------------------------------------------- -----------------------------

PROGRAM sample –Enter the sum of 1 to 10 into register [ 2 ] .

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

CONST – Constant Definition

  START_NUM = 1

  FINISH_NUM = 10

VAR – Variable Definition

  STATUS : INTEGER

  result : INTEGER

-------------------------------------------------- -----------------------------

ROUTINE sum( from_num: INTEGER; to_num:INTEGER) : INTEGER

-------------------------------------------------- -----------------------------

VAR

  idx : INTEGER

  add : INTEGER

BEGIN

   add = 0

   idx = 0

   FOR idx = from_num TO to_num DO

      add = add + idx --The value specified in the sum argument will be stored in add .　

   ENDFOR

  RETURN(add)

END sum

-------------------------------------------------- -----------------------------

BEGIN – This is where the program will run.

-------------------------------------------------- -----------------------------

result = sum( START_NUM, FINISH_NUM) --calls the routine and assigns the result to result .

SET_INT_REG(2,result,STATUS)

 

END sample

  

 

The sum routine has two arguments of type INTEGER ( from_num and to_num ) and returns an INTEGER value ( add ).

 

When this program is executed, sum is called, the return value of sum is stored in result , and the value is output to the register [2] using the SET_INT_REG built-in function.

The variables idx and add defined in the sum routine are only valid in the sum routine. Even if the same variable names are used in other routines, they have no effect on the sum routine.

 

However, be careful not to define variables in the routine that have the same names as variables defined in the program. In this example, do not define STATUS and result as variables in the routine.

 

4.2.3                      Example program using condition handlers

The following example is a program that turns on DO[1] during single step . The status of single step is monitored every 0.5 seconds. Here, the value of the system variable $SSR.$SINGLESTEP ( BYTE type) is obtained by a built-in function.

Note

Do not change the value of this system variable directly.

 

Since a BYTE type variable cannot be specified for the condition , the single step status is output in the following way. If executed without a timer, the condition will always be triggered, which may affect other processing, so a timer is used. When DO[10] rises (turns from off to on), the program ends.

 

-------------------------------------------------- -----------------------------

PROGRAM chk_step

-------------------------------------------------- -----------------------------

%SYSTEM

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

%ENVIRONMENT iosetup

%INCLUDE kliotyps

CONST

  DO_SINGL = 1 -- Number of the DO to output

VAR

  STATUS : INTEGER

  cond_id : INTEGER

  exit : BOOLEAN

  step_val : INTEGER

  on_off_time: INTEGER

  beat_timer: INTEGER

  entry : INTEGER

-------------------------------------------------- -----------------------------

ROUTINE check_step

-------------------------------------------------- -----------------------------

BEGIN

   GET_VAR(entry,'*system*','$ssr.$singlestep',step_val,STATUS) --outputs the value of $ssr.$singlestep to step_val

   IF STATUS <> 0 THEN --If GET_VAR fails, status will be set to a value other than 0.

      POST_ERR(STATUS,'',0,0)

   ELSE

      SET_PORT_VAL(io_dout,DO_SINGL,step_val,STATUS) --Outputs the value of step_val to DO[1] .

   ENDIF

END check_step

-------------------------------------------------- -----------------------------

BEGIN

-------------------------------------------------- -----------------------------

  cond_id = 1

  on_off_time = 500

  step_val = 0

 

  CONDITION[cond_id]:

    WHEN on_off_time < beat_timer DO

      check_step

      beat_timer = 0

      ENABLE CONDITION[cond_id]

  ENDCONDITION

  ENABLE CONDITION[cond_id]

   cond_id = cond_id + 1

  

   CONDITION[cond_id]:

WHEN DOUT[10]+ DO --Detects the rising edge of       DO[10] .

      exit = TRUE

      ENABLE CONDITION[cond_id]

   ENDCONDITION

   ENABLE CONDITION[cond_id]

  

  beat_timer = 0

  CONNECT TIMER TO beat_timer --Starts the timer.

 

  -- Wait forever

  exit = FALSE

  WAIT FOR exit = TRUE

  DISCONNECT TIMER beat_timer --Ends the timer.

 

END chk_step

  

 

The GET_VAR built-in function retrieves the value of a specified variable.

 

Syntax GET_VAR(entry, prog_name, var_name, value, status)

 

Input/Output parameters :

[in,out] entry : INTEGER

[in] prog_name :STRING

[in] var_name : STRING

[out] value - any valid data type

[out] status : INTEGER

 

entry

Returns the entry number of var_name in the variable data table, within the device that var_name resides in . Do not modify this variable.

 

prog_name

Specify the name of the program that contains the specified variable. If prog_name is empty, the name of the currently running task will be used. In this case, we are getting a system variable, so set prog_name to ' *SYSTEM*' .

 

var_name must refer to a static program variable.

var_name can include structure members and array subscripts.

If both var_name and value are arrays, the number copied is equal to the size of the smaller of the two arrays.

If both var_name and value are STRING , the number of characters copied is equal to the size of the smaller of the two.

If both var_name and value are structs of the same type, then value is a copy of var_name .

 

value is the value of var_name .

status indicates the execution result. If it is non -zero , it means an error occurred.

 

If the value of var_name is uninitialized, the value of value is also uninitialized and status is 12311 .

 

4.3                             Running KAREL

4.3.1                      Example of selecting and executing from the list screen

On the System Variables screen (Select Screen →　 Next → 　System → System Variables), set the system variable $ KAREL_ENB to 1. This setting allows you to refer to KAREL programs from the list screen .

 

　　　　

 

　Display the list screen (select Screen Selection →　Next → List ), select F1 [ Type ] , and select "All" or "Karel" to display the KAREL programs. Place the cursor on the translated KAREL and press the enter key to select the KAREL program (the example below shows the display when sample.pc is selected). Press "Shift + Forward" to execute the KAREL program.



 

4.3.2                      How to teach and run a TP program

For example , teach " YOBIDASHI SAMPLE" and run the TP program. (The figure below is an example of teaching sample.pc .)



 

4.3.3                      Example of how to set it as an automatic startup program and execute it

In the system settings screen, set the program that will start automatically when power failure processing is enabled or disabled. The following is an example of the display when PNS0000 is set as the automatic startup program (the actual display may differ).



 

The following is an example of editing PNS0000 and running SAMPLE.PC .



 

4.4                             Application examples of KAREL

4.4.1                      Example of a program indicating a write-protected state to a register

For example, instruct an appropriate TP program as follows. RSR0000 is the TP program name. The 1 to the right of RSR0000 is the register number.



 

When this program is executed, if the specified program (e.g. RSR0000 ) is not write-protected, register [1] is set to 100 ; if the program is write-protected, register [1] is set to 0 .

It is written as GETATTR ('program name', register number where the result should be stored).

 

If you use GETATTR ('program name', 2), the command will output to register [2] whether or not the program is write-protected.

If you use GETATTR ('program name', register [3] ), and if register [3] = 5 , the information on whether or not writing is prohibited will be output to register [5] .

If you specify the second argument indirectly, such as GETATTR ('program name', register [ register [3]] ), then if register [3] = 5 and register [5] = 10 , the information on whether or not writing is prohibited will be output to register [10] .

 

If the program name or register number is incorrect, a warning will be displayed.

 

Notes:

       If you release SHIFT while a program is running and pause the program, KAREL execution will be interrupted. Please be careful not to interrupt the program midway.

l        Be sure to back up the files on the memory card in case they are erased by mistake.

KAREL        programs do not survive power outages. They always run from the beginning .

 

PROGRAM getattr

-------------------------------------------------- ----------------------

-- This program getarrr is get the attribute data from the specified

-- TP program and output the status to specified register

-------------------------------------------------- ----------------------

 

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevccdf

CONST

  TYPE_STRING = 3

  TYPE_INT = 1

  PROTECT_OFF = 1

  PROTECT_ON = 2

 

  NOT_PROTECT = 100

  PROTECTED = 0

--NOT_PROTECT is the value to set in the register when it is not write protected. Here, it is set to 100 .

--PROTECTED is the value to set in the register when it is write protected.

--REG_NUMBER is the number of the register that outputs whether it is write-protected or not.

 

VAR

  param_no : INTEGER

  data_type : INTEGER

  int_val : INTEGER

  real_val : REAL

  str_val : STRING[50]

  status : INTEGER

  prog_name : STRING[50]

  reg_num : INTEGER --register number to be set

 

-------------------------------------------------- ----------------------

ROUTINE get_regnum : INTEGER

-------------------------------------------------- ----------------------

-- This routine get the second argument, reg_number, of

-- GETATTR('prog_name',reg_number) which is called from TP program.

 

VAR

  stat : INTEGER

 

BEGIN

 

  stat = 0

  -- Read the second argument (register number) of getattr (file name, register number).

  param_no = 2

  GET_TPE_PRM(param_no, data_type, int_val, real_val, str_val, stat)

  --GET_TPE_PRM is a built-in function that reads arguments. In this example, it reads the second argument .

  --GET_TPE_PRM (argument no. , data type , integer value , 　real value , 　string , execution result)

  --The value is returned to a variable according to the data type of the argument. If the data type is an integer, the value is returned to int_val.

  -- will be returned.

  IF (stat <> 0) THEN

　　--If the arguments fail to be read, a warning is displayed.

    POST_ERR(stat, '',0,0)

  ELSE

    IF ( data_type = TYPE_INT) THEN

　　　--The value of the read register is output to int_val . Assign this to reg_num .

      reg_num = int_val --Set the register number

    ENDIF

  ENDIF

 

  RETURN (stat)

END get_regnum

-------------------------------------------------- ----------------------

BEGIN -- Main program getattr

-------------------------------------------------- ----------------------

  -- Initialize variables

  param_no = 0

  str_val = ''

  prog_name = ''

  reg_num = 0

 

  -- Read the first argument (file name) of getattr (file name, register number).

  param_no = 1

  GET_TPE_PRM(param_no, data_type, int_val, real_val, str_val, status)

  IF (status <> 0) THE

    --If reading arguments fails, a warning will be output.

    POST_ERR(status, '',0,0)

  ELSE

    IF ( data_type = TYPE_STRING ) THEN

      prog_name = str_val

      -- Read the attribute data of a TP program.

      GET_ATTR_PRG(prog_name, AT_PROTECT, int_val, str_val, status)

      IF ( status <> 0 ) THEN

        POST_ERR(status, '',0,0)

      ELSE

        IF ( int_val = PROTECT_OFF ) THEN -- Protect is off

          status = get_regnum

          IF ( status = 0 ) THEN

            --Assigns a value to a register. Assigns a value ( NOT_PROTECT ) to the specified register number ( reg_num ).

--Assign . NOT_PROTECT is assigned the value defined initially.

            SET_INT_REG(reg_num, NOT_PROTECT,status)

            IF (status <> 0) THEN

              --Displays a warning when a value cannot be assigned to a register.

              POST_ERR(status,'',0,0)

            ENDIF

          ENDIF

        ELSE

          IF (int_val = PROTECT_ON) THEN -- Protect is on

            status = get_regnum

            IF ( status = 0 ) THEN

              -- Set the value to the specified register

              SET_INT_REG(reg_num, PROTECTED,status)

              IF (status <> 0) THEN

                POST_ERR(status,'',0,0)

              ENDIF

            ENDIF

          ENDIF

        ENDIF

      ENDIF

    ELSE

      --If one of the arguments is invalid, the user is prompted to enter a message to correct the argument.

     --Use FORCE_SPMENU to force the user screen to be displayed.

      FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1) -- Force the USER menu screen

      WRITE TPDISPLAY (CHR(cc_clear_win), CHR(cc_home))

      WRITE TPDISPLAY ('Wrong program name was input.',CR)

      WRITE TPDISPLAY ('Please input correct program name.', CR,CR)

      WRITE TPDISPLAY ('GETATTR usage:',CR)

      WRITE TPDISPLAY ('GETATTR(program name, number)',CR)

    ENDIF

  ENDIF

 

END getattr

 

4.4.2                      Example of saving, deleting and loading programs based on a list

How to use:

Load load.pc , save.pc , and delete.pc into the control device.

On the file screen (Screen Selection – Select File), switch devices ( F5 [ Function ] – Select Device Switching) and select the memory card ( MC :).

The following explanation assumes that the selected device is a memory card. ( You can also run KAREL when you select USB as the device.)

MC: (Memory card) put the program list (e.g. LIST.DT ) and TP program in the root. The list should have a .dt extension.

 

Please instruct as follows: Enter the list name in the arguments of each KAREL program.



 

The program list should contain TP programs as follows . One TP program should be listed on each line.

< Example of MC:LIST.DT >

PNS0000.TP

PNS0001.TP

SAMPLE.TP

TEST.TP

 

Notes:

If there is no line break on the last line of the dt file, the last program will not be processed.

 

LOAD.PC

Loads the programs in the file list specified as an argument.

 

SAVE.PC

The programs in the file list specified in the argument will be saved to the memory card.

 

DELETE.PC

The programs in the file list specified in the argument are deleted from the control device.

 

If a program in the list does not exist or if the arguments used when teaching are invalid, a warning will be output.

 

< load.kl >

PROGRAM load

-------------------------------------------------- ----------------------

-- This program load is to load the TP program from specified

-- file list.

-- Usage:

-- Call load(filelist)

-------------------------------------------------- ----------------------

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevccdf

CONST

  TYPE_STRING = 3

VAR

  status : INTEGER

  param_no : INTEGER

  data_type : INTEGER

  int_val : INTEGER

  real_val : REAL

  str_val : STRING[50]

  filelist : FILE

  entry : INTEGER

  dev_name : STRING[10]

  list_name : STRING[60]

  oneprog : STRING[40]

-------------------------------------------------- ----------------------

BEGIN

-------------------------------------------------- ----------------------

  status = 0

  str_val = ''

  dev_name = ''

  list_name = ''

  oneprog = ''

  param_no = 1

  -- load (list name) loads the argument (list name).

  GET_TPE_PRM(param_no, data_type, int_val, real_val, str_val, status)

  IF ( status <> 0 ) THEN --If the list name cannot be read, print a warning.

    POST_ERR(status,'',0,0)

  ELSE

    IF ( data_type = TYPE_STRING) THEN -- parameter is STRING type

      --Reads the currently selected device.

      GET_VAR(entry,'*SYSTEM*', '$DEVICE', dev_name, status)

      IF ( status <> 0 ) THEN

　　　--Print a warning if the device name cannot be read.

        POST_ERR( status, '', 0, 0 )

      ELSE

　　　　--If the selected device is MC: (memory card) and the list name is prglist , list_name contains

　　　　--MC:\prglist.dt is substituted.

        list_name = dev_name + '\' + str_val + '.dt'

      ENDIF

--Opens the specified list. RO is Read Only .

      OPEN FILE filelist ('RO',list_name)

      status = IO_STATUS(filelist) – Assigns the status of the open file to status .

      IF status = 0 THEN – If status is 0 , it means the file was opened successfully.

        --LOAD Clears the user screen to output the status of (list name).

        WRITE TPDISPLAY (CHR(128),CHR(137))

--The operations from REPEAT to UNTIL will be repeated until the UNTIL condition is met .

        REPEAT

          READ filelist(oneprog) – reads the open list line by line.

          status = IO_STATUS(filelist) – Assigns the read status to status .

          IF status = 0 THEN – If one row was successfully read, the status is 0 .

            --Copy the TP program from the root of the selected device to the control device .

            COPY_FILE(dev_name + '\' + oneprog, 'MD:' + oneprog, TRUE, FALSE, status)

            IF (status <> 0 ) THEN -- if copy was failed, post the error.

　　　　　　　--If the copy fails, a warning will be displayed.

              POST_ERR( status, '', 0, 0 )

              IF (status = 2014) THEN -- FILE -014 File not found

　　　　　--If the file is not found, it will be displayed to the user.

                -- Force the USER menu screen

                FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

                -- display the file name that is not found 

                WRITE TPDISPLAY (oneprog, ' is not found',CR)

              ENDIF

            ENDIF

          ELSE

            IF (status <> 2021) THEN

              POST_ERR( status, '', 0, 0 )

            ENDIF

          ENDIF

        UNTIL status = 2021 -- Repeat until end of file

        CLOSE FILE filelist

      ELSE

        POST_ERR( status, '', 0, 0 )

        IF (status = 2014) THEN -- FILE -014 File not found

          -- Force the USER menu screen

          FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

          --Clear user screen to display copy

          WRITE TPDISPLAY (CHR(128),CHR(137))

          WRITE TPDISPLAY (list_name, ' is not found',CR)

        ENDIF

      ENDIF

    ELSE

　　　--If the argument is invalid, switch to the user screen and display a message.

      FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1) -- Force the USER menu screen

      WRITE TPDISPLAY (CHR(cc_clear_win), CHR(cc_home))

      WRITE TPDISPLAY ('Wrong file list name was input.',CR)

      WRITE TPDISPLAY ('Please input correct file list.', CR,CR)

      WRITE TPDISPLAY ('LOAD usage:',CR)

      WRITE TPDISPLAY ('CALL LOAD(file_list)',CR)

    ENDIF

  ENDIF

END load

< save.kl >

PROGRAM save

-------------------------------------------------- ----------------------

-- This program save is to save the TP program from specified

-- file list.

-- Usage:

-- Call save(filelist)

-------------------------------------------------- ----------------------

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevccdf

CONST

  TYPE_STRING = 3

VAR

  status : INTEGER

  param_no : INTEGER

  data_type : INTEGER

  int_val : INTEGER

  real_val : REAL

  str_val : STRING[50]

  filelist : FILE

  entry : INTEGER

  dev_name : STRING[10]

  list_name : STRING[60]

  oneprog : STRING[40]

-------------------------------------------------- ----------------------

BEGIN

-------------------------------------------------- ----------------------

  status = 0

  str_val = ''

  dev_name = ''

  list_name = ''

  oneprog = ''

  param_no = 1

 

  -- get parameter 1 that is the list of files to be loaded.

  GET_TPE_PRM(param_no, data_type, int_val, real_val, str_val, status)

  IF ( status <> 0 ) THEN -- if parameter is not existing, post the error.

    POST_ERR(status,'',0,0)

  ELSE

    IF ( data_type = TYPE_STRING) THEN -- parameter is STRING type

      --get the selected device information

      GET_VAR(entry,'*SYSTEM*', '$DEVICE', dev_name, status)

      IF ( status <> 0 ) THEN

        POST_ERR( status, '', 0, 0 )

      ELSE

        list_name = dev_name + '\' + str_val + '.dt'

      ENDIF

 

      OPEN FILE filelist ('RO',list_name)

      status = IO_STATUS(filelist) -- Get status of OPEN FILE

      IF status = 0 THEN

        --Clear user screen to display SAVE status

        WRITE TPDISPLAY (CHR(128),CHR(137))

        REPEAT

          READ filelist(oneprog) -- Read one line from specified file list

          status = IO_STATUS(filelist) -- Get status of READ

          IF status = 0 THEN -- program is found

            --copy the listed program to the controller

            COPY_FILE('MD:' + oneprog, dev_name + '\' + oneprog, TRUE, FALSE, status)

            IF (status <> 0 ) THEN -- if copy was failed, post the error.

              POST_ERR( status, '', 0, 0 )

              IF (status = 2014) THEN -- FILE-014 Program does not exist

                -- Force the USER menu screen

                FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

                -- display the file name that is not found 

                WRITE TPDISPLAY (oneprog, 'does not exist',CR)

              ELSE

                IF (status = 7073) THEN -- MEMO-073 Program does not exist

                  -- Force the USER menu screen

                  FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

                  -- display the file name that is not found 

                  WRITE TPDISPLAY (oneprog, 'does not exist',CR)

                ENDIF

              ENDIF

            ENDIF

          ELSE

            IF (status <> 2021) THEN

              POST_ERR( status, '', 0, 0 )

            ENDIF

          ENDIF

        UNTIL status = 2021 -- Repeat until end of file

        CLOSE FILE filelist

      ELSE

        POST_ERR( status, '', 0, 0 )

        IF (status = 2014) THEN -- FILE -014 File not found

          -- Force the USER menu screen

          FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

          --Clear user screen to display copy

          WRITE TPDISPLAY (CHR(128),CHR(137))

          WRITE TPDISPLAY (list_name, ' is not found',CR)

        ENDIF

      ENDIF

    ELSE

      FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1) -- Force the USER menu screen

      WRITE TPDISPLAY (CHR(cc_clear_win), CHR(cc_home))

      WRITE TPDISPLAY ('Wrong file list name was input.',CR)

      WRITE TPDISPLAY ('Please input correct file list.', CR,CR)

      WRITE TPDISPLAY ('SAVE usage:',CR)

      WRITE TPDISPLAY ('CALL SAVE(file_list)',CR)

    ENDIF

  ENDIF

END save

 

＜delete.kl ＞

PROGRAM delete

-------------------------------------------------- ----------------------

-- This program delete is to delete the TP program from specified

-- file list.

-- Usage:

-- Call delete(filelist)

-------------------------------------------------- ----------------------

 

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevccdf

CONST

  TYPE_STRING = 3

 

VAR

  status : INTEGER

  param_no : INTEGER

  data_type : INTEGER

  int_val : INTEGER

  real_val : REAL

  str_val : STRING[50]

  filelist : FILE

  entry : INTEGER

  dev_name : STRING[10]

  list_name : STRING[60]

  oneprog : STRING[40]

 

-------------------------------------------------- ----------------------

BEGIN

-------------------------------------------------- ----------------------

  status = 0

  str_val = ''

  dev_name = ''

  list_name = ''

  oneprog = ''

  param_no = 1

 

  -- get parameter 1 that is the list of files to be loaded.

  GET_TPE_PRM(param_no, data_type, int_val, real_val, str_val, status)

  IF ( status <> 0 ) THEN -- if parameter is not existing, post the error.

    POST_ERR(status,'',0,0)

  ELSE

    IF ( data_type = TYPE_STRING) THEN -- parameter is STRING type

      --get the selected device information

      GET_VAR(entry,'*SYSTEM*', '$DEVICE', dev_name, status)

      IF ( status <> 0 ) THEN

        POST_ERR( status, '', 0, 0 )

      ELSE

        list_name = dev_name + '\' + str_val + '.dt'

      ENDIF

 

      OPEN FILE filelist ('RO',list_name)

      status = IO_STATUS(filelist) -- Get status of OPEN FILE

      IF status = 0 THEN

        --Clear user screen to display DELETE status

        WRITE TPDISPLAY (CHR(128),CHR(137))

        REPEAT

          READ filelist(oneprog) -- Read one line from specified file list

          status = IO_STATUS(filelist) -- Get status of READ

          IF status = 0 THEN -- program is found

            --copy the listed program to the controller

            CLEAR(oneprog, status)

            IF (status <> 0 ) THEN -- if copy was failed, post the error.

              POST_ERR( status, '', 0, 0 )

              IF (status = 7073) THEN -- MEMO -073 File not found

                -- Force the USER menu screen

                FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

                -- display the file name that is not found 

                WRITE TPDISPLAY (oneprog, 'does not exist',CR)

              ENDIF

            ENDIF

          ELSE

            IF (status <> 2021) THEN

              POST_ERR( status, '', 0, 0 )

            ENDIF

          ENDIF

        UNTIL status = 2021 -- Repeat until end of file

        CLOSE FILE filelist

      ELSE

        POST_ERR( status, '', 0, 0 )

        IF (status = 2014) THEN -- FILE -014 File not found

          -- Force the USER menu screen

          FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1)

          --Clear user screen to display copy

          WRITE TPDISPLAY (cc_clear_win, cc_home)

          WRITE TPDISPLAY (list_name, ' is not found',CR)

        ENDIF

      ENDIF

    ELSE

      FORCE_SPMENU(TP_PANEL,SPI_TPUSER,1) -- Force the USER menu screen

      WRITE TPDISPLAY (CHR(cc_clear_win),CHR(cc_home))

      WRITE TPDISPLAY ('Wrong file list name was input.',CR)

      WRITE TPDISPLAY ('Please input correct file list.', CR,CR)

      WRITE TPDISPLAY ('DELETE usage:',CR)

      WRITE TPDISPLAY ('CALL DELETE(file_list)',CR)

    ENDIF

  ENDIF

 

END delete

5                                  Creating a screen using Form Editor

Form Editor is software that displays the screen and processes key input. This section explains how to create a screen using Form Editor .

 

5.1                             Overview

To create a screen, follow the steps below.

 

Screen creation steps:

1.        Create a dictionary file with the extension FTX.

2.        Build the FTX file and create a dictionary file with the extension TX and a variable file (*.VR).

3.        Creating and translating KAREL programs

4.        Check the display on ROBOGUIDE

5.        Load to the control device

6.        Check the display on the control device

 

For details, please refer to Chapter 9 of the KAREL Reference Manual (B-83144JA-1) . For a systematic explanation, please also refer to the KAREL Reference Manual (B-83144JA-1) . Here, we will explain the procedure for creating a simple screen with ROBOGUIDE .

 

5.2                             Creating a dictionary file

5.2.1                      Dictionary files

A dictionary file is a file that contains display text and display control data. The contents of a dictionary file can be displayed from a KAREL program. Because the program body and the display data are separate, it is easy to modify the screen without modifying the program. In some cases, it may be necessary to modify the program itself.

Also, if the control device supports multiple languages ​​(for example, Japanese and English), the display needs to be changed according to the language. If you prepare dictionaries for each language, the KAREL program will automatically use the dictionary file corresponding to the selected language. This is another advantage of dictionary files.

 

5.2.2                      Creating a dictionary file with the FTX extension

For information on creating dictionaries using ROBOGUIDE, please see " Development Tools " in the Help section.

Right-click on the file in the Cell Browser and select New File. If you want to add a dictionary that you have already created, select "Add." If you want to add a new file, select Form Dictionary. The following is an example of the display.

(If the Cell Browser is not visible, select Cell Browser from the View menu.)



The newly added file is empty. It will be named Untitiled1.ftx , etc. Click the "Save As" button and change the name to one that follows the rules ( 4 characters for dictionary name, 4 characters for language name). For example, if the dictionary name is dict and the language name is engl (English), it will be dictengl.ftx .



 

Here, we will add three files , ftstengl.ftx, ftstjapa.ftx, and ftstkanj.ftx, for use with a multi-language robot. These are files for English, Japanese ( Kana: for monochrome teaching operation panel ), and Japanese (Kanji: for i Pendant ), respectively.

ftstengl.ftx (English screen dictionary)

.kl ftstex

.form

$-,form1

&home &reverse "Sample screen" &standard &new_line

" Sample label " &new_line

@3,5" Integer: " @3,28"-%10d(1,32767)" &new_line

@4,5" Real: " @4,28"-%12f" &new_line

@5,5" Program name(TP):" @5,28 "-%12pk(1)" &new_line

@6,5" Program name(PC): " @6,28"-%12pk(2)" &new_line

@7,5" DIN[1] " @7,28"-%7P(io_c)" &new_line

@8,5" DOUT[1] " @8,28"-%7P(io_c)" &new_line

@9,5" Select item" @9,28"-%12w(item_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"F1" &new_line

" F2" &new_line

" F3" &new_line

" F4 " &new_line

" HELP "

$-, form1_help * help text

"Help Line 1" &new_line

"Help Line 2" &new_line

"Help Line 3" &new_line

* You can have a maximum of 48 help lines

$-, io_c

"OFF" &new_line

"ON"

$-, item_c

"item 1"

$-

"item 2"

$-

"item 3"

$-

"\a"

ftstjapa.ftx (Kana screen dictionary: for monochrome TP )

.form

$-,form1

&home &reverse " Sample Game " &standard &new_line

" Sample Label " &new_line

@3,5" Integer: " @3,28"-%10d(1,32767)" &new_line

@4,5" Real: " @4,28"-%12f" &new_line

@5,5" Program (TP):" @5,28 "-%12pk(1)" &new_line

@6,5" Program (PC): " @6,28"-%12pk(2)" &new_line

@7,5" DIN[1] " @7,28"-%7P(io_c)" &new_line

@8,5" DOUT[1] " @8,28"-%7P(io_c)" &new_line

@9,5" Select item" @9,28"-%12w(item_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"F1" &new_line

" F2" &new_line

" F3" &new_line

" F4 " &new_line

" HELP "

$-, form1_help * help text

" Help 1" &new_line

" Help 2" &new_line

" Help 3" &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

$-, item_c

"item 1"

$-

"item 2"

$-

"item 3"

$-

"\a"

ftstkanj.ftx (Dictionary for Japanese screen: for i Pendant )

.form

$-,form1

&home &reverse ' Sample screen ' &standard &new_line

' Sample Label ' &new_line

@3,5" Integer: " @3,23"-%10d(1,32767)" &new_line

@4,5" Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC): ' @6,23"-%12pk(2)" &new_line

@7,5" DIN[1] " @7,23"-%7P(io_c)" &new_line

@8,5" DOUT[1] " @8,23"-%7P(io_c)" &new_line

@9,5'Item selection ' @9,23"-%12w(item_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"F1" &new_line

" F2" &new_line

" F3" &new_line

" F4 " &new_line

" HELP "

$-, form1_help * help text

" Help 1" &new_line

" Help 2" &new_line

" Help 3" &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

$-, item_c

' Item 1'

$-

' Item 2'

$-

' Item 3'

$-

"\a"

 

5.2.3                      Dictionary file names and languages

The dictionary file name is determined according to the following rules:

lFile        name must be 8 characters

lThe        first four characters are the dictionary name

The        last four letters are the language name

The        extension is either etx.ftx.utx

l        Use ftx when creating a screen with Form Editor .

The four        - letter language names are as follows:

"ENGLISH" = ENGLISH

"JAPA" = JAPANESE

"KANJI" = KANJI

"FREN" = FRENCH

"GERM" = GERMAN

"SPAN" = SPANISH

"CHIN" = CHINESE

"TAIW" = Taiwanese

 

In this example, the following three files were created:

ftstengl.ftx      ​

l        ftstjapa.ftx

l        ftstkanj.ftx

The dictionary name "ftst" is common regardless of language. The language names are engl, japa, kanj from top to bottom .

 

5.2.4                      Building the dictionary file

You can build the dictionary file by right-clicking the file you added in the cell browser and selecting Build.

 



 

The same can be done by clicking the Build button in the upper right corner of the text editor.



 

When you start a build, the results will be displayed in a separate window. If there are any errors, a brief explanation will be displayed.



 

The following files will be generated:

Loadable Dictionary Files

ftstengl.tx, ftstjapa.tx, ftstkanj,tx

Variables File

ftst.vr, ftstjp.vr, ftstkn.vr

KAREL files for include

ftstex.kl

 

Both will be generated in the same directory as the ftx file.

For information on the files generated by the build, please refer to the KAREL Reference " 10.3.17 Building forms and loading them into the control device."

Once the build is successful on ROBOGUIDE , it will be automatically loaded onto the virtual robot.



 

5.3                             Creating KAREL programs

Create the following formtest.kl file and translate it. (You can create and translate it in the same way as you would a dictionary file.)

PROGRAM formtest

%INCLUDE klevkmsk

%INCLUDE klevkeys

%INCLUDE ftstex

VAR

  l_status: INTEGER

  value_array: ARRAY[7] OF STRING[30]

  change_array:ARRAY[1] OF BOOLEAN --If not used, the array size can be set to [1]

  inact_array:ARRAY[1] OF BOOLEAN-- If not used, the array size can be set to [1]

  test_int: INTEGER

  test_real:REAL

  prog_name1:STRING[40]

  prog_name2:STRING[40]

  select_item: INTEGER

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

BEGIN

  test_int = 12345

  test_real = 12.345

  -- *.ftx contains seven variable display parts ( data items ) such as %d .

  --Therefore , the value array is ARRAY [7] .

  value_array[1] = 'test_int' --The first data item %10d is the integer variable test_int

  value_array[2] = 'test_real' --The second data item %12f is the real variable test_real

  value_array[3] = 'prog_name1' -- The third data item %12pk is the string variable prog_name1

  value_array[4] = 'prog_name2' -- The fourth data item %12pk is the string variable prog_name2

  value_array[5] = 'DIN[1]' -- The fifth data item, %7P, is a BOOLEAN . Display DI[1] .

  value_array[6] = 'DOUT[1]' -- The sixth data item, %7P, is a BOOLEAN . Display DO[1] .

  value_array[7] = 'select_item' -- The seventh data item %12w is an INTEGER variable.

  def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM('ftst', form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    IF term_char = KY_NEW_MENU THEN

      --If a request is made to display a separate screen, the loop will be exited.

      exit_menu = TRUE

    else

     

    ENDIF

  UNTIL exit_menu

END formtest

 

When using the Form Editor , use the DISCTRL_FORM built-in function. DISCTRL_FORM displays and controls the screen on the teaching panel or CRT/KB .

For details on DISCTRL_FORM, please refer to the appendix of the KAREL Reference Manual (B-83144JA-1) . Here is a brief explanation of DISCTRL_FORM .

 

Syntax DISCTRL_FORM(dict_name, ele_number, value_array, inact_array, change_array, term_mask, def_item, term_char, status)

 

Input/Output parameters :

[in] dict_name : STRING

[in] ele_number : INTEGER

[in] value_array : ARRAY OF STRING

[in] inactive_array : ARRAY OF BOOLEAN

[out] change_array : ARRAY OF BOOLEAN

[in] term_mask : INTEGER

[in,out] def_item : INTEGER

[out] term_char : INTEGER

[out] status : INTEGER

%ENVIRONMENT Group:PBcore

 

dict_name is the four character name of the dictionary , including the form . In the above example, ftst is the dictionary name.

ele_number is the dictionary element of the form. In the above ftstengl.ftx example, $-.form1 to .endform are dictionary elements.

 

value_array is an array of variable names that correspond to each editable or display - only data item in the form .

$-,form1

&home &reverse ' Sample screen ' &standard &new_line

' Sample Label ' &new_line

@3,5" Integer: " @3,23"-%10d(1,32767)" &new_line

@4,5" Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC): ' @6,23"-%12pk(2)" &new_line

@7,5" DIN[1] " @7,23"-%7P(io_c)" &new_line

@8,5" DOUT[1] " @8,23"-%7P(io_c)" &new_line

@9,5'Item selection ' @9,23"-%12w(item_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels?form1_help

* element which contains help

.endform

It says, and there are seven elements .

 

inactive_array is an array of BOOLEANs corresponding to the fields in the form .

Each BOOLEAN is FALSE by default , which means it can be changed.

A BOOLEAN can be set to TRUE , which makes it unavailable for selection.

The size of the array can be more or less than the number of items in the form.

For example, if you set inactive_array[3] to TRUE , you will not be able to change value_array[3] . In the above example, you will not be able to place the cursor on the program ( TP ) part.

If you are not using an inactive array, set the size of the array to 1. There is no need to initialize this array.

 

change_array is an array of BOOLEANs corresponding to each editable or display-only data item in the form . If a value is set, the corresponding BOOLEAN becomes TRUE ; otherwise it becomes FALSE . This array does not need to be initialized. The size of the array can be more or less than the number of data items in the form. If you are not using change_array , set the size of the array to 1 .

 

term_mask is a bitmask that indicates the conditions under which the form should be terminated. When a selectable item or new menu is selected, the form always terminates, regardless of term_mask .

 

term_char contains the key that terminated the form or other conditions. For information on the keys that are normally output, see the appendix of the KAREL Reference Manual (B-83144JA-1) .

 

status indicates the status of the executed process. If status is other than 0 , it means that an error occurred.

 

FORCE_SPMENU is a built-in function that forces the screen to change.

Syntax: FORCE_SPMENU(device_code, spmenu_id, screen_no)

 

Input/Output parameters :

[in] device_code :INTEGER

[in] spmenu_id : INTEGER

[in] screen_no : INTEGER

%ENVIRONMENT Group :pbcore

 

detail :

device_code Specifies the display device, one of the following predefined constants:

tp_panel Teaching operation panel

crt_panel CRT

spmenu_id and screen_no specify the screen to be forcibly displayed. The predefined constants beginning with SPI_ define spmenu_id , and the predefined constants beginning with SCR_ define screen_no .

For details, please see the appendix of the KAREL reference manual.

 

5.4                             Check the display on ROBOGUIDE

Please run the KAREL program FORMTEST on the virtual robot . If the build is successful, both the dictionary file and the KAREL program will be automatically loaded into the virtual robot, so you can check the display just by running them.

An example of Japanese display is shown on the i Pendant



 

3 When you place the cursor on a program ( TP ), the F4 key will display [ Select ] . When you press F4 , a list of TP programs will be displayed. When you select a program from the list, it will be displayed on the screen.

Similarly, in 4 Programs ( PC ), the KAREL programs are displayed. Press the F4 key to display the list of KAREL programs.

 

When you move the cursor to DOUT[1] off, the F4 key displays [ ON ] and the F5 key displays [ OFF ] . Pressing F4 or F5 switches DO[1] on and off.

 

7 When you place the cursor on the item selection, the F4 key will switch to [ Select ] . The items defined in item_c in the ftstkanj.ftx file will be displayed. In this example, items 1 to 3 will be displayed.

 

Pressing F5 [ Help ] displays the string specified in form1_help in the ftstkanj.ftx file. In this example,

Help Line 1

Help Line 2

Help Line 3

It will be displayed as follows.

5.5                             Loading to the control unit

After checking the operation on the virtual robot, we check it on the actual control device.

1.        Copy the PC, VR, and TX files to the Compact FLASH ATA card. In this example, the files are as shown in the figure below.

2.        Insert it into the device

3.        Display the file screen and press F3 to load the PC, VR, or TX file.



 

Note

Only FTST.VR is used as a VR file . This is for the following reasons. VR files store internal data such as the display start position and width of data items. Although they are generated from files for each language, only one piece of data can be used. For this reason, the type, position, width, etc. of data items must be consistent between languages. Please load only one VR file. Normally, please use the English VR file.

 

5.6                             Operation check on actual device

Run FORMTEST.PC on the control unit . 

7.                                  Registration to the screen menu

7.1                             Setting from the System Variables screen

You can register a KAREL program to the screen menu. Register the display name and program name in the following system variables. By using the KAREL utilization support function, you can easily register to the screen menu. The KAREL utilization support function is optional ( A05B-2500-J971 ). For details, refer to Chapter 10 , KAREL utilization support function.

$　CUSTOMMENU[n].$TITLE

$　CUSTOMMENU[n].$PROG_NAME

n is a value between 1 and 31. The value of n determines which menu it will be added to.

However, if n is 8 , 9 , 29 , 30 , or 31 , it will not be registered in any menu.

Please see the following table.

System Variables 

Menu displayed 

$CUSTOMMENU[1]

F1 [ Command ] menu on the editing screen

$CUSTOMMENU[2]

F1 [ Command ] menu on the editing screen

$CUSTOMMENU[3]

F2 key on the editing screen

$CUSTOMMENU[4]

F3 key on the edit screen

$CUSTOMMENU[5]

F4 key on the edit screen

$CUSTOMMENU[6]

Auxiliary News

$CUSTOMMENU[7]

Auxiliary News

$CUSTOMMENU[10]

Utility Screen

$CUSTOMMENU[11]

Utility Screen

$CUSTOMMENU[12]

Test execution screen

$CUSTOMMENU[13]

Manual operation screen

$CUSTOMMENU[14]

Manual operation screen

$CUSTOMMENU[15]

Alarm screen

$CUSTOMMENU[16]

Alarm screen

$CUSTOMMENU[17]

I/O Screen

$CUSTOMMENU[18]

I/O Screen

$CUSTOMMENU[19]

Settings screen

$CUSTOMMENU[20]

Settings screen

$CUSTOMMENU[21]

File Screen

$CUSTOMMENU[22]

Data Screen

$CUSTOMMENU[23]

Data Screen

$CUSTOMMENU[24]

Status screen

$CUSTOMMENU[25]

Status screen

$CUSTOMMENU[26]

Status screen

$CUSTOMMENU[27]

Status screen

$CUSTOMMENU[28]

System Screen

 

Note

To display the screen menu created with KAREL , please switch to User 2 screen in the KAREL program.

You cannot use F1 [ Screen ] on a screen displayed in KAREL .

If you want to exit the screen, you need to switch to another screen.

For example, here is how to run Formtest.pc from the auxiliary menu:

 

PROGRAM formtest

%INCLUDE klevkmsk

%INCLUDE klevkeys

%INCLUDE ftstex

VAR

  l_status: INTEGER

  value_array: ARRAY[5] OF STRING[30]

  change_array:ARRAY[1] OF BOOLEAN --If not used, the array size can be set to [1]

  inact_array:ARRAY[1] OF BOOLEAN-- If not used, the array size can be set to [1]

  test_int: INTEGER

  test_real:REAL

  prog_name1:STRING[40]

  prog_name2:STRING[40]

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

BEGIN

  test_int = 12345

  test_real = 12.345

  value_array[1] = 'test_int' --The first data item %10d is the integer variable test_int

  value_array[2] = 'test_real' --The second data item %12f is the real variable test_real

  value_array[3] = 'prog_name1' -- The third data item %12pk is the string variable prog_name1

  value_array[4] = 'prog_name2' -- The fourth data item %12pk is the string variable prog_name2

  value_array[5] = 'DIN[1]' -- The fifth data item, %7P, is a BOOLEAN . Display DI[1] .

  def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM('ftst', form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    IF term_char = KY_NEW_MENU THEN

      --If a separate screen display request occurs, the loop will be exited.

      FORCE_SPMENU(device_stat,SPI_TPHINTS,1) – If a separate screen is requested, move to the hints screen.

      exit_menu = TRUE

    else

     

    ENDIF

  UNTIL exit_menu

END formtest

  

 

This is an example of moving to a hint screen when a separate screen display request is made.

 

In the System Variables screen, set $CUSTOMMENU[6] as follows:



 

Opens the auxiliary menu.



 

Verify that the Test sample has been added.

 

When you select Test sample , formtest.pc will be executed and you will see the screen you created. Switch the screen display. For example, press the data key.

 

Check that the hint screen is displayed.

 

On the system variables screen, full-width characters cannot be displayed (but can be entered). To check the comment you entered, display the registered menu as shown above.

However , you can create and run a program using the Form Editor like the one below to display full-width characters registered in $CUSTOMMENU .

 

7.2                             Example of setting system variables from a KAREL program

Create dictionary files for Form Editor ( cstmengl.ftx , cstmjapa.ftx , cstmkanj.ftx ) and a KAREL program ( cs_set.kl ) and run them.

 

cstmengl.ftx (English screen dictionary)

.kl cstm

.form

$-,form1

&home &reverse "Customizing User menu" &standard &new_line

"$CUSTOMMENU[] Config" &new_line

@3,5 "[1].$TITLE" @3,23"-%12k" &new_line

@4,5 "[1].$PROG_NAME" @4,23"-%12k" &new_line

@5,5 "[2].$TITLE" @5,23"-%12k" &new_line

@6,5 "[2].$PROG_NAME" @6,23"-%12k" &new_line

@7,5 "[3].$TITLE" @7,23"-%12k" &new_line

@8,5 "[3].$PROG_NAME" @8,23"-%12k" &new_line

@9,5 "[4].$TITLE" @9,23"-%12k" &new_line

@10,5 "[4].$PROG_NAME" @10,23"-%12k" &new_line

@11,5 "[5].$TITLE" @11,23"-%12k" &new_line

@12,5 "[5].$PROG_NAME" @12,23"-%12k" &new_line

@13,5 "[6].$TITLE" @13,23"-%12k" &new_line

@14,5 "[6].$PROG_NAME" @14,23"-%12k" &new_line

@15,5 "[7].$TITLE" @15,23"-%12k" &new_line

@16,5 "[7].$PROG_NAME" @16,23"-%12k" &new_line

@17,5 "[10].$TITLE" @17,23"-%12k" &new_line

@18,5 "[10].$PROG_NAME" @18,23"-%12k" &new_line

@19,5 "[11].$TITLE" @19,23"-%12k" &new_line

@20,5 "[11].$PROG_NAME" @20,23"-%12k" &new_line

@21,5 "[12].$TITLE" @21,23"-%12k" &new_line

@22,5 "[12].$PROG_NAME" @22,23"-%12k" &new_line

@23,5 "[13].$TITLE" @23,23"-%12k" &new_line

@24,5 "[13].$PROG_NAME" @24,23"-%12k" &new_line

@25,5 "[14].$TITLE" @25,23"-%12k" &new_line

@26,5 "[14].$PROG_NAME" @26,23"-%12k" &new_line

@27,5 "[15].$TITLE" @27,23"-%12k" &new_line

@28,5 "[15].$PROG_NAME" @28,23"-%12k" &new_line

@29,5 "[16].$TITLE" @29,23"-%12k" &new_line

@30,5 "[16].$PROG_NAME" @30,23"-%12k" &new_line

@31,5 "[17].$TITLE" @31,23"-%12k" &new_line

@32,5 "[17].$PROG_NAME" @32,23"-%12k" &new_line

@33,5 "[18].$TITLE" @33,23"-%12k" &new_line

@34,5 "[18].$PROG_NAME" @34,23"-%12k" &new_line

@35,5 "[19].$TITLE" @35,23"-%12k" &new_line

@36,5 "[19].$PROG_NAME" @36,23"-%12k" &new_line

@37,5 "[20].$TITLE" @37,23"-%12k" &new_line

@38,5 "[20].$PROG_NAME" @38,23"-%12k" &new_line

@39,5 "[21].$TITLE" @39,23"-%12k" &new_line

@40,5 "[21].$PROG_NAME" @40,23"-%12k" &new_line

@41,5 "[22].$TITLE" @41,23"-%12k" &new_line

@42,5 "[22].$PROG_NAME" @42,23"-%12k" &new_line

@43,5 "[23].$TITLE" @43,23"-%12k" &new_line

@44,5 "[23].$PROG_NAME" @44,23"-%12k" &new_line

@45,5 "[24].$TITLE" @45,23"-%12k" &new_line

@46,5 "[24].$PROG_NAME" @46,23"-%12k" &new_line

@47,5 "[25].$TITLE" @47,23"-%12k" &new_line

@48,5 "[25].$PROG_NAME" @48,23"-%12k" &new_line

@49,5 "[26].$TITLE" @49,23"-%12k" &new_line

@50,5 "[26].$PROG_NAME" @50,23"-%12k" &new_line

@51,5 "[27].$TITLE" @51,23"-%12k" &new_line

@52,5 "[27].$PROG_NAME" @52,23"-%12k" &new_line

@53,5 "[28].$TITLE" @53,23"-%12k" &new_line

@54,5 "[28].$PROG_NAME" @54,23"-%12k" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"" &new_line

"" &new_line

"" &new_line

"help"

$-, form1_help * help text

*1234567890123456789012345678901234

* You can have a maximum of 48 help lines

"Title is the name of showing on menu." &new_line

"PROG_NAME is the program name to"&new_line

"be executed." &new_line

"[1], [2} EDIT[INST]" &new_line

"[3] EDIT F2"&new_line

"[4] EDIT F3" &new_line

"[5] EDITF4" &new_line

"[6],[7] FCTN" &new_line

"[10], [11] UTILITIES" &new_line

"[12] TEST CYCLE" &new_line

"[13], [14] MANUAL FCTNS" &new_line

"[15], [16] ALARM" &new_line

"[17], [18] I/O" &new_line

"[19], [20] SETUP" &new_line

"[21] FILE" &new_line

"[22], [23] DATA" &new_line

"[24], [25],[26],[27] STATUS" &new_line

"[28] SYSTEM" &new_line

  

cstmjapa.ftx (Kana screen dictionary: monochrome TP )

.form

$-,form1

&home &reverse " Customize Menu " &standard & new_line

"$CUSTOMMENU[] Settings " &new_line

@3,5 "[1].$TITLE" @3,23"-%12k" &new_line

@4,5 "[1].$PROG_NAME" @4,23"-%12k" &new_line

@5,5 "[2].$TITLE" @5,23"-%12k" &new_line

@6,5 "[2].$PROG_NAME" @6,23"-%12k" &new_line

@7,5 "[3].$TITLE" @7,23"-%12k" &new_line

@8,5 "[3].$PROG_NAME" @8,23"-%12k" &new_line

@9,5 "[4].$TITLE" @9,23"-%12k" &new_line

@10,5 "[4].$PROG_NAME" @10,23"-%12k" &new_line

@11,5 "[5].$TITLE" @11,23"-%12k" &new_line

@12,5 "[5].$PROG_NAME" @12,23"-%12k" &new_line

@13,5 "[6].$TITLE" @13,23"-%12k" &new_line

@14,5 "[6].$PROG_NAME" @14,23"-%12k" &new_line

@15,5 "[7].$TITLE" @15,23"-%12k" &new_line

@16,5 "[7].$PROG_NAME" @16,23"-%12k" &new_line

@17,5 "[10].$TITLE" @17,23"-%12k" &new_line

@18,5 "[10].$PROG_NAME" @18,23"-%12k" &new_line

@19,5 "[11].$TITLE" @19,23"-%12k" &new_line

@20,5 "[11].$PROG_NAME" @20,23"-%12k" &new_line

@21,5 "[12].$TITLE" @21,23"-%12k" &new_line

@22,5 "[12].$PROG_NAME" @22,23"-%12k" &new_line

@23,5 "[13].$TITLE" @23,23"-%12k" &new_line

@24,5 "[13].$PROG_NAME" @24,23"-%12k" &new_line

@25,5 "[14].$TITLE" @25,23"-%12k" &new_line

@26,5 "[14].$PROG_NAME" @26,23"-%12k" &new_line

@27,5 "[15].$TITLE" @27,23"-%12k" &new_line

@28,5 "[15].$PROG_NAME" @28,23"-%12k" &new_line

@29,5 "[16].$TITLE" @29,23"-%12k" &new_line

@30,5 "[16].$PROG_NAME" @30,23"-%12k" &new_line

@31,5 "[17].$TITLE" @31,23"-%12k" &new_line

@32,5 "[17].$PROG_NAME" @32,23"-%12k" &new_line

@33,5 "[18].$TITLE" @33,23"-%12k" &new_line

@34,5 "[18].$PROG_NAME" @34,23"-%12k" &new_line

@35,5 "[19].$TITLE" @35,23"-%12k" &new_line

@36,5 "[19].$PROG_NAME" @36,23"-%12k" &new_line

@37,5 "[20].$TITLE" @37,23"-%12k" &new_line

@38,5 "[20].$PROG_NAME" @38,23"-%12k" &new_line

@39,5 "[21].$TITLE" @39,23"-%12k" &new_line

@40,5 "[21].$PROG_NAME" @40,23"-%12k" &new_line

@41,5 "[22].$TITLE" @41,23"-%12k" &new_line

@42,5 "[22].$PROG_NAME" @42,23"-%12k" &new_line

@43,5 "[23].$TITLE" @43,23"-%12k" &new_line

@44,5 "[23].$PROG_NAME" @44,23"-%12k" &new_line

@45,5 "[24].$TITLE" @45,23"-%12k" &new_line

@46,5 "[24].$PROG_NAME" @46,23"-%12k" &new_line

@47,5 "[25].$TITLE" @47,23"-%12k" &new_line

@48,5 "[25].$PROG_NAME" @48,23"-%12k" &new_line

@49,5 "[26].$TITLE" @49,23"-%12k" &new_line

@50,5 "[26].$PROG_NAME" @50,23"-%12k" &new_line

@51,5 "[27].$TITLE" @51,23"-%12k" &new_line

@52,5 "[27].$PROG_NAME" @52,23"-%12k" &new_line

@53,5 "[28].$TITLE" @53,23"-%12k" &new_line

@54,5 "[28].$PROG_NAME" @54,23"-%12k" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"" &new_line

"" &new_line

"" &new_line

"help"

$-, form1_help * help text

*1234567890123456789012345678901234

* You can have a maximum of 48 help lines

" How do I register the KAREL program menu ? " & new_line

" Setting up . Display name for TITLE ."&new_line

" Enter the program name in PROG_NAME " & new_line

" Please ." &new_line

"[1], [2} Edit [ Marei ]" &new_line

"[3] Edit F2"&new_line

"[4] Edit F3" &new_line

"[5] Edit F4" &new_line

"[6],[7] Hojo Menu " &new_line

"[10], [11] Utility " &new_line

"[12] Test Run " &new_line

"[13], [14] Manual operation " &new_line

"[15], [16] Alarm " &new_line

"[17], [18] I/O" &new_line

"[19], [20] Settings " &new_line

"[21] File " &new_line

"[22], [23] Data " &new_line

"[24], [25], [26], [27] Condition " &new_line

"[28] System " &new_line

  

 

cstmkanj.ftx (Dictionary for Japanese screen: for i Pendant )

.form

$-,form1

&home &reverse ' Menu customization settings ' &standard &new_line

'$CUSTOMMENU[] Settings ' &new_line

@3,5 "[1].$TITLE" @3,23"-%12k" &new_line

@4,5 "[1].$PROG_NAME" @4,23"-%12k" &new_line

@5,5 "[2].$TITLE" @5,23"-%12k" &new_line

@6,5 "[2].$PROG_NAME" @6,23"-%12k" &new_line

@7,5 "[3].$TITLE" @7,23"-%12k" &new_line

@8,5 "[3].$PROG_NAME" @8,23"-%12k" &new_line

@9,5 "[4].$TITLE" @9,23"-%12k" &new_line

@10,5 "[4].$PROG_NAME" @10,23"-%12k" &new_line

@11,5 "[5].$TITLE" @11,23"-%12k" &new_line

@12,5 "[5].$PROG_NAME" @12,23"-%12k" &new_line

@13,5 "[6].$TITLE" @13,23"-%12k" &new_line

@14,5 "[6].$PROG_NAME" @14,23"-%12k" &new_line

@15,5 "[7].$TITLE" @15,23"-%12k" &new_line

@16,5 "[7].$PROG_NAME" @16,23"-%12k" &new_line

@17,5 "[10].$TITLE" @17,23"-%12k" &new_line

@18,5 "[10].$PROG_NAME" @18,23"-%12k" &new_line

@19,5 "[11].$TITLE" @19,23"-%12k" &new_line

@20,5 "[11].$PROG_NAME" @20,23"-%12k" &new_line

@21,5 "[12].$TITLE" @21,23"-%12k" &new_line

@22,5 "[12].$PROG_NAME" @22,23"-%12k" &new_line

@23,5 "[13].$TITLE" @23,23"-%12k" &new_line

@24,5 "[13].$PROG_NAME" @24,23"-%12k" &new_line

@25,5 "[14].$TITLE" @25,23"-%12k" &new_line

@26,5 "[14].$PROG_NAME" @26,23"-%12k" &new_line

@27,5 "[15].$TITLE" @27,23"-%12k" &new_line

@28,5 "[15].$PROG_NAME" @28,23"-%12k" &new_line

@29,5 "[16].$TITLE" @29,23"-%12k" &new_line

@30,5 "[16].$PROG_NAME" @30,23"-%12k" &new_line

@31,5 "[17].$TITLE" @31,23"-%12k" &new_line

@32,5 "[17].$PROG_NAME" @32,23"-%12k" &new_line

@33,5 "[18].$TITLE" @33,23"-%12k" &new_line

@34,5 "[18].$PROG_NAME" @34,23"-%12k" &new_line

@35,5 "[19].$TITLE" @35,23"-%12k" &new_line

@36,5 "[19].$PROG_NAME" @36,23"-%12k" &new_line

@37,5 "[20].$TITLE" @37,23"-%12k" &new_line

@38,5 "[20].$PROG_NAME" @38,23"-%12k" &new_line

@39,5 "[21].$TITLE" @39,23"-%12k" &new_line

@40,5 "[21].$PROG_NAME" @40,23"-%12k" &new_line

@41,5 "[22].$TITLE" @41,23"-%12k" &new_line

@42,5 "[22].$PROG_NAME" @42,23"-%12k" &new_line

@43,5 "[23].$TITLE" @43,23"-%12k" &new_line

@44,5 "[23].$PROG_NAME" @44,23"-%12k" &new_line

@45,5 "[24].$TITLE" @45,23"-%12k" &new_line

@46,5 "[24].$PROG_NAME" @46,23"-%12k" &new_line

@47,5 "[25].$TITLE" @47,23"-%12k" &new_line

@48,5 "[25].$PROG_NAME" @48,23"-%12k" &new_line

@49,5 "[26].$TITLE" @49,23"-%12k" &new_line

@50,5 "[26].$PROG_NAME" @50,23"-%12k" &new_line

@51,5 "[27].$TITLE" @51,23"-%12k" &new_line

@52,5 "[27].$PROG_NAME" @52,23"-%12k" &new_line

@53,5 "[28].$TITLE" @53,23"-%12k" &new_line

@54,5 "[28].$PROG_NAME" @54,23"-%12k" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"" &new_line

"" &new_line

"" &new_line

" Help "

$-, form1_help * help text

*1234567890123456789012345678901234

* You can have a maximum of 48 help lines

' Which menu should the KAREL program be registered in? ' &new_line

' Setting ' &new_line

' Display name in TITLE , program name in PROG_NAME ' &new_line

' Please enter ' &new_line

'[1], [2] F1 [ Command ] menu 　on the editing screen ' &new_line

'[3] F2 key on the editing screen ' &new_line

'[4] F3 key on the editing screen ' &new_line

'[5] F4 key on the editing screen ' &new_line

'[6],[7] Auxiliary Menu ' &new_line

'[10], [11] Utility screen ' &new_line

'[12] Test execution screen ' &new_line

'[13], [14] Manual operation screen ' &new_line

'[15], [16] Alarm screen ' &new_line

'[17], [18] I/O screen ' &new_line

'[19], [20] Settings screen ' &new_line

'[21] File screen ' &new_line

'[22], [23] Data Screen ' &new_line

'[24], [25], [26], [27] Status screen ' &new_line

'[28] System Screen ' &new_line

  

cs_set.kl ( KAREL setting $CUSTOMMENU[] )

-- $CUSTOMMENU[1] - [7], [10] - [28] are the 26 system variables.

--Set it up.

PROGRAM cs_set

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevkmsk

%INCLUDE klevkeys

%INCLUDE cstm

VAR

  l_status: INTEGER

  value_array: ARRAY[52] OF STRING[50]

  change_array:ARRAY[1] OF BOOLEAN

  inact_array:ARRAY[1] OF BOOLEAN

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

  i: INTEGER

  n:INTEGER

  c:INTEGER

  dig: ARRAY[2] OF INTEGER

BEGIN

  i = 1

  n = 0

  c = 0

 

  FOR i = 1 TO 52 DO

   c =i DIV 2 --quotient

   n = i MOD 2 -- remainder

   IF i < 15 THEN

--Set       $CUSTOMEMNU[1]-[7] .

      c = c + n

      IF (n = 1) THEN

         --CHR() is the character code. CHR(48) is the number 0 , and CHR(49) is the number 1.

         --Continuing in order, CHR(57) is 9. Convert these numbers into a string using CHR .

         --We handle it.

         value_array[i] ='[*system*]$custommenu[' + CHR(48 + c ) +'].$title'

      ELSE

         value_array[i] ='[*system*]$custommenu[' + CHR(48 + c ) +'].$prog_name'

      ENDIF

   ELSE

--Set       $CUSTOMMENU[10]-[28] .

      c = c + n + 2

      dig[1] = c MOD 10

      dig[2] = c DIV 10

      IF (n = 1) THEN

         value_array[i] ='[*system*]$custommenu[' + CHR(48 +dig[2])+ CHR(48 +dig[1]) +'].$title'

      ELSE

         value_array[i] ='[*system*]$custommenu[' + CHR(48 +dig[2])+ CHR(48 +dig[1]) +'].$prog_name'

      ENDIF

   ENDIF

  ENDFOR

 

  def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM('cstm', form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    IF term_char = KY_NEW_MENU THEN

      --If a request to display a separate screen occurs, exit the loop

      --Go to the Utility Tips screen

      FORCE_SPMENU(device_stat,SPI_TPHINTS,1)

      exit_menu = TRUE

    else

     

    ENDIF

  UNTIL exit_menu

END cs_set

8                                  Advanced KAREL Creation

8.1                             Operation using function keys

This section explains how to display the screen using function keys and how to process them. For the sake of explanation, only the Japanese dictionary file will be described. If necessary, create dictionary files for the English and Kana dictionaries in the same way.

 

8.1.1                      Displaying the pull-up menu

This section describes how to display the pull-up menu.

Create the following dictionary file ( advckanj.ftx ) and KAREL program ( advcsmpl.kl ).

advckanj.ftx

.kl advckn

.form

$-,form1

&home &reverse ' Application sample screen ' &standard &new_line

' Application sample label ' &new_line

@3,5 "Integer: " @3,23"-%10d(1,123456)" &new_line

@4,5"Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC):' @6,23"-%12pk(2)" &new_line

@7,5"DIN[1]" @7,23"-%7P(io_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"Sample" &new_line

" F3" &new_line

" F4 " &new_line

" Help " &new_line

$-, form1_help * help text

' Help Line 1' &new_line

' Help Line 2' &new_line

' Help line 3' &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

 

$-,f2_menu

'F2- item 1'

$-

'F2- item 2'

$-

'F2- item 3'

$-

"\a"

  

advcsmple.kl

PROGRAM advcsmpl

%SYSTEM

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%INCLUDE klevkmsk

%INCLUDE klevkeys

%INCLUDE advckn

 

VAR

  l_status: INTEGER

  value_array: ARRAY[5] OF STRING[30]

  change_array:ARRAY[1] OF BOOLEAN

  inact_array:ARRAY[1] OF BOOLEAN

  test_int: INTEGER

  test_real:REAL

  prog_name1:STRING[40]

  prog_name2:STRING[40]

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

  p_term_char: INTEGER

  p_def_item: INTEGER

 

BEGIN

  test_int = 12345

  test_real = 12.345

  value_array[1] = 'test_int' --The first data item %10d is the integer variable test_int

  value_array[2] = 'test_real' --The second data item %12f is the real variable test_real

  value_array[3] = 'prog_name1' -- The third data item %12pk is the string variable prog_name1

  value_array[4] = 'prog_name2' -- The fourth data item %12pk is the string variable prog_name2

  value_array[5] = 'DIN[1]' -- The fifth data item, %7P, is a BOOLEAN . Display DI[1] .

  def_item = 1

  p_def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM('advc', form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    SELECT term_char OF

      CASE(KY_NEW_MENU):

        exit_menu = TRUE

      CASE(KY_F2):

        DISCTRL_PLMN('advc', f2_menu, 2, p_def_item, p_term_char, l_status)

    ELSE:

    ENDSELECT

  UNTIL exit_menu

END advcsmpl

For details on the DISCTRL_PLMN built-in function used in KAREL , please refer to Appendix A of the KAREL Reference Manual (B-83144JA-1) . This built-in function creates a pull-up menu and controls cursor movement and selection from the menu.

DISCTRL_PLMN(dict_name, element_no, ftn_key_no, def_item, term_char, status)

Input/Output parameters :

[in] dict_name :STRING

[in] element_no : INTEGER

[in] ftn_key_num : INTEGER

[in,out] def_item : INTEGER

[out] term_char : INTEGER

[out] status : INTEGER

 

The menu data in the dictionary consists of a list of enumerated values. The data is displayed and selected in a pull-up menu on the teaching pendant. There can be a maximum of nine items. Each value is a string of up to 12 characters.

The sequence of consecutive dictionary elements starting with element_no defines the value. Each value must be a separate element. It must not end with &new_line . Each string is assigned a value from 1 to 9 in order. The last dictionary element must be "\a" .

dict_name is the name of the dictionary containing the menu data.

element_no is the dictionary element of the first item.

ftn_key_num The function key that displays the pull-up menu.

def_item is the item to initially highlight when entering the menu. 1 specifies the first item. On return, def_item is the item that was highlighted when the exit character was pressed.

The code that indicates the character that ends input is entered in term_char . The key code that ends the input is stored in the include file

 

FROM: defined in klevkeys.kl. Usually the keys printed are the following predefined constants:

ky_enter —An item was selected.

ky_prev — No item selected

ky_new_menu —A new menu display was requested.

ky_f1

ky_f2

ky_f3

ky_f4

ky_f5

 

status is the status of the operation. If non -zero , an error occurred.

 

First, build the dictionary file advckanj.ftx . Next, build advcsmpl.kl . Then run the generated advcsmpl.pc .

You will see the following screen:



Now press the F2 [Sample] key.

The screen will change to the following screen. Because noclear is not specified in the format for Form , the entire screen is cleared and only the contents of the dictionary for the F2 key are displayed. Only the f2_menu part of the advckanj.ftx file is displayed.



Press the PREV key to return to the application sample screen.

 

advckanj.ftx

.kl advckn

.form noclear * Specify noclear

$-,form1

&home &reverse ' Application sample screen ' &standard &new_line

' Application sample label ' &new_line

@3,5 "Integer: " @3,23"-%10d(1,123456)" &new_line

@4,5"Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC):' @6,23"-%12pk(2)" &new_line

@7,5"DIN[1]" @7,23"-%7P(io_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"Sample" &new_line

" F3" &new_line

" F4 " &new_line

" Help " &new_line

$-, form1_help * help text

' Help Line 1' &new_line

' Help Line 2' &new_line

' Help line 3' &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

 

$-,f2_menu

'F2- item 1'

$-

'F2- item 2'

$-

'F2- item 3'

$-

"\a"

  

 

Specify noclear next to .form as shown above . This will prevent the screen from being automatically cleared when displaying function key menus, etc. This means that you will need to clear the screen manually, and if you do not do so manually, the characters that were displayed before switching screens may remain displayed. This is not garbled text on the screen, so please be careful when specifying noclear .

 

The maximum number of elements that can be displayed when a function key is selected is 9. In the above example, the number of F2- items can be increased from 1 to 9. Each element is a string of up to 12 characters. For details , see Appendix A of the KAREL Reference Manual (B-83144JA-1) ( described in the DISCTRL_PLMN built-in function section).



 

If you specify noclear , the screen will not be cleared as shown above, and the function key items will be displayed.

 

8.1.2                      Processing when a menu is selected from a pull-up menu

Here, we will explain how to create a process when F2[Sample] – “F2- Item 1” is selected in the above example. We will explain using an example that displays a message after selection.



 

To display the messages, update the dictionary file and modify the KAREL program.

advckanj.ftx

.kl advckn

.form noclear

$-,form1

&home &reverse ' Application sample screen ' &standard &new_line

' Application sample label ' &new_line

@3,5 "Integer: " @3,23"-%10d(1,123456)" &new_line

@4,5"Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC):' @6,23"-%12pk(2)" &new_line

@7,5"DIN[1]" @7,23"-%7P(io_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"Sample" &new_line

" F3" &new_line

" F4 " &new_line

" Help " &new_line

$-, form1_help * help text

' Help Line 1' &new_line

' Help Line 2' &new_line

' Help line 3' &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

 

$-,f2_menu

'F2- item 1'

$-

'F2- item 2'

$-

'F2- item 3'

$-

"\a"

 

$-, f2_item1

'F2 - Item 1 selected. '

  

advcsmple.kl

PROGRAM advcsmpl

%SYSTEM

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%ENVIRONMENT UIF

%INCLUDE klevkmsk -- Key masks

%INCLUDE klevkeys -- Special keys

%INCLUDE klevccdf -- Character codes

%INCLUDE advckn

 

CONST

  DICT_NAME = 'ADVC'

 

VAR

  l_status: INTEGER

  value_array: ARRAY[5] OF STRING[30]

  change_array:ARRAY[1] OF BOOLEAN

  inact_array:ARRAY[1] OF BOOLEAN

  test_int: INTEGER

  test_real:REAL

  prog_name1:STRING[40]

  prog_name2:STRING[40]

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

  p_term_char: INTEGER

  p_def_item: INTEGER

  prmpt_win : FILE

 

BEGIN

  OPEN FILE prmpt_win('RW', 'WD:prmp/tpkb')

 

  test_int = 12345

  test_real = 12.345

  value_array[1] = 'test_int' --The first data item %10d is the integer variable test_int

  value_array[2] = 'test_real' --The second data item %12f is the real variable test_real

  value_array[3] = 'prog_name1' -- The third data item %12pk is the string variable prog_name1

  value_array[4] = 'prog_name2' -- The fourth data item %12pk is the string variable prog_name2

  value_array[5] = 'DIN[1]' -- The fifth data item, %7P, is a BOOLEAN . Display DI[1] .

  def_item = 1

  p_def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM(DICT_NAME, form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    SELECT term_char OF

      CASE(KY_NEW_MENU): --If there is a request to display a separate screen, exit the loop.

        exit_menu = TRUE

      CASE(KY_F2):

--Use the DISCTRL_PLMN built-in function to display a menu on a function key.

        DISCTRL_PLMN(DICT_NAME, f2_menu, 2, p_def_item, p_term_char, l_status)

        SELECT p_def_item OF

          CASE(KY_NEW_MENU): exit_menu = TRUE --If a request to display a separate screen is made, the loop will be exited.　　

          CASE(1): --Select item 1.　

          WRITE prmpt_win(CHR(cc_clear_win)) – Clears the prompt line.　

          WRITE_DICT(prmpt_win, DICT_NAME, f2_item1, l_status) – displays the dictionary file on the prompt line.　

        ELSE:

        ENDSELECT

         

    ELSE:

    ENDSELECT

  UNTIL exit_menu

  CLOSE FILE prmpt_win

END advcsmpl

  

 

In this example, to display a message on the prompt line, a file type variable named prmpt_win is defined, the prompt line is cleared, and then the message defined in the dictionary file is displayed.

 

For details about the WRITE_DICT built-in function, see Appendix A of the KAREL Reference Manual (B-83144JA-1) . The following is an overview.

WRITE_DICT(file_var, dict_name, element_no, status)

Input/Output parameters :

[in] file_var :FILE

[in] dict_name :STRING

[in] element_no : INTEGER

[out] status : INTEGER

detail :

file_var must be open in the window in which the dictionary text is to be displayed.

dict_name specifies the element number to write.

element_no specifies the element number to write in. This number is specified with a $ in the dictionary file .

status is the status of the operation. If it is non -zero , an error occurred while writing the element from the dictionary file.

 

When creating a KAREL program, you can use the WRITE_DICT built-in function in advance where necessary to debug efficiently and alert the operator.

 

8.1.3                      Displaying submenus

Just as you can create a pull-up menu, you can also create a submenu. The following screen is an example of what will be displayed when you select F3 [Submenu] .



A pull-up menu can only have a maximum of nine items, but by using submenus you can display up to 35 items (the example above shows 12 items) .

To create a submenu, use the DISCTRL_SBMN built-in function instead of the DISCTRL_CTRL built-in function. For details on DISCTRL_SBMN , see Appendix A of the KAREL Reference Manual (B-83144JA-1) . The following is an overview.

 

DISCTRL_SBMN(dict_name, element_no, def_item, term_char, status)

 

Input/Output parameters :

[in] dict_name :STRING

[in] element_no : INTEGER

[in,out] def_item : INTEGER

[out] term_char : INTEGER

[out] status : INTEGER

The menu data in the dictionary consists of an enumerated list of values. The data is displayed and selected in the 'subm' subwindow on the teach pendant. Up to 35 values ​​can be displayed in 5 pages of subwindows. Each value is a string of up to 16 characters. If using 4 or fewer values, each string can be up to 40 characters long.

A series of consecutive dictionary elements starting with element_no defines the value. Each value must be a separate element. It must not end with &new_line . Each string is assigned a value 1-35 in order. The last dictionary element must be "" .

dict_name is the name of the dictionary containing the menu data.

element_no is the dictionary element of the first item.

def_item is the item to initially highlight when entering the menu. 1 specifies the first item. On return, def_item is the item that was highlighted when the exit character was pressed.

The code indicating the character that terminated input is entered in term_char . The key code that is the termination condition is defined in the include file klevkeys.kl . The keys that are usually output are the following predefined constants.

ky_enter —An item was selected.

ky_prev — No item selected

ky_new_menu —A new menu display was requested.

ky_f1

ky_f2

ky_f3

ky_f4

ky_f5

status is the status of the operation. If it is non -zero then an error occurred.

 

You can create the example screen by modifying the dictionary file and KAREL as follows:

advckanj.ftx

.kl advckn

.form noclear

$-,form1

&home &reverse ' Application sample screen ' &standard &new_line

' Application sample label ' &new_line

@3,5 "Integer: " @3,23"-%10d(1,123456)" &new_line

@4,5"Real: " @4,23"-%12f" &new_line

@5,5'Program ( TP):' @5,23 "-%12pk(1)" &new_line

@6,5'Program ( PC):' @6,23"-%12pk(2)" &new_line

@7,5"DIN[1]" @7,23"-%7P(io_c)" &new_line

^form1_fkey * specifies element which contains

* function key labels

?form1_help * element which contains help

.endform

$-,form1_fkey * function key labels

"" &new_line

"Sample" &new_line

"Submenu" &new_line

" F4 " &new_line

" Help " &new_line

$-, form1_help * help text

' Help Line 1' &new_line

' Help Line 2' &new_line

' Help line 3' &new_line

* You can have a maximum of 48 help lines

$-, io_c

" Off " &new_line

" On "

 

$-,f2_menu

'F2- item 1'

$-

'F2- item 2'

$-

'F2- item 3'

$-

"\a"

 

$-, f2_item1

'F2 - Item 1 selected. '

 

$-, f3_submn

' Submenu 1 '

$-

' Submenu 2'

$-

' Submenu 3'

$-

' Submenu 4'

$-

' Submenu 5'

$-

' Submenu 6'

$-

' Submenu 7'

$-

' Submenu 8'

$-

' Submenu 9'

$-

' Submenu 10'

$-

' Submenu 11'

$-

' Submenu 12'

$-

"\a"

  

 

advcsmpl.kl

PROGRAM advcsmpl

%SYSTEM

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND

%NOABORT = ERROR + COMMAND + TPENABLE

%NOBUSYLAMP

%ENVIRONMENT UIF

 

%INCLUDE klevkmsk -- Key masks

%INCLUDE klevkeys -- Special keys

%INCLUDE klevccdf -- Character codes

%INCLUDE advckn

 

CONST

  DICT_NAME = 'ADVC'

 

VAR

  l_status: INTEGER

  value_array: ARRAY[5] OF STRING[30]

  change_array:ARRAY[1] OF BOOLEAN

  inact_array:ARRAY[1] OF BOOLEAN

  test_int: INTEGER

  test_real:REAL

  prog_name1:STRING[40]

  prog_name2:STRING[40]

  def_item : INTEGER

  term_mask: INTEGER

  term_char: INTEGER

  exit_menu:BOOLEAN

  device_stat:INTEGER

  p_term_char: INTEGER

  p_def_item: INTEGER

  prmpt_win : FILE

 

BEGIN

  OPEN FILE prmpt_win('RW', 'WD:prmp/tpkb')

 

  test_int = 12345

  test_real = 12.345

  value_array[1] = 'test_int' --The first data item %10d is the integer variable test_int

  value_array[2] = 'test_real' --The second data item %12f is the real variable test_real

  value_array[3] = 'prog_name1' -- The third data item %12pk is the string variable prog_name1

  value_array[4] = 'prog_name2' -- The fourth data item %12pk is the string variable prog_name2

  value_array[5] = 'DIN[1]' -- The fifth data item, %7P, is a BOOLEAN . Display DI[1] .

  def_item = 1

  p_def_item = 1

  term_mask = kc_func_key

  -- Force display of user 2

  FORCE_SPMENU(device_stat, SPI_TPUSER2, 1)

  exit_menu = FALSE

  REPEAT  

    --Display and wait for key input

    DISCTRL_FORM(DICT_NAME, form1, value_array, inact_array, change_array,

                 term_mask, def_item, term_char, l_status)

    SELECT term_char OF

      CASE(KY_NEW_MENU):

        exit_menu = TRUE

      CASE(KY_F2):

　　　　--Create a pull-up menu.

        DISCTRL_PLMN(DICT_NAME, f2_menu, 2, p_def_item, p_term_char, l_status)

        SELECT p_def_item OF

　　　　　--The number of the selected item is assigned to p_def_item . When the pull-up menu is displayed,

--If you switch to the screen, KY_NEW_MENU will be assigned to p_def_item .

          CASE(KY_NEW_MENU): exit_menu = TRUE

          CASE(1):

          WRITE prmpt_win(CHR(cc_clear_win))

          WRITE_DICT(prmpt_win, DICT_NAME, f2_item1, l_status)

        ELSE:

        ENDSELECT

      CASE(KY_F3):

--When you press the         F3 key, the submenu will be displayed.

        p_def_item = 1

        DISCTRL_SBMN(DICT_NAME, f3_submn, p_def_item, p_term_char, l_status)

    ELSE:

    ENDSELECT

 

  UNTIL exit_menu

 

  CLOSE FILE prmpt_win

END advcsmpl

9                                  How to debug KAREL programs

To debug a KAREL program, use the following techniques:

 

l        Display using the WRITE statement

l        Check KAREL variables

l        Single Step

 

Insert the WRITE statement where you want to check the processing of the KAREL program. When you execute the WRITE statement, the specified data is displayed on the user screen of the teaching operation panel, so you can check the operation of the KAREL program.

 

Note

WRITE statements take time to process, which slows down the processing speed of your KAREL program. After debugging is complete, you must remove the WRITE statements before using them in production.

 

The values ​​of KAREL 's global variables can be checked on the KAREL Variables screen. Select the KAREL program that declares the global variable you want to see, and then select Karel Variables or Karel Position Variables with F1 [ Game ] on the Data screen to display the global variables.

 

9.1                             Displaying with the WRITE Statement

9.1.1                      Example of displaying the value of a variable on the user screen

Here is an example of how to display the value of the variable add on the user screen by inserting the following :

WRITE TPDISPLAY(CHR(cc_clear_win),CHR(cc_home))

WRITE TPDISPLAY('add is ',add,CR)

-------------------------------------------------- -----------------------------

PROGRAM sample

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

%INCLUDE klevccdf

CONST

  START_NUM = 1

  FINISH_NUM = 10

VAR

  STATUS : INTEGER

  result : INTEGER

-------------------------------------------------- -----------------------------

ROUTINE sum( from_num: INTEGER; to_num:INTEGER) : INTEGER

-------------------------------------------------- -----------------------------

VAR

  idx : INTEGER

  add : INTEGER

BEGIN

  idx = 0

  add = 0

  FOR idx = from_num TO to_num DO

    add = add + idx

  ENDFOR

  WRITE TPDISPLAY(CHR(cc_clear_win),CHR(cc_home)) – Clears the user screen.

  WRITE TPDISPLAY('add is ',add,CR) – Displays the value of add on the user screen .

  RETURN(add)

END sum

-------------------------------------------------- -----------------------------

BEGIN

-------------------------------------------------- -----------------------------

  result = sum( START_NUM, FINISH_NUM)

  SET_INT_REG(1,result,STATUS)

 

END sample

  

 

After running this program, if you switch to the user screen (select Screen Selection → User), the following will be displayed.



 

By specifying TPDISPLAY after WRITE , it means to output to the user screen.

WRITE TPDISPLAY(CHR(cc_clear_win),CHR(cc_home)) clears the user screen.

In WRITE TPDISPLAY('add is ',add,CR), CR means a line break.

 

9.1.2                      Example of output to a specified file

-------------------------------------------------- -----------------------------

PROGRAM sample

-------------------------------------------------- -----------------------------

%NOBUSYLAMP

%NOLOCKGROUP

%NOPAUSE = ERROR + COMMAND + TPENABLE

%NOABORT = ERROR + COMMAND

%INCLUDE klevccdf

CONST

  START_NUM = 1

  FINISH_NUM = 10

VAR

  STATUS : INTEGER

  result : INTEGER

  debug:FILE – Add a file variable

-------------------------------------------------- -----------------------------

ROUTINE sum( from_num: INTEGER; to_num:INTEGER) : INTEGER

-------------------------------------------------- -----------------------------

VAR

  idx : INTEGER

  add : INTEGER

BEGIN

  idx = 0

  add = 0

  FOR idx = from_num TO to_num DO

    add = add + idx

  ENDFOR

  WRITE debug('add is ', add, CR) -- Outputs the contents of the variable add to MC:\debug.txt.

  RETURN(add)

END sum

-------------------------------------------------- -----------------------------

BEGIN

-------------------------------------------------- -----------------------------

  OPEN FILE debug('RW','MC:\debug.txt') – Opens the file MC:\debug.txt in write mode ( RW ).

 

  result = sum( START_NUM, FINISH_NUM)

  SET_INT_REG(1,result,STATUS)

 

  CLOSE FILE debug – Close a file

 

END sample

  

 

Define a file variable ( debug in this example ). Open the file in write mode and use the WRITE statement to output data to the file. Finally, close the file. "add is 55" is output to MC:\debug.txt .

 

9.2                             Checking KAREL variables

Run the KAREL ( sample.kl ) used in the previous section . Display the data screen ( press the data key on the TP , or select screen → 0— Next— → Select data). Press F1 [ Screen ] and select the Karel variable. The Karel variable will be displayed as shown in the following example.



Only global variables can be viewed from the data screen. Local variables (variables defined within a routine) are not displayed.

 

9.3                             Single-step verification

If you do not specify the system program attribute with %SYSTEM , single stepping will be enabled for KAREL programs . You can fix bugs by executing the instructions of a KAREL program line by line in single stepping, checking the values ​​of the KAREL variables listed above, and checking the display of WRITE statements. To enable single stepping, set the single step state for each instruction on the Screen Selection → Test Execution screen (below is a display example).



 

Select a KAREL file (e.g. sample.pc ) from the list screen and execute it in single step. It will pause at each instruction in the KAREL program. You can see the execution status while checking the changes in the system variables on the data screen each time.

Example: You can see how KAREL variables change

　　→　　

 

 

9.4                             How to check the execution status of a KAREL program

It is possible to check the execution status ofKARELusing i Pendant

Select Screen → 0 -- Next-- → Internet. Select " ROBOT " in the center of the screen.



Select the program state.



 

You can check the execution status of the program.

 



 

You can check the status by scrolling down this screen.

Use Shift + ↓ to scroll one screen at a time.  

 10                     KAREL Utilization Support Function

This section explains the KAREL utilization support function (option J971 ).

 

10.1                     Functionality Overview

It provides an interface for executing and terminating KAREL , outputting status, etc. The following operations are possible:

-　Running and forcibly terminating the KAREL program.

- Automatically run KAREL programs after power-on .

- Periodically monitor the status of the KAREL program and output the status to DO .

- Setting up custom menus.

 

10.2                     KAREL program settings screen

10.2.1                Launching the KAREL settings screen

Select Screen – Settings – KAREL Settings.

 



 

The following screen will be displayed.

 



 

 

10.2.2 How to register                the KAREL program

Press the F4 [ SELECT ] key to display the KARELs that can be registered on the KAREL program setting screen .



 

Here we will explain the selection example of C1 . Move the cursor to C1 and press the enter key.



 

In this example, the status is displayed as "Finished", but it may be " ********* ", which does not correspond to any of the following states: Running, Paused, or Finished.

Comments are displayed when %COMMENT is included in the selected KAREL source file .

 

10.2.3                How to run

Place the cursor on C1 ( KAREL to execute ) and press F2 [ Operation ] .



Place the cursor on "1.   Execute" and press the enter key. A confirmation message will appear asking if you want to execute.



 

If you select F4 [ Yes ] here , C1 will be executed.



 

10.2.4                Forced Termination Method

Place the cursor on C1 ( KAREL to execute ) and press F2 [ Force Quit ] .



Place the cursor on "2.   Force Quit" and press the enter key.

A confirmation message will appear asking if you want to force quit.



 

Select F4 [ Yes ] .



 

10.2.5                Setting the startup method

Move the cursor to the "Method" column. F4 [ Automatic ] and F5 [ Manual ] are displayed.



 

By default it is set to Manual, if you select Automatic it will run automatically when you power cycle the control unit.



 

There is a limit to the number of KAREL programs that can be run automatically . The maximum number of KAREL programs that can be run simultaneously varies depending on the system configuration. If the maximum number of programs that can be run simultaneously is reached, the alarm "PROG -014 Too many programs running" will be displayed.

You can increase the number of programs that can be run by increasing the number of tasks in the maximum number setting screen of the control start menu. The number that can be increased depends on the system configuration you are using. Please refer to the manual of each tool for the maximum number setting screen.

Maximum number setting screen



 

10.2.6                About the Details Screen

Press F3 [ Details ] .



 

You will see the following screen:



 

Explanation of each item on the details screen

item 

explanation 

Initial Value 

Alarm output when stopped 

If enabled, a warning will be output when the specified program ( C1 in the above example ) is paused or terminated. 

invalid 

Startup Settings 

When you try to run KAREL , you can choose to start it from the beginning or from the middle. If you select " Start from the beginning " , the specified program will be terminated first, and then executed. If you select "Start from the middle", if the program is paused, it will be executed from the point where it was paused (without being terminated first). 

Start from the beginning 

Start DI 

The specified program is started when the rising or falling edge of the specified DI is detected. If the start DI is enabled, DI[] and rising and falling edges cannot be selected. When setting the start DI , be sure to disable it before setting the DI and rising and falling edges (hereafter referred to as DI , etc.). After setting the DI, etc., enable the start DI . The setting will take effect after the control device is powered off and on. 

invalid 

End DI 

When the rising or falling edge of the specified DI is detected, the specified program is forcibly terminated. The setting method is the same as for the startup DI above. 

invalid 

Status Output 

It monitors the status of the specified program at regular intervals and outputs the status using two DOs . The default setting is to monitor every 100 msec . The setting becomes effective after the power is turned off and on. 

invalid 

 

A configuration example is shown below.



 

In this example, while program C1 is running, DO[1] and DO[2] are on. While it is paused, DO[1] is on and DO[2] is off. When it finishes, DO[1] is off and DO[2] is on.

 

Selecting F2 [ Previous ] will take you to the details screen for the previous number. In the above example ( No. 1 ) , you will be taken to the details screen for No. 30 .

Selecting F3 [ Next ] will take you to the details screen for the next number. In the above example ( No. 1 ) , you will be taken to the details screen for No. 2 .

 

10.2.6.1          Notes and Restrictions on the Details Screen

- The status output monitors the specified program at regular intervals. Therefore, the DO output does not change immediately after the program status changes. For example, if the program changes from running to paused to finished within one cycle, the next cycle of monitoring will not detect the pause, but only the finished state.

- It is possible to change the monitoring period for status output. Change the value of the system variable $KRL_NUM.$UPDT_TIME . It can be changed between 8 and 5000 msec . If a value outside this range is specified, it will be changed to 8 msec when the power is turned on if a value of 8 msec or less is set, and if a value of 5000 msec or more is specified, it will be changed to 5000 msec .

・ In the above example, after configuring the details of C1 , use the back key to return to the list screen ( KAREL program setting screen). If you change the program to be registered in No.1 from C1 to a different program ( let's say C2 ), turning on DI[1] will not start C1 . Instead, it will start C2 . To prevent erroneous operation, do not change the program on the list screen if you have configured the details. 

10.2.7                About Restart

You can restart the control unit from either the KAREL program setting screen or the details screen.



 



 

Press the Next Page key to switch the display to F2 [ Restart ] . Enable TP and then select F2 [ Restart ] .



 

Select F4 [ Yes ] to reboot the control unit.

 

10.3                     Custom Menus

You can register KAREL programs in the menu.

10.3.1                Launching a custom menu

Select Screen Selection – Settings – Custom Menu.



 

The following screen will be displayed.



 

10.3.2                Custom menu settings

Press F4 [ Select ] .



Select the item to add to the menu. Here, we will use Auxiliary -1 as an example.



 

Place the cursor on the program column and press F4 [ Select ] . Select C1 as an example.



 

Next, move the cursor to the title column and press the enter key. For example, enter C1 .

 



 

Press the auxiliary key. Select 0— Next-- → 0　–Next– and confirm that it displays C1 .



 

Similarly, it is possible to set up custom menus.

 

10.3.3                Clearing the settings

To erase the settings, press F2 [ Erase ] . A confirmation message will appear asking, "Are you sure you want to delete the program and title?"



 

Select F4 [ Yes ] .

The programme and title you have set will be deleted.



 

Select the Utilities menu and verify that C1 is no longer visible.

1                     KAREL program execution history recording function

11.1                     Functionality Overview

The KAREL program execution history logging feature is a tool for diagnosing problems in user applications or the controller's system software. This option generates a log that shows details about events, including the order in which the events occurred.

This option allows you to log events that occur during the execution of KAREL and TP programs. It is also possible to generate an ASCII file that contains some or all of the logged data. The ASCII file contains detailed information about each logged event.

For example, you can log the following types of events:

• Start of execution of a KAREL statement or a line in a TP program

•      Routine call, return

•      Internal system events to diagnose system software problems

        For more details, please refer to the following information.

•      For hardware and software, see 11.2 .

•      See 11.3 for installation and configuration .

•      Regarding events, see 11.4 .

• For examples of programming KAREL,TP programs and formatting ASCII files, see 11.5 .

 

11.2                     Hardware and Software

11.2.1                Hardware and Software Requirements

Before using the KAREL program execution history recording function, you must meet the hardware and software requirements.

Note

      The hardware requirements in this section apply to all robot models.

 

11.2.1.1          Hardware

The KAREL program execution history recording function requires the following hardware for all robot models.

•      FANUC robot control device

•      Teaching operation panel

•      42000bytes of temporary memory

•      18000bytes of CMOS memory

•      30000byte FROM​

 

11.2.1.2          Software

The KAREL program execution history recording function can be installed on control devices with software from the 7da5 series onwards.

A series of Teach Panel screens are used to control the logging of diagnostic information. The Teach Panel screens allow you to:

•      Specify the types of events to record

•      Specifying the task for which the event will be logged

Generate an ASCII file containing the logs     

 

11.2.2                Performance

The KAREL program execution history recording function may affect system performance.

•      This option reduces the execution speed of KAREL and TP program logic by approximately 1% to 2% .

Note

      You can eliminate this degradation by selecting "Disable Logging" in the main menu.

 

For more information regarding system performance, see 11.3.8 .

•      The actual event recording takes 0.08msec per recorded event.

•      Execution of the action is not affected.

 

11.3                     Setup and Operation

11.3.1 Setting up                the KAREL program execution history recording function

Before you can record information and write log files, you need to configure the KAREL program execution history recording feature. This chapter describes how to configure the KAREL program execution history recording feature, and provides detailed configuration instructions for each setting screen.

Use the following screens to control diagnostic logging.

•      “Clear Event Log” removes all data from the log.

•      "Output log data" allows you to write the log data to an ASCII file, see 11.3.2 . 

•      Add a task to log events. See 11.3.3 . 

•      "Stop logging a task" allows you to select and remove a task from the list of currently logged tasks, see 11.3.4 . 

•      “Selected Task List” displays the list of tasks you have selected to log, see 11.3.5 . 

•      Log Class Settings allows you to select / deselect classes or groups of event types to log, see 11.3.6 . 

•      Change which events are logged allows you to select / deselect which types of events are logged, see 11.3.7 . 

•      Enable / Disable Logging allows you to start or stop all logging, see 11.3.8 . 

For example, the following types of events can be logged: 

• Start of execution of a KAREL statement or a line in a TP program

•      Routine call, return 

•      Internal system events to diagnose system software problems 

 

11.3.2                Output method selection screen

You can select the range of records to be output on the output method selection screen. If the log is currently empty, an error message will be displayed. Please output the records to the log file using operation 11-1 .

 

Operation 11-1 Output records to the debug log

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.     Select Debug Controls. The following screen will appear.

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     The number of records in each range selected for log data output will be displayed on the screen. See the screen below for an example.

Diagnostic logs

    Selecting the output method

 

       All log data

          (   500  records output )

       Since last power-on

          ( Output     5  records )

       Before last power-on

          (   500  records output )

       Resetting the file number

       Export file to RD:

       Output the file to UD1:

       Export file to MC:

 

6.     Select the data range to dump or log.

•      To request a dump of all event information currently in the log, select All Log Data.

•      To request a dump of all event information since the most recent power-on, select Since Last Power-On.

•      To request a dump of all event information between the last two power-ups, select Before Last Power-Up.

This logs all events prior to the last power loss.

        The information is output to an ASCII file.

Note

      By default, log files are written sequentially as MC:PGDBG201.DT, MC:PGDBG202.DT , etc.

 

7.     Select Reset File Numbers to reset the file naming convention numbers . The first is MC:PGDBG201.DT .

8.     To change the default storage device to RamDisk , select Output files to RD :. Now all files will be saved to the RAM disk .

9.     To change the default save device to UD1:, select Output files to UD1 :. All files will now be saved to UD1 :.

10.   To change the default save device to memory card, select Output files to MC :. All files will now be saved to memory card.

 

11.3.3                Task Selection Screen

You can add a task by selecting the task you want to log information for on the task selection screen. Select the task you want to log using operation 11-2 .

 

Step 11-2 Selecting the task to log

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.     Select Debug Controls. The following screen will appear.

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select Add a task to log. The following screen will appear.

Diagnostic logs

    Selecting a Task                    1/1

 

 

Use [ Select ] to select the task you want to add

If not, please press the back button.

 

6.     Press F4 [ Select ] to display a list of tasks to select from . The following screen will be displayed.

Note

      Selecting a program means that events will be logged for tasks that have the selected program as their MAIN program.

 

1 PRG001 5 SUB0012

 2 PRG002 6 SUB0013

 3 PRG003 7 SUB0021

 4 SUB0011

Shindan Log

     Task Selection

7.     Use the arrow keys to select the task for which you want to log events.

8.     Once you have selected the task, press the enter key. The following screen will appear.

Diagnostic logs

    Selecting a Task                    1/1

 

 

Use [ Select ] to select the task you want to add

If not, please press the back button.

 

 

 

                             PROG003

 

9.     Press F3 [OK] to request the log of the displayed task .

Note

Do not press Prev, F1 [ Screen ] or any other key to exit the screen before pressing       F3 , otherwise the selected task will not be logged. 

 

11.3.4                Log Stop Screen

On the Stop Logging screen, you can select a task from the list of currently logged tasks and delete it. Stop logging the task using step 11-3 .

 

Step 11-3 Stopping task logging

procedure

1.     Press the screen selection key.

2.     Select Test Run.

3. Press F1 [ Screen ] .

4.     Select Debug Controls. The following screen will appear:

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select Stop logging the task. The following screen will appear.

    Log Stop                      1/1

 

 

Use [ Select ] to select tasks you do not want to record

If not, please press the back button.

 

6.     Press F4 [ Select ] to display a list of tasks to select from . The following screen will be displayed.

Note

      If you select a program, events will no longer be logged for tasks that have the selected program as their MAIN program.

 

1 PRG001 5 SUB0012

 2 PRG002 6 SUB0013

 3 PRG003 7 SUB0021

 4 SUB0011

 Shindan Log

     Logno Teaching

 

7.     Use the arrow keys to select the task for which you want to stop logging events.

8.     Once you have selected the task, press the enter key. The following screen will appear.

Diagnostic Log Stop Logging 1/1 Use [ Select ] to select the tasks you do not want to log. If there are none, press Back. PROG003

 

9.     Press F3 [OK] to request that logging stop for the displayed task .

 

Note

Do not press Prev, F1 [ Screen ] or any other key to exit the screen before pressing       F3 , or logging of the selected task will not stop. 

11.3.5                Selected Task List Screen

You can view the currently selected tasks that are being logged on the Selected Task List screen. Use operation 11-4 to display the list of selected tasks.

 

Step 11-4 Displaying a list of selected tasks

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.         Select Debug Controls. The following screen will appear.

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select the selected task list. The following screen will be displayed.

   Currently selected task         1/1

 

 PRG003

 PRG001

 

        This screen displays the currently selected task for which logging is being performed.

6.     Press Back to return to the main menu.

 

11.3.6                Event class selection screen

The Event Class Selection screen allows you to determine which classes of events should be logged ( step 11-5) . Each event class enables / disables one or more detailed event types . Below is a list of event classes and their associated event types. See 11.4.2 for more information about event types that can be logged .

 

Note

      An asterisk ( * ) indicates that the log is for internal use.

• Executing a line in KAREL

• Executing a line in KAREL

• Executing a line in a TP program

• Executing a TP program line

•      Call / Return

• Routine calls in KAREL/TP programs

• Return of routines in KAREL/TPP programs

•      Operation *

•      Start of operation *

•      Execute action ( first ) (TP programs only )*

•      Request to cancel an action *

•      Request to stop operation *

•      Resuming operation *

• Receive Motion done *

•      Operation completed successfully *

• Receive MMR *

•      Condition Handler *

•      Monitor triggering *

•      Enable Monitor *

•      Disable monitor *

Interrupt      routines

• Before (Interrupt Sub-Routine) processing

• After processing an ISR (Interrupt Sub-Routine)

• Return from an ISR (Interrupt Sub-Routine)

•      Start / End of Task

• Starting a KAREL /TP program task

• KAREL/ TP program task termination

•      Packet reception *

•      Interpreter packet reception

• P- code execution *

• P- code execution begins

• AMR activities *

• AMGR receives Normal AMR

• AMGR receives Start AMR

• AMGR receives Stop AMR

• Sending AMR to AX

• Receive AMR from AX

Use operation 11-5 to enable / disable the event class.

 

Step 11-5 Enabling / Disabling an Event Class

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.     Select Debug Controls. The following screen will appear.

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select the log class settings. The following screen will appear.

    Event Class Selection            1/10

 

Execution of       NO\\KAREL line

      NO TP program line execution

      NO  CALL / RETURN

      NO  OPERATION

      NO  condition handler

      NO  interrupt routine

      NO  Task Start / End

      No  packets received

      NO P Code Execution

6.     Enable / disable classes of events to be logged .

•      To enable logging of a class of events, press F4 [YES] .

•      To disable logging of a class of events, press F5 [No] .

       Changes take effect immediately. The current status of an event, whether it is logged or not, is displayed to the left of the event.

Note

      Specifying an entire class of events will enable / disable logging of all event types in that class.

 

11.3.7                Event Selection

You can enable / disable logging of specific events on the event selection screen . Use operation 11-6 to enable / disable logging of specific events.

 

Step 11-6 Enabling / Disabling a Specific Event

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.     Select Debug Controls. The following screen will appear.

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select Change events to log. The following screen will appear.

   Event Selection                     1/30

 

      NO\\ Controller power on

      NO  LOG ENABLED

Disable       NO  logging

Execution of       NO KAREL lines

      NO KAREL/TP program routine call

      NO KAREL/TP program routine return

      NO  Operation Start

Execute       NO  action first​​

      NO  Action Cancel Request

      NO  Operation stop request

 

6.     Enable / disable specific events .

•      To enable event logging, press F4 [Yes] .

•      To disable event logging, press F5 [No] .

The changes will take effect immediately.

 

11.3.8 Enabling                / Disabling All Event Logs

Enable / Disable Logging starts / stops logging of all selected events. When KAREL program execution history recording is installed, logging of selected events in selected tasks is enabled. Selecting the menu item Disable Logging disables all logging, eliminating the overhead of enabling logging ( see 11.2 ) . Logging can be started again by selecting the menu item Enable Logging.

 

Note

      Event and task selections do not change when you disable logging or enable logging.

Use operation 11-7 to enable / disable logging of all events.

 

Operation 11-7 Enabling / Disabling Logging of All Events

procedure

1.     Press the screen selection key

2.     Select Test Run

3. Press F1 [ Screen ]

4.     Select Debug Controls. The following screen will appear:

Diagnostic logs

    Main Menu

 

       Clearing the Event Log

       Output of log data

       Adding a task to be logged

       Stop logging a task

       Selected Task List

       Setting the log class

       Changing which events are logged

       Enable logging

       Disable logging

 

5.     Select whether to enable or disable logging.

Note

      If either option is selected, a power cycle is required for the change to take effect.

•      Select Enable Logging to automatically start logging the selected events for the selected task after a power cycle.

•      Select Disable Logging to automatically stop logging the selected events for the selected task after a power cycle.

6.     Turn the power back on.

 

conditions

•      All personnel and non-essential equipment should be outside the work cell.

caveat

      If you notice any problems or potential dangers, do not power on the robot. Report it immediately. Powering on a robot that does not pass inspection can result in serious injury.

Visually inspect the robot, controls, work cell, and surrounding area. Ensure that all safety devices are     in place and that the work area is clear during the inspection.

b.    Turn on the breaker .

c.     If the boot monitor screen is displayed on the teaching operation panel, press and hold the SHIFT and RESET keys, or press and hold RESET on the operation panel .

d.    Release all keys.

•      The ON LED on the operation panel will light up, indicating that the robot is powered on .

•      The following screen will be displayed on the teaching operation panel .

Utility Tips   10 %                 

                                       

               HandlingTool            

       V7.5060 7DA5/00     

                                       

                                       

               FANUC LTD               

      FANUC Robotics America, Inc.     

          All Rights Reserved          

          Copyright 2009               

                                       

 

11.4                     Event logging

An event is a condition or situation that occurs during the execution of a KAREL or TP program. The KAREL program execution history logging feature allows you to log certain events as they occur, which can be useful in debugging your programs. Logged events can be dumped to an ASCII file.

 

11.4.1                Setting up events

An event is logged when all of the following are true:

•      Enable logging is selected in the main menu

You have enabled event logging for the task in question .     

•      The event is selected as one of the following:

•      Change which events to log to select specific events

•      Select the class of the event in the Log Class setting

 

Types of events that can be logged

If you have the KAREL program execution history recording function, you can record the following types of events. For details, see 11.4.3.1 .

•      Control device power-on

Enable      logging

Disable      logging

• Executing KAREL lines

• Routine ( program ) calls for KAREL or TP programs

• Return from a routine ( program ) of a KAREL or TP program

•      Monitor triggers

•      Enable monitor

•      Disable monitor

• Before ISR processing

• Return from ISR

• Starting a task in a KAREL/TP program

• KAREL/TP program task termination

•      Interpreter packet reception

• P- code execution begins

• Executing a TP program line

• AMGR receives Normal AMR

• AMGR receives Start AMR

• AMGR receives Stop AMR

• Sending AMR to AX

• Receiving from AMR AX

 

11.4.2                Logging events to an ASCII file

The last 500 logged events can be output to an ASCII file by requesting that the log data be written to a file via Output Log Data ( see 11.3.2 ) .

 

11.4.3                ASCII file: general event information

Information specific to each event is logged to an ASCII file. Table 11.4.3.1 lists the following information for each event:

•      Event Name : A description of the event as it appears on the event selection screen.

•      Recording timing: The condition under which the event is recorded. For example, the START_K_LINE event is recorded just before the execution of the KAREL statement.

•      Information Recorded: A list of values ​​that are recorded with each event. The following items are reported for every event ( exceptions are noted separately ) :

The time ( in seconds ) since the event occurred, relative to power-on .      This is always a multiple of 4 msec (0.004 sec) .

•      The number of the task associated with the event

•      Name of the KAREL routine or TP program at the time of the error

•      The program line number where the error occurred

•      Default Enabled : YES if the event is enabled by default .

•      Comments: If appropriate, further information is provided.

 

11.4.3.1          ASCII files : event-specific information

Table 11.4.3.1 lists each event and the corresponding recording information.

 

Table 11.4.3.1. Event log information

Event name

Recording Timing

What information is recorded?

Default enabled

comment

Control device power on

Every time the control device is turned on

Routine name, line number

YES

  

Time: The time when the power-on occurred is recorded in "DD-MMM-YY HH:MM" format.

The task number is always 1

Enabling logging

When logging was enabled. Typically this is when the task starts.

Standard information only

YES

  

Disable logging

When logging is disabled. Typically, this is when the task finishes.

Standard information only

YES

  

Executing a line in KAREL

Beginning of KAREL statement execution

This is inside information.

NO

  

This is inside information.

This is inside information.

Routine calls in KAREL/TP programs

When a KAREL routine or TP program is called, either by direct invocation or as a result of the action of a condition handler.

Standard information only

NO

The routine name is the name of the routine that was called. The line number is the line where the call was made or the interrupt occurred.

Return of routine in KAREL/TP program

When a return occurs from a KAREL program / routine, TP program to the calling / interrupted program

Standard information only

NO

Routine name is the name of the program / routine that is returning . Line number is where in the calling / interrupted program to return to. This is generally the same as the line number indicated in the CALL event.

Monitor Triggers

When the global monitor triggers

For system-level analysis

NO

For system-level analysis

Enabling the Monitor

When a global monitor is enabled by an ENABLE statement or action.

Monitor Number

NO

For system-level analysis

Disable Monitor

When a global monitor is disabled by a DISABLE statement or action , monitor triggers are not logged.

Monitor Number

NO

For system-level analysis

Before ISR processing

Before the monitor calls the KAREL program

This is inside information.

NO

The routine name and line number indicate the code that was executing when the interrupt request was received.

This is inside information.

This is inside information.

After ISR processing

When the interrupt routine is ready to execute

Standard information only

NO

The routine name is the name of the interrupt routine. The line number is always 1.

Return from KAREL ISR

When exiting an interrupt routine

Standard information only

NO

The routine name and line number are the interrupt routine and line number to be returned.

Starting a KAREL/TP program task

When the task selected for log capture begins execution

Standard information only

YES

The routine name is the main program name. The line number is always 1.

KAREL /TP program task termination

When the task ends

Standard information only

YES

The routine name and line number indicate the last statement executed in the task, which could be the END statement in a KAREL program or the last line in a TP program.

Interpreter receiving packets

When the interpreter receives a packet

Packet address

NO

For system-level analysis

Packet Status

Request code ( including subsystem code )

Requester ID

Interrupt Level

P- code execution begins

KAREL P- code execution started

Number of words on the routine stack

NO

For system-level analysis

Number of words on the data stack

P- Code Mnemonics

Start of execution of TP program line

Start of execution of a line in a TP program

Number of words on the data stack

NO

  

Number of words on the routine stack

Total number of words available in the routine and data stacks

AMGR receives Normal AMR

When AMGR receives AMR

AMR Address

NO

For system-level analysis

AMR Number

AMR AMGR_wk

AMR ax_phase

AMGR receives Start AMR

When the AMGR processes a Start AMR request.

AMR Address

NO

For system-level analysis

AMR Number

AMR AMGR_wk

AMR ax_phase

AMGR receives Stop AMR

When the AMGR processes a stop AMR request.

AMR Address

NO

For system-level analysis

AMR Number

AMR AMGR_wk

AMR ax_phase

Sending AMR to AX

When an AMR is sent from the AMGR to the AX task

AMR Address

NO

For system-level analysis

AMR Number

AMR AMGR_wk

AMR ax_phase

Receive AMR from AX

When the AMR is received back from the AX

AMR Address

NO

For system-level analysis

AMR Number

AMR AMGR_wk

AMR ax_phase

 

11.5                     Appendix

11.5.1                Overview

This appendix contains example programs and log data that show how the KAREL program execution history recording feature works.

• 11.5.2 describes a KAREL program (T) that calls a TP program (TPP) .

• 11.5.3 describes the TP program to be called (TTT) .

• 11.5.4 describes the log file generated after running the KAREL program (T) with the following selection of event classes :

• YES KAREL line execution

• YES Execute lines of TP program

• YES call / return

• YES operation

• YES Condition Handler

• YES interrupt routine

• YES Task start / end

• No packets received

• NO P Code Execution

 

11.5.2                KAREL program example

The KAREL program in Example 11.5.1 is the main program. It is from this program that the TP program is called and executed.

Example 11.5.1 KAREL Program Example (T.KL)

  1 Program T

  2. var

  3 i,j,k: INTEGER

  4

  5 routine ttt from ttt

  6 routine tt

  7. Begin

  8 i = i + 1

  9 end tt

 10

 11 Begin

 12

 13 condition[1]:

 14 when k >= 500 DO

 15k = 0

 16 tt

 17 enable condition[1]

 18 End Condition

 19 k = 0

 20 i = 0

 21 Connect timer to k

 22 enable condition[1]

 23 wait for i=2

 24 Disconnect timer k

 25 disable condition[1]

 26 ttt

 27 DELAY 1000

 28 end t

 

11.5.3                TP Program Example

The TP program in Example 11.5.2 is called from the KAREL program (T) in Example 11.5.1 .

Example 11.5.2 Teach Pendant Program Example (TTT.TP)

   1:JP[1] 100% FINE                  

   2: WAIT 0.00(sec)                

   3: R[1]=0                          

   4: LBL[1]                           

   5: R[1]=R[1]+1                     

   6: IF R[1] <= 3,JMP LBL[1]           

   7: WAIT .50(sec)

 

11.5.4                ASCII File Example

Suppose you enable logging for task T and select the event class shown in section 11.5.1 , then execute T and output the log. The file shown in Example 11.5.3 will be output.

 

Note

      For details of the fields in the ASCII file shown in Example 11.5.3, see 11.4.3.1 .  

 

Example 11.5.3. Example ASCII File

       Event time TID                              routine​         

    POWER-UP .104 1 *** *** 09- 9-28 11:53

  TASK-START 84.888 8 T 1

  LOG-ENABLE 84.888 8 T 1

 STRT-K-LINE 84.888 8 T 13 0 0 19200

 STRT-K-LINE 84.904 8 T 19 0 0 19200

 STRT-K-LINE 84.904 8 T 20 0 0 19200

 STRT-K-LINE 84.904 8 T 21 0 0 19200

 STRT-K-LINE 84.904 8 T 22 0 0 19200

 STRT-K-LINE 84.904 8 T 23 0 0 19200

   CH-ENABLE 84.904 8 T 23 1

  CH-TRIGGER 85.912 8 T 23 1

     PRE-ISR 85.912 8 T 23 0 128 35

        CALL 85.912 8 TT 23

      IN-ISR 85.912 8 TT 1

 STRT-K-LINE 85.912 8 TT 8 0 68 1792

 STRT-K-LINE 85.928 8 TT 9 0 68 1792

      RETURN 85.928 8 TT 23

 RTN-INT-RTN 85.928 8 TT 23

  CH-TRIGGER 86.920 8 T 23 1

     PRE-ISR 86.920 8 T 23 0 128 35

        CALL 86.920 8 TT 23

      IN-ISR 86.920 8 TT 1

 STRT-K-LINE 86.920 8 TT 8 0 68 1792

 STRT-K-LINE 86.936 8 TT 9 0 68 1792

      RETURN 86.952 8 TT 23

 RTN-INT-RTN 86.952 8 TT 23

 STRT-K-LINE 86.952 8 T 24 0 0 19200

 STRT-K-LINE 86.952 8 T 25 0 0 19200

 STRT-K-LINE 86.952 8 T 26 0 0 19200

  CH-DISABLE 86.952 8 T 26 1

        CALL 86.952 8 TTT 26

 STRT-T-LINE 86.952 8 TTT 1 0 16 15104

   PLAN-MOVE 86.952 8 TTT 1 405E61A8 FFFFFFFF 6

  START-MOVE 86.952 8 TTT 1 405E61A8 FFFFFFFF 6

    MTN-DONE 88.088 8 TTT 1 405E61A8 FFFFFFFF 3

 STRT-T-LINE 88.088 8 TTT 2 0 16 15104

    MMR_RCVD 88.104 8 TTT 1 405E61A8 00000000 3

   MTN_ENDED 88.104 8 TTT 1 405E61A8 00000000 3

 STRT-T-LINE 88.104 8 TTT 3 0 16 15104

 STRT-T-LINE 88.104 8 TTT 4 0 16 15104

 STRT-T-LINE 88.104 8 TTT 5 0 16 15104

 STRT-T-LINE 88.104 8 TTT 6 0 16 15104

 STRT-T-LINE 88.136 8 TTT 4 0 16 15104

 STRT-T-LINE 88.136 8 TTT 5 0 16 15104

 STRT-T-LINE 88.136 8 TTT 6 0 16 15104

 STRT-T-LINE 88.168 8 TTT 4 0 16 15104

 STRT-T-LINE 88.168 8 TTT 5 0 16 15104

 STRT-T-LINE 88.168 8 TTT 6 0 16 15104

 STRT-T-LINE 88.200 8 TTT 4 0 16 15104

 STRT-T-LINE 88.200 8 TTT 5 0 16 15104

 STRT-T-LINE 88.200 8 TTT 6 0 16 15104

 STRT-T-LINE 88.200 8 TTT 7 0 16 15104

      RETURN 89.208 8 TTT 26

 STRT-K-LINE 89.208 8 T 27 0 0 19200

 STRT-K-LINE 91.224 8 T 28 0 0 19200

    TASK-END 91.240 8 T 28

 LOG-DISABLE 91.240 8 T 28

12                     Screen display on a computer

By connecting a PC and a robot controller ( hereafter referred to as the controller ) via Ethernet, you can display the web page on the controller in the PC's browser (Internet Explorer) . It is possible to execute a KAREL program that does not have a group from the web page. JavaScript can also be used on the PC's browser .

 

12.1                     About the address (URL) specified in the browser

The following is an overview of how to specify the URL . For details, see section 6.3 "How to Use the Web Server" in the Ethernet Function Instruction Manual (B-82974EN/01) . For information on how to connect the robot and PC via Ethernet , see section 2 " TCP/IP Settings" in the same manual .

The general syntax of a URL is:

http://<robot>/<device>/<filename>

 

The robot part is the host name or IP address of the robot. The device part is the device name. For example, to specify test.htm in the root directory of MC: of the robot with IP address 192.168.0.1, use the following.

http://192.168.0.1/mc/test.htm

For virtual robots, a shortcut to thisrobot is available in the virtual robots directory, double-click it to display the robot homepage.

 

 



 



 

The part that corresponds to the robot's IP address will already be specified, so enter the device name and after. In the example above, if there is a test.htm file in the root of the mc directory, enter the following:

 



 

If ROBOGUIDE or iPendant screen display software is installed on your PC , you can also display screens created with the iPendant screen customization function . Screens that are intended to be displayed on the actual TP may not function properly.



 

12.2                     How to run KAREL programs from your PC

HTTP authentication is required to execute KAREL from a web server. If it is not required , you can set it to UNLOCK to enable execution. For details about HTTP authentication , see section 6.5 " HTTP Authentication" in the Ethernet User's Manual (B-82974EN/01) .

 

Step 12-1 UNLOCK KAREL HTTP authentication​

procedure

1 Click [ Screen Selection | Settings | Host Settings ] to display the Host Settings screen.

2 Move the cursor to HTTP .

 

 

3 Press F3 Details to see the following screen.



 

4 Move the cursor to the " A " at the left end of the KAREL line and press F3 U: Unlock.



 

12.3                     Form Usage Example 1

This section shows an example of creating a web page as shown below. Enter a string in the text box on the web page, click the "Submit" button to set it as a KAREL variable, and then launch the program.

 



 

Note

      This is an example of a Web page displayed on the browser (Internet Explorer) of a PC connected to the control device via Ethernet . This is not a page displayed on the i Pendant .

 

This page has three elements :

・      /mc/inp01/inp01.htm : Web page body

・      /mc/inp01/inp01.js :Javascript

・      /mc/inp01/inp01.kl : KAREL program to set variables and launch

 

In this example, KAREL is started by specifying a URL . For details, see sections 6.3.5 and 6.3.6 in the Ethernet Function Instruction Manual (B-82974EN/01) .

 

inp01.htm is as follows:

<html>

 

<head>

<meta http-equiv="Content-Type" content="text/html; charset=shift_jis">

<script language="javascript" src="/mc/inp01/inp01.js"></script>

<title> Example of using forms and Javascript </title>

</head>

<body>

<form method="POST">

      <p> When you press the submit button, the OnClick event will be triggered .<br>

The setstr( ) function in       inp01.js will be executed. <br>

      The KAREL program inp01 is executed there . <br>

The input string is set to the KAREL variable inp_str by       inp01 . <br>

      <input type="text" name="T1" size="20">

      <input type="button" value=" Submit " name="B1"

             onclick="JavaScript:setstr(T1.value)"></p>

</form>

</body>

</html>

The script is specified as Javascript , and the source file is /mc/inp01/inp01.js . The function setstr( ) is called by the onclick event of the submit button. The value of the text box T1 is passed as the second argument.

 

Below is inp01.js .

//

//KAREL Interface file

//

 

function setstr(strInp) {

  document.location.href = '/KAREL/inp01?inp_str='+strInp

}

The URL specifies the execution of the KAREL program inp01 . At that time, the variable INP_STR is set to the string strInp received from the form . The variable must be of type STRING to be set.

inp01.kl is as follows.

PROGRAM inp01

 

%NOLOCKGROUP

 

VAR

  inp_str : STRING[127]

  return_code : INTEGER 

BEGIN

  return_code = 204

  WRITE (inp_str, CR)

END inp01

inpstr is set at startup by setstr() . It is written to the user screen. Since a response file is not created, the variable return_code is set to 204 .

 

12.4                     Form Usage Example 2

12.4.1                Overview

This section provides an example of a web page like this :



 

Note

      This is an example of a Web page displayed on the browser (Internet Explorer) of a PC connected to the control device via Ethernet . This is not a page displayed on the i Pendant .

 

This page has two elements .

・      /mc/form.stm : Web page body

・      npnlsvr.kl :KAREL program

The "Reset part counter (R[1] = 0) " button is written in form.stm as follows:

<form action="../../Karel/mpnlsvr" method="GET">

  <div align="center">

    <input type="hidden" name="object" value="numreg">

    <input type="hidden" name="operate" value="setint">

    <input type="hidden" name="index" value="1">

    <input type="hidden" name="value" value="0">

    <input type="submit" value=" Reset part counter (R[1] = 0)">

  </div>

</form>

 

The form's action specifies that the KAREL program mpnlsvr should be executed. The KAREL variable (STRING only ) specified in the name of the INPUT tag with type="hidden" is set to the value of value . For example, the KAREL variable object is set to numreg .

The KAREL program mpnlsvr operates according to the variables that are set. Below is an excerpt of the process when object is NUMREG . uobject is the variable object in uppercase.

-- Handles setting number registers

  if (uobject = 'NUMREG') then

      cnv_str_int(uindex, index_i)

    if (uoperate = 'SETINT') then

      cnv_str_int(uvalue, value_i)

      set_int_reg(index_i, value_i, status)

    endif

 

    if (uoperate = 'SETREAL') then

      cnv_str_real(uvalue, value_r)

      set_real_reg(index_i, value_r, status)

    endif

  endif

 

12.4.2                form.stm

<html>

 

<head>

<meta http-equiv="Content-Language" content="ja">

<meta http-equiv="Content-Type" content="text/html; charset=shift_jis">

<meta name="GENERATOR" content="Microsoft FrontPage 6.0">

<meta name="ProgId" content="FrontPage.Editor.Document">

<title>Form Example</title>

</head>

 

<body bgcolor="#0000FF">

 

<div align="left">

  <table border="0" cellpadding="0" cellspacing="0">

    <tr>

      <td valign="top" align="left" height="388" width="5" rowspan="2"><img border="0" src="spacer.gif" width="1" height=" 1"></td>

      <td valign="top" align="left" height="5" width="623"><img border="0" src="spacer.gif" width="1" height="1"></ td>

    </tr>

    <tr>

      <td valign="top" align="center">

        <div align="center">

          <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" height="186">

            <tr valign="top" align="center">

              <td valign="top" height="21"><font size="6" color="#FFFFFF">

              <b> Example form </b></font></td>

            </tr>

            <tr>

              <td valign="top" height="33">

              </td>

            </tr>

            <tr>

              <td height="30">

                 <form action="../../Karel/mpnlsvr" method="GET">

                   <div align="center">

                     <input type="hidden" name="object" value="numreg">

                     <input type="hidden" name="operate" value="setint">

                     <input type="hidden" name="index" value="1">

                     <input type="hidden" name="value" value="0">

                     <input type="submit" value=" Reset part counter (R[1] = 0)">

                   </div>

                 </form>

              </td>

            </tr>

            <tr>

              <td height="30">

                <form action="../../Karel/mpnlsvr" method="GET">

                  <div align="center">

                    <input type="submit" value=" Start TP program Part1 ">

                    <input type="hidden" name="object" value="PROG">

                    <input type="hidden" name="operate" value="RUN">

                    <input type="hidden" name="pname" value="PART1">                           

                  </div>

                  <div align="center">

                    <font color="#FFFFFF">($RMT_MASTER = 1 must be true )</font>

                  </div>

                </form>

              </td>

            </tr>

            <tr>

              <td height="30">

                <form action="../../Karel/mpnlsvr" method="GET">

                  <div align="center">

                    <input type="hidden" name="object" value="DOUT">

                    <input type="hidden" name="operate" value="set">

                    <input type="hidden" name="index" value="1">

                    <input type="hidden" name="value" value="ON">

                    <input type="submit" value="ON DOUT[1] " >

                  </div>

                </form>

              </td>

            </tr>

            <tr>

              <td height="30">

                <form action="../../Karel/mpnlsvr" method="GET">

                  <div align="center">

                    <input type="hidden" name="object" value="sysvar">

                    <input type="hidden" name="operate" value="setint">

                    <input type="hidden" name="vname" value="$MCR.$GENOVERRIDE">

                    <input type="hidden" name="value" value="100">

                    <input type="submit" value=" override 100%">

                  </div>

                </form>

              </td>

            </tr>

          </table>

        </div>

      </td>

    </tr>

  </table>

</div>

 

</body>

 

</html>

 

12.4.3                mplsvr.kl

--Sample KAREL program​

program mpnlsvr

 

%NOLOCKGROUP

%NOABORT=ERROR+COMMAND

%NOPAUSE=ERROR+COMMAND+TPENABLE

%NOBUSYLAMP

%ENVIRONMENT REGOPE

%ENVIRONMENT SYSDEF

%ENVIRONMENT KCLOP

 

var

 

-- Declares parameter names and values ​​in a web page

  object : string[12]

  pname : string[12]

  operate : string[12]

  index : string[12]

  value : string[12]

  URL : string[128]

  vname : string[128]

-- Similar variables. These convert input parameters to upper case.

-- is used to

  uobject : string[12]

  uoperate: string[12]

  uindex : string[12]

  uvalue : string[12]

  upname : string[12]

  uvname : string[128]

--Other variables

  kcommand : string[126]

 

  value_i : INTEGER

  value_r : real

  index_i : integer

  status : integer

  i : integer

  index_p : integer

  entry : INTEGER

  keep_rmt_mst: INTEGER

 

  file1 : file

  return_code : integer

--Input strings are capitalized for consistent comparisons.

routine toupper(p_char: integer): string

begin

  if (p_char > 96) and (p_char < 123) then

    p_char = p_char - 32

  endif

  return (chr(p_char))

End toupper

 

begin

--Check if a variable is uninitialized before using it

  if uninit(object) then object = ''; endif

  if uninit(operate) then operate = ''; endif

  if uninit(index) then index = ''; endif

  if uninit(value) then value = ''; endif

  if uninit(pname) then pname = ''; endif

  if uninit(vname) then vname = ''; endif

 

--All characters in input parameters are uppercase for string comparison.

  uobject = ''

  for i = 1 to str_len(object) do

    uobject = uobject + toupper(ord(object, i))

  endfor

 

  uoperate = ''

  for i = 1 to str_len(operate) do

    uoperate = uoperate + toupper(ord(operate, i))

  endfor

 

  uindex = ''

  for i = 1 to str_len(index) do

    uindex = uindex + toupper(ord(index, i))

  endfor

 

  uvalue = ''

  for i = 1 to str_len(value) do

    uvalue = uvalue + toupper(ord(value, i))

  endfor

 

  upname = ''

  for i = 1 to str_len(pname) do

    upname = upname + toupper(ord(pname, i))

  endfor

 

  uvname = ''

  for i = 1 to str_len(vname) do

    uvname = uvname + toupper(ord(vname, i))

  endfor

 

--Processing the digital output settings

  if (uobject = 'DOUT') then

    if (uoperate = 'SET') then

      cnv_str_int(uindex, index_i)

      if (uvalue = 'ON') then

        DOUT[index_i] = ON

      endif

      if (uvalue = 'OFF') then

        DOUT[index_i] = OFF

      endif

    endif

  endif

-- Handles setting number registers

  if (uobject = 'NUMREG') then

      cnv_str_int(uindex, index_i)

    if (uoperate = 'SETINT') then

      cnv_str_int(uvalue, value_i)

      set_int_reg(index_i, value_i, status)

    endif

 

    if (uoperate = 'SETREAL') then

      cnv_str_real(uvalue, value_r)

      set_real_reg(index_i, value_r, status)

    endif

  endif

--Process program startup and termination

  if (uobject = 'PROG') then

    if (uoperate = 'RUN') then

      kcommand = 'RUN' + upname

      KCL_NO_WAIT (kcommand, STATUS)

    else

      kcommand = 'ABORT ' + upname

      KCL_no_wait (kcommand, status)

    endif

  endif

-- Handles system variable settings

  if (uobject = 'SYSVAR') then

    if (uoperate = 'SETINT') then

      cnv_str_int(uvalue, value_i)

      set_var(entry, '*SYSTEM*', uvname, value_i, status)

    endif

 

    if (uoperate = 'SETREAL') then

      cnv_str_real(uvalue, value_r)

      set_var(entry, '*SYSTEM*', uvname, value_r, status)

    endif

 

    if (uoperate = 'SETSTR') then

      set_var(entry, '*SYSTEM*', uvname, uvalue, status)

    endif

  endif

-- Returns a No Response/No Content code.

  return_code = 204

end mpnlsvr

 

12.5                     Form Use Case 3

12.5.1                Overview

The example given in this section is almost the same as the example given in section 6.3.6 of the Ethernet Function Instruction Manual (B-82974EN/01) . For details, refer to that manual. The only difference is that some of the text is in Japanese. The example given in this section is the following web page.



 

This page has two elements .

・      /mc/form3/form.stm : Web page body

・      web_demo.kl : KAREL program

 

It has the following features:

・Pressing the       submit button will launch the KAREL program web_demo .

・At that time, the value set in the text box or radio button will be set to the corresponding variable.     

・Variables specified like       <input type="hidden" name="str1" value="string1"> will also be set.

・      web_demo displays the results according to the contents of the variables.

Note that the state of radio buttons etc. when the page is displayed does not reflect the contents of the variable.

 



 

12.5.2                web_demo.stm

 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=shift_jis">

<title>Web Demo</title>

</head>

<body bgcolor="#FFFF00">

<p><font color="#FF0000" size="5"><strong><u> Demo: Interface for KAREL programs using Forms </u></strong></font></p>

<form action="../../../karel/web_demo" method="GET" name="uif_demo">

<p> This form has three hidden fields : C1=off, STR1=string1, STR2=string2 . </p>

<p> The checkbox value is only sent when the checkbox is ON , so you must first turn it OFF . </p>

<p> You can either send a variable with the same name as the checkbox as hidden , or set the checkbox variable at the end of the KAREL program .

This can be achieved by setting it to the default setting. <br>

This example demonstrates both approaches. </p>

<p><input type="text" size="20" name="str3"value="string3"> Text box example (STR3)</p>

<p><input type="checkbox" name="C1" value="ON">

Example of checkbox (C1)</p>

<p>

<input type="radio" checked name="R1" value="V1">

 Radio button example (R1, value = V1) -- Show Count1 </p>

<p><input type="radio" name="R1" value="V2">

Radio button example (R1, value=V2) -- Show Count2 </p>

<p><select name="D1" size="1">

<option>Jim</option>

<option>Joe</option>

<option>Harry</option>

</select> Dropdown box example </p>

<p><input type="submit" name="B1"

value="submit"></p>

<input type="hidden" name="C1" value="OFF">

<input type="hidden" name="str1" value="string1">

<input type="hidden" name="str2" value="string2">

</form>

</body>

</html>

 

12.5.3                web_demo.kl

 

-- This is called from the web_demo.htm form created in FrontPage and returns a response.

-- A sample KAREL program.

--The form data will be set to the corresponding KAREL variables ( if declared ) .

-- You should declare a STRING variable URL to understand exactly what was provided by the browser.

--That helps with debugging.

--

--Example of the received URL :

-- WEB_DEMO?STR1=STRING1&STR2=STRING2&STR3=STRING3&C1=ON&R1=V1&D1=JIM&B1=SUBMIT

--

-- NOTE :

-- Variables contained in the URL will be set each time the program is called.

--Some form variables ( e.g. checkboxes ) are checked

-- only will be sent.

--This behavior sets the form's default value to a "hidden" variable of the same name.

--You can always send it.

--or after the program has run, set variables with this property to their default state

--You can also fix this by resetting it.

-- ( See the assignment to variable C1 at the end of this program . )

--

--A program's variables are uninitialized the first time the program is run.

-- ( Excluding variables set in the URL. Variables set by the user in the URL are

-- because it is set before it is called. )

--

PROGRAM web_demo

%NOLOCKGROUP

CONST

  TEXTHDR = '<HTML> <BODY>'

  TEXTTRLR = '</BODY> </HTML>'

  BACKGROUND = 'FRS/EARTHBG.GIF' -- used in MD_FILES.HTM

  PIC1 = 'FR/PICTURE.GIF' -- some picture for top of response file

VAR

  count1 : integer

  count2 : integer

  file1 : FILE

  URL : STRING[128]

  str1 : STRING[12]

  str2 : STRING[12]

  str3 : STRING[12]

  c1 : STRING[12]

  r1 : STRING[12]

  d1 : STRING[12]

 

 

BEGIN

  --Check if variables are uninitialized before using them.

  IF UNINIT(count1) THEN count1 = 0; ENDIF

  IF UNINIT(str1) THEN str1 = ''; ENDIF

  IF UNINIT(str2) THEN str2 = ''; ENDIF

  IF UNINIT(str3) THEN str3 = ''; ENDIF

  IF UNINIT(c1) THEN c1 = ''; ENDIF

  IF UNINIT(r1) THEN r1 = ''; ENDIF

  IF UNINIT(d1) THEN d1 = ''; ENDIF

  IF UNINIT(URL) THEN url = ''; ENDIF

  count1 = count1 + 1 --These are just examples, but for example other programs

  count2 = count1 * 2 --Can also be the count of production.

  OPEN FILE file1 ('RW', 'RD:RESPONSE.HTM')

  WRITE file1('<HTML><HEAD><TITLE>WEB_DEMO.HTM</TITLE></HEAD>',CR)

  WRITE file1('<BODY BACKGROUND="../')

  WRITE file1(BACKGROUND)

  WRITE file1('">',CR)

  -- You can also add an image to the beginning of the response file.

  -- write file1('<CENTER> <H1><A NAME="TOP"><IMG SRC="../')

  -- write file1(PIC1,cr)

  -- write file1('" WIDTH="400" HEIGHT="100"></A></H1> </CENTER>',cr)

  -- write file1('"></A></H1> </CENTER>',cr)

  WRITE file1('<H1><CENTER><BOLD>Results of form request :',CR,CR)

  WRITE file1('</CENTER></H1>',CR)

  -- A checkbox is sent only when it is checked,

  -- Always send the default state.

  WRITE file1('<H2><CENTER><BOLD>Received c1 (hidden) : ')

  WRITE file1(c1,CR)

  WRITE file1('</BOLD></CENTER></H2>',CR)

  WRITE file1('<H2><CENTER><BOLD>Received str3 : ')

  WRITE file1(str3,CR)

  WRITE file1('</BOLD></CENTER></H2>',CR)

  IF (c1='ON') THEN

    WRITE file1('<H2><CENTER><BOLD>Received Checkbox : ')

    WRITE file1(c1,CR)

    WRITE file1('</BOLD></CENTER></H2>',CR)

  ENDIF

  WRITE file1('<H2><CENTER><BOLD>Received Radio button : ')

  WRITE file1(r1,CR)

  WRITE file1('</BOLD></CENTER></H2>',CR)

  WRITE file1('<H2><CENTER><BOLD>Received dropdown box : ')

  WRITE file1(d1,CR)

  WRITE file1('</BOLD></CENTER></H2>',CR)

  WRITE file1('<H2><CENTER><BOLD>Received URL : ')

  WRITE file1(URL,CR)

  WRITE file1('</BOLD></CENTER></H2>',CR)

  IF (r1='V1') THEN

    WRITE file1('<H2><CENTER><BOLD>Count1 value is : ')

    WRITE file1(count1,CR)

    WRITE file1('</BOLD></CENTER></H2>',CR)

  else

    WRITE file1('<H2><CENTER><BOLD>Count2 value is : ')

    WRITE file1(count2,CR)

    WRITE file1('</BOLD></CENTER></H2>',CR)

  ENDIF

  -- Check box default value as hidden variable

  --If not sent, another option is

  --After the program is executed, set the checkbox variable to its default state.

  --Resetting it,

  --As with all KAREL programs,

  --Global variables retain their values ​​between program executions.

  -- ( The value is not lost between program executions even after the program has finished )

  c1 = 'OFF'

  WRITE file1(TEXTTRLR,CR)

  CLOSE FILE file1

END web_demo

13                     Precautions when using KAREL

・　In the R-30iA control device, the KAREL .PC file you created and the .VR file containing variables can be saved by selecting Save All from the file screen. However, the VR file created by building the Form dictionary .FTX file cannot be saved on models prior to the 7DA4 series ( including the 7DA4 series). It is also not possible to load it by loading all after starting control (it is possible to load it by selecting them individually on the file screen). Even if you load a file that has been backed up, the .VR file for Form will not be loaded (as it is not backed up). After loading the full backup, load the .VR file you created with Robuguide .

 

・　Form Editor cannot be used on the actual device with models up to the 7DA1 series ( including the 7DA1 series). If you would like to use Form Editor , please use software from the 7DA3 series or newer.

 

- When using global variables, care must be taken if there is a process that accesses this variable from multiple locations. If there is a process that changes the value of a variable in multiple locations, it may be overwritten without the intention of the KAREL creator, and the expected behavior may not occur. Debugging work may be more efficient if you create KAREL in such a way that you do not create processes that update global variables in multiple locations.

 

・　When debugging using write statements and then installing the program on a production line, be sure to delete the write statements if they are not necessary. The more write statements there are, the slower KAREL will run.

 

If you try to reference an uninitialized variable, an error occurs. Although some built-in functions allow you to use uninitialized variables as arguments, you should always initialize the variable.



## Citations

- Primary: FANUC KAREL Reference Manual (B-83144JA-1) (keywords: KAREL, programming, routine, variable, file I/O, string, array, structure, condition handler, TP interface, system variable, built-in, data type, program structure, R-30iA, robot language).
- Applicability: R-30iB Plus, KAREL Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_KAREL_Reference.txt`.
- Classification: reference / topic=karel.

