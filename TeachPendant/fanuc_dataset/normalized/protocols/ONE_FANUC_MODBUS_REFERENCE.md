---
id: ONE_FANUC_MODBUS_REFERENCE
title: "FANUC Modbus TCP/RTU Communication Reference"
topic: protocols
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC Modbus/OPC UA Manual"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# FANUC Modbus TCP/RTU Communication Reference

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/protocols/FANUC_Modbus_Reference.txt` as part of the TeachPendant migration. Original source: FANUC Modbus/OPC UA Manual. Review and update `related:` with neighbor entry IDs.

## Body



============================================================
1 OVERVIEW
============================================================

1 OVERVIEW
The HMI Device function allows communication with external industrial devices that are connected via
1 OVERVIEW


============================================================
2 CONNECTION OF HMI DEVICE
============================================================

2 CONNECTION OF HMI DEVICE MARUCHOPM05191E REV A
2 CONNECTION OF HMI DEVICE
2.1 Modbus RSC Connection
Cable
The following diagram shows the connection of RSC. Please refer to the manual of the HMI device
about the connection of HMI device side.
2 CONNECTION OF HMI DEVICE
2 CONNECTION OF HMI DEVICE MARUCHOPM05191E REV A
Main board
2 CONNECTION OF HMI DEVICE
Port Init
1/2
Connector Comment
1 JRS16 RSC P2: [Maintenance Cons ]
2 JD17 RSC P3: [KCL/CRT
]
2 CONNECTION OF HMI DEVICE MARUCHOPM05191E REV A
Port Init
2 CONNECTION OF HMI DEVICE
connection is requested from HMI devices etc. which would exceed the setting value, the HMI device etc.
whose latest communication is the oldest is disconnected automatically.
Unit ID
Robot controller does not use Unit ID in Modbus TCP communication data. Robot controller responds all
requests from an HMI device etc. regardless of Unit ID.
Port number
The port number of this function is set in the system variable $SNPX_PARAM.$MODBUS_PORT. The
default value is 502. The port number of this function can be changed by this system variable.
Modbus TCP Server (R800)
Modbus TCP Server (R800) option is independent from this function. But when this option is loaded, if
$SNPX_PARAM.$NUM_MODBUS is set to 1 or greater value, "PRIO-090 SNPX communication error",
"HRTL-048 Address already in use" occurs and MODBUS/TCP Slave Ethernet communication of this
function does not work. It is because this function and Modbus TCP Server use the same port number
(502).
By changing the port number of this function, both this function and Modbus TCP Server can be used at the
same time.
2.1.2 OPC UA Server Ethernet Connection
2 CONNECTION OF HMI DEVICE MARUCHOPM05191E REV A
- 50 items can be monitored per 1 subscription but minimum data acquiring interval for the item is
increased by 100ms per 1 item like 100ms for 1st item, 200ms for 2nd item, 300ms for 3rd item.
Setting of TCP/IP
To use HMI device communication via the FANUC robot OPC UA Server, it is necessary to setup TCP/IP
on the Robot controller in advance. Details on the Ethernet interface and TCP/IP configuration can be
found in "SETTING UP TCP/IP" section in the Internet Options Setup and Operations Manual.
The FANUC robot OPC UA Server can be accessed from an external OPC UA client by entering the
robot’s OPC UA server URL in the following format:
opc.tcp://robot IP address:4880/FANUC/NanoUaServer
Example:
opc.tcp://172.22.194.222:4880/FANUC/NanoUaServer
The OPC UA client can connect with the robot OPC UA server after setting the above URL in the OPC UA
client. Please see the “55.2 MODBUS DATA MODEL” sections for details about assigning and accessing
robot data.
No text found on this page.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3 MODBUS DATA MODEL
3.1 Modbus data model
Modbus bases its data model on a series of tables.
Table 3-1. Listing of Modbus data model nodes
Table Object type Type of
Discrete input Single bit READ only
Coils Single bit READ-WRITE
Input Registers 16-bit word READ only
Holding Registers 16-bit word READ-WRITE
3.2 OPC UA Organization of MODBUS data model
This section applies only when using OPC UA client for HMI device communication with the built-in


============================================================
2 1 Modbus RSC Connection
============================================================

2.1 Modbus RSC Connection
Cable
The following diagram shows the connection of RSC. Please refer to the manual of the HMI device
about the connection of HMI device side.


============================================================
2 1 1 Modbus TCP Slave Ethernet Connection
============================================================

2.1.1 Modbus/TCP Slave Ethernet Connection
Setting of TCP/IP
To use HMI device communication via MODBUS/TCP Slave Ethernet, it is necessary to setup TCP/IP on
Robot controller in advance.
Details on the Ethernet interface and TCP/IP configuration can be found in "SETTING UP TCP/IP" section
in the Internet Options Setup and Operations Manual.
Setting of MODBUS/TCP Slave Ethernet connection


============================================================
2 1 2 OPC UA Server Ethernet Connection
============================================================

2.1.2 OPC UA Server Ethernet Connection


============================================================
3 MODBUS DATA MODEL
============================================================

3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3 MODBUS DATA MODEL
3.1 Modbus data model
Modbus bases its data model on a series of tables.
Table 3-1. Listing of Modbus data model nodes
Table Object type Type of
Discrete input Single bit READ only
Coils Single bit READ-WRITE
Input Registers 16-bit word READ only
Holding Registers 16-bit word READ-WRITE
3.2 OPC UA Organization of MODBUS data model
This section applies only when using OPC UA client for HMI device communication with the built-in
3 MODBUS DATA MODEL
The following table describes node and data types of the five (5) leaf nodes under the “Modbus” object.
Table 3-2. Listing of Modbus node data types
Node Data type
DiscreteInput Boolean
Coils Boolean
InputRegisters UInt16
HoldingRegisters Uint16
Command String[]
Leaf nodes other than Command node are array.
The index range should be supported on the OPC UA client to support partial read or write for the leaf
nodes.
Please Note: In the following sections, the term HMI Device etc. can also refer to an OPC UA client.
3.2.1 Correspondence of Modbus Address to Robot Data
Each “Table” has address area 1 ~ 65535. This function defines the following correspondence of Modbus
address to Robot data. The HMI device etc. can read or write the corresponded robot data by accessing
Modbus address.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-3. Cross Reference of Modbus address to robot data
Coils 1 ~ 10000 Digital output DO[a]
10001 ~ 20000 Robot output RO[a-10000]
20001 ~ 30000 Flag F[a-20000]
30001 ~ 65536 Not used
Input Registers 1 ~ 1000 Group input GI[a]
1001 ~ 2000 Group output GO[a-1000]
2001 ~ 3000 Analog input AI[a-2000]
3001 ~ 4000 Analog output AO[a-3000]
4001 ~ 65536 Not used
Holding Registers 1 ~ 16384 Robot data is assigned (assigned to R[a] by default)
16385 ~ 65536 Not used
When reading an address that is not used (or the corresponding robot data is not assigned) from an HMI
device etc., the read value is always 0. When the address is written from an HMI device etc., the request is
ignored. In these cases, this function does not return an error to the HMI device etc.
The address range 1 ~ 16384 of Holding Registers can be assigned to various Robot data. (→ Assignment
of Holding Registers)
The HMI device etc. cannot write to the signals corresponded to Discrete input and Input Registers. It is
possible to write these signals via Holding Registers by assigning these signals to Holding Registers. (→
Assign I/O data and simulation status)
In this function, address range is specified as 1 ~ 65536. But some HMI devices etc. specify as 0000 ~ FFFF
(start from 0 and specified as hexadecimal). In this case, please convert the specified address as subtraction
of 1 and change to hexadecimal.
3 MODBUS DATA MODEL
3.2.2 Modbus Function Code
When using MODBUS TCP communication (not OPC UA communication), this function supports the
following function codes.
Table 3-4. MODBUS TCP function codes
Function code name Code
Read Coils 01h
Read Discrete Inputs 02h
Read Holding Registers 03h
Read Input Register 04h
Write Single Coil 05h
Write Single Register 06h
Write Multiple Coils 0Fh
Write Multiple Registers 10h
3.3 ASSIGNMENT OF HOLDING REGISTERS
The address range 1 ~ 16384 (0~16383 when OPC UA) of Holding Registers can be assigned to various
Robot data. Each address has 2 bytes (16 bits) memory space. It is possible to assign 32 bit data to the
continuous 2 addresses, and to assign string data to the continuous plural addresses.
The following robot data can be assigned to the Holding Registers.
- Register data
- Position resister data
- String register data
- Current position
- Alarm history
- Program execution status (Running program name and line number)
- System variable data
- Comment of Register, Position register, String register and I/O
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
- I/O data and simulation status
- Integrated PMC address data
- Symbol and comment of Integrated PMC address.
The assignment between Robot data and Holding Registers is defined by setting of $SNPX_ASG. The
$SNPX_ASG is 80 arrays of $SNPX_ASG[1]~[80], every element has the following variables. Various
robot data can be assigned to the Holding Registers by setting $SNPX_ASG.
Table 3-5. $SNPX_ASG variable descriptions
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
It specifies the robot data type and index by string. The meaning of this variable is
different according to the assigned data type. Please refer to the description in
each robot data.
Example:
3 MODBUS DATA MODEL
Robot data $SNPX_ASG[1]. MODBUS data model
$ADDRESS : 1
Register $SIZE : 4 Holding rgisters
$NAME : R[1]@1.1
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Note: Data type is 16 bits signed integer. Value is rounded off to no decimal place. Range of value is from
-32768 to 32767. If value is out of the range, value cannot be read and write correctly.
3.3.1 Data type of Holding Registers
Data type of Holding Register is 16 bits integer. Data range of Holding Register is -32768 ~ 32767. The
value of assigned robot data is converted as follows according to the data type of the assigned data.
Table 3-8. Holding Register data type conversions
Assigned data Description
16 bits signed integer The Holding Register data is the same as the assigned data.
Range: -32768 ~ 32767
32 bits signed integer The continued 2 Holding Registers express a 32 bits signed integer. The former
Range: -2147483648 ~ address is lower 16 bits data, and the latter address is upper 16bits data.
2147483647
Real The continued 2 Holding Registers express a single precision binary real format of
3 MODBUS DATA MODEL
3.3.2 Assign Robot Registers
$SNPX_ASG setting to assign Robot Registers to Holding Registers is the following.
Table 3-9. $SNPX_ASG variable descriptions for Robot Register assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One Register uses two Holding Registers.
(You can change the number of Holding Registers for one robot register by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”R[1]” to assign Register R[1]. The number in [ ] is the index of register.
Continued registers such as R[2]-R[5] can be assigned by one $SNPX_ASG
element. In this case, please set $SIZE to 8 because the number of registers to
assign is 4. And please set $VAR_NAME “R[2]”. The index 2 means the starting
index of the continuous assignment.
If “@1.1” is added just after the string, the number of Holding Registers for one
register is changed from 2 to 1. In this case, accessing data size becomes 16 bits.
Example: R[1]@1.1
“R[1]” part means to assign robot registers from index 1.
“@1.1” part means one register is accessed as 16 bits data.
$MULTIPLY Meaning: Multiplier
The value accessed by an HMI device etc. is multiplied by $MULTIPLY.
When $MULTIPLY is 0, it means that an HMI device etc. can access Holding
Registers as 32bits REAL data.
When it is not 0, an HMI device etc. accesses Holding Registers as 32bits signed
integer. And value is rounded off to no decimal place.
Range: 0.0001~10000, 0
Example: Register value is 123.45.
When $MULTIPLY is 1, Holding Register is 123
When $MULTIPLY is 10, Holding Register is 1235.
When $MULTIPLY is 0.1, Holding Register is 12.
When $MULTIPLY is 0, Holding Register is 123.45 of REAL
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
For example, $SNPX_ASG is set as follows.
Table 3-10. Example Robot Register assignments of $SNPX_ASG
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 2 R[1]@1.1 1
$SNPX_ASG[2] 3 4 R[1] 100
$SNPX_ASG[3] 7 4 R[2] 0.1
$SNPX_ASG[4] 11 2 R[1] 0
In this case, address of Holding Registers are corresponded to robot registers as follows.
Table 3-11. Result of example Robot Register assignments of $SNPX_ASG
Address Assigned data
1 R[1] as 16bits signed integer.
2 R[2] as 16bits signed integer.
3-4 R[1] multiplied by 100 as 32bits signed integer.
5-6 R[2] multiplied by 100 as 32bits signed integer.
7-8 R[2] divided by 10 as 32bits signed integer.
9-10 R[3] divided by 10 as 32bits signed integer.
11-12 R[1] as 32bits REAL
$SNPX_ASG[1] defines that 2 Holding Registers from address 1 to 2 are assigned to robot registers from
3 MODBUS DATA MODEL
$SNPX_ASG[3] defines that 4 Holding Registers from 7 to 10 are assigned to robot registers from R[2]
divided by 10 as 32 bits signed integer. One robot register uses 2 Holding Registers. So, addresses 7-8 are
assigned to R[2] divided by 10 as 32 bits signed integer and address 9-10 are assigned to R[3] divided by 10
as 32 bits signed integer.
$SNPX_ASG[4] defines that 2 Holding Registers from 11 to 12 are assigned to robot register R[1] as 32bit
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-12. $SNPX_ASG variable descriptions for Position Register assignment to Holding Registers
integer. And value is rounded off to no decimal place.
Range: 0.0001~10000, 0
Example: Position register member value is 123.45.
When $MULTIPLY is 1, Holding Register is 123
When $MULTIPLY is 10, Holding Register is 1235.
When $MULTIPLY is 0.1, Holding Register is 12.
When $MULTIPLY is 0, Holding Register is 123.45 of REAL
3 MODBUS DATA MODEL
Table 3-13. Holding Register mapping per Position Register assignment
Address Description Effect of $MULTIPLY
9-10 P 32bits signed integer or real (deg) Yes
11-12 R 32bits signed integer or real (deg) Yes
13-14 E1 32bits signed integer or real (mm, deg) Yes
15-16 E2 32bits signed integer or real (mm, deg) Yes
17-18 E3 32bits signed integer or real (mm, deg) Yes
19 FLIP 16bits signed integer (1:Flip, 0:Non flip) No
20 LEFT 16bits signed integer (1:Left, 0:Right) No
21 UP 16bits signed integer (1:Up, 0:Down) No
22 FRONT 16bits signed integer (1:Front, 0:Back) No
23 TURN4 16bits signed integer (-128~127) No
24 TURN5 16bits signed integer (-128~127) No
25 TURN6 16bits signed integer (-128~127) No
26 VALIDC 16bits signed integer (→NOTE1) No
Joint data
27-28 J1 32bits signed integer or real (mm, deg) Yes
29-30 J2 32bits signed integer or real (mm, deg) Yes
31-32 J3 32bits signed integer or real (mm, deg) Yes
33-34 J4 32bits signed integer or real (mm, deg) Yes
35-36 J5 32bits signed integer or real (mm, deg) Yes
37-38 J6 32bits signed integer or real (mm, deg) Yes
39-40 J7 32bits signed integer or real (mm, deg) Yes
41-42 J8 32bits signed integer or real (mm, deg) Yes
43-44 J9 32bits signed integer or real (mm, deg) Yes
45 VALIDJ 16bits signed integer (→NOTE2) No
Frame number
46 UF 16bits signed integer (-1~62) (→NOTE3) No
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-13. Holding Register mapping per Position Register assignment
Address Description Effect of $MULTIPLY
47 UT 16bits signed integer (-1~30) (→NOTE4) No
48-50 Reserve No
3 MODBUS DATA MODEL
Uninitialized member of position data is displayed as “******” on position register menu of Teach
Pendant. These members are read as 0 from an HMI device etc. Please read VALIDC or VALIDJ to check
whether the value is 0 or uninitialized. If position data has uninitialized member, VALIDJ and VALIDC are
0.
If you write data to the member in Cartesian part from an HMI device etc., the position representation
becomes Cartesian. If you write data to member in Joint part from an HMI device etc., the position
representation becomes Joint. If you write data to UF or UT from an HMI device etc., position
representation is not changed.
Extract a part by adding “@” in $VAR_NAME
If “@” is added to $VAR_NAME, the specified part of data structure is extracted. It was already used for
Register assignment (R[1]@1.1).
For example, you need to access only X, Y and Z of PR[1-3]. In this case, normally the setting of
$SNPX_ASG is the following.
Table 3-14. Example assignment of three Position Register structures
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 150 PR[1] 1
The following is the correspondence between position registers and Holding Registers of this setting.
Table 3-15. Correspondence between Holding Registers and Position Registers from inefficient assignment
Address Assigned data
1-2 X of PR[1] as 32bits signed integer
3-4 Y of PR[1] as 32bits signed integer
5-6 Z of PR[1] as 32bits signed integer
51-52 X of PR[2] as 32bits signed integer
53-54 Y of PR[2] as 32bits signed integer
55-56 Z of PR[2] as 32bits signed integer
101-102 X of PR[3] as 32bits signed integer
103-104 Y of PR[3] as 32bits signed integer
105-106 Z of PR[3] as 32bits signed integer
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Actual read data are only 18 Holding Registers, but this assignment occupies 150 Holding Registers. And,
some HMI devices access address 7-50 of Holding Registers that is not necessary to read, because reading
one big data is more efficient than reading several small data from the communication point of view. But
the address 27-45 includes Joint representation part, and if position data is Cartesian representation,
representation conversion is needed to read this unnecessary data.
To communicate efficiently, please set $SNPX_ASG as follows.
Table 3-16. Example of extracting part of three Position Register structures by use of “@” in $VAR_NAME
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 18 PR[1]@1.6 1
The following is the correspondence between position registers and Holding Registers of this setting.
Table 3-17. Correspondence between Holding Registers and Position Registers from efficient assignment
Address Accessed data
1-2 X of PR[1] as 32bits signed integer
3-4 Y of PR[1] as 32bits signed integer
5-6 Z of PR[1] as 32bits signed integer
7-8 X of PR[2] as 32bits signed integer
9-10 Y of PR[2] as 32bits signed integer
11-12 Z of PR[2] as 32bits signed integer
13-14 X of PR[3] as 32bits signed integer
15-16 Y of PR[3] as 32bits signed integer
17-18 Z of PR[3] as 32bits signed integer
The change of $SNPX_ASG is that “@1.6” is added in $VAR_NAME and $SIZE is changed from 150 to
18. By this change, the number of Holding Registers for one position register is changed from 50 to 6. The
“6” in ”@1.6” means the number of Holding Registers for one position register. And the “1” in “@1.6”
means the starting address of extracting part in position data structure.
By specifying “@” in $VAR_NAME, you can extract the specified part of position data structure.
@1.6
The size of the extracting part (The number of %R for one position)
The starting address of extracting part in position data structure.
3 MODBUS DATA MODEL
You can specify “@” not only for position register, but also for all data that is assigned by $SNPX_ASG.
The following is another example to assign J1-J6 of PR[1-3].
Table 3-18. Example Position Register assignment of J1-J6 of PR[1-3]
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 96 PR[3]@27.12 1
3.3.4 Assign String Registers
$SNPX_ASG setting to assign String Registers to Holding Registers is the following.
Table 3-19. $SNPX_ASG variable descriptions for String Register assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One String Register uses 40 Holding Registers.
It is possible to deal with first 80 characters of one string register in default setting.
(You can change the number of Holding Registers for one string register by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”SR[1]” to assign String Register SR[1]. The number in [ ] is the index of
string register.
Continued string registers such as SR[2]-SR[5] can be assigned by one
$SNPX_ASG element. In this case, please set $SIZE 160 because the number of
string registers to assign is 4. And please set $VAR_NAME “SR[2]”. The index 2
means the starting index of the continuous assignment.
If “@” is added just after the string, the specified part of the String Register is
assigned.
Example: SR[1]@1.50
“SR[1]” means to assign String Registers from index 1.
“@1.50” means the first 100 characters of String Register data are assigned.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1, 26 -
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3.3.5 Assign Current Position
$SNPX_ASG setting to assign Current Position to Holding Registers is the following.
Table 3-20. $SNPX_ASG variable descriptions for Current Position assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Current Position uses 50 Holding Registers.
(You can change the number of Holding Registers for Current Position by adding “@”
in $VAR_NAME)
Range: 1~16384
3 MODBUS DATA MODEL
Table 3-20. $SNPX_ASG variable descriptions for Current Position assignment to Holding Registers
Variable in $SNPX_ASG Description
$VAR_NAME Meaning: String to specify robot data.
Please set ”POS[0]” to assign Current Position. The number in [ ] is user frame
number.
When user frame number is 0, the Current Position on World frame is assigned.
This is the same as when "WORLD" is selected in the current position
screen on the teaching pendant.
When user frame number is -1, the Current Position on the User frame that is
currently selected. This is the same as when "USER" is selected in the
current position screen on the teaching pendant.
When user frame number is 1-61, the Current Position on the specified user frame.
Data structure is the same as position register.
In multi group system, POS[0] means current position group 1 robot. Please set
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Current position uses 50 Holding Registers, and data structure is the same as position register.
3 MODBUS DATA MODEL
Table 3-22. $SNPX_ASG variable descriptions for Alarm History assignment to Holding Registers
Variable in $SNPX_ASG Description
$VAR_NAME Meaning: String to specify robot data.
Please set ”ALM[1]” to assign alarm. The number in [ ] is line number in alarm menu.
The latest alarm is 1.
“ALM[1]” assigns active alarm. Alarms displayed in active alarm menu are assigned.
“ALM[E1]” assigns alarm history. Alarms displayed in alarm history menu are
assigned.
“ALM[M1]” assigns motion alarm history. Alarm displayed in motion alarm menu are
assigned.
“ALM[S1]” assigns system alarm history. Alarm displayed in system alarm menu are
assigned.
“ALM[A1]” assigns application alarm history. Alarm displayed in application alarm
menu are assigned.
“ALM[P1]” assigns password log. Password log displayed in password log menu are
assigned.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1,-1
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-23. Holding Register content per Alarm assignment
When alarm occurs, alarm message is displayed on top of teach pendant. Sometimes a
message is also displayed on the second line, it is cause code.
This shows facility code of the cause code. If the alarm does not have cause code, this
becomes 0.
4 Alarm number of cause code 16 bits signed integer
Alarm number of cause code. If the alarm does not have cause code, this becomes 0.
5 Alarm severity 16 bits signed integer
The value shows alarm severity.
3 MODBUS DATA MODEL
In string item, addresses after string are 0.
One alarm uses 100 Holding Registers, if you would like to read only facility code and alarm number, most
of 100 Holding Registers area is not used. To communicate efficiently, please use “@”.
Example: $SNPX_ASG is set as follows.
Table 3-24. Example for efficient reading of only facility code and alarm number
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 12 ALM[E1]@1.4 1
The correspondence of address and alarm data of this setting is the following.
Table 3-25. Result of efficient alarm assignment
Address Assigned data
1 Alarm ID of alarm1
2 Alarm number of alarm1
3 Alarm ID of cause code of alarm1
4 Alarm number of cause code of alarm1
5 Alarm ID of alarm2
6 Alarm number of alarm2
7 Alarm ID of cause code of alarm2
8 Alarm number of cause code of alarm2
9 Alarm ID of alarm3
10 Alarm number of alarm3
11 Alarm ID of cause code of alarm3
12 Alarm number of cause code of alarm3
3.3.7 Assign Program Execution Status
$SNPX_ASG setting to assign program execution status to Holding Registers is the following.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-26. $SNPX_ASG variable descriptions for Program Execution Status assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One task uses 18 Holding Registers.
(You can change the number of Holding Registers for one task by adding “@” in
$VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”PRG[1]” to assign program execution status. The number in [ ] is task
number.
In single task system, program execution status always can be assigned by PRG[1].
In multi task system, when 2 tasks are running at the same time, PRG[1] and PRG[2]
shows the execution status of each task.
Which task is PRG[1] is decided by timing of execution and communication. But the
task that is read as PRG[1] is always read as PRG[1] until it is aborted.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1,-1
3 MODBUS DATA MODEL
Table 3-27. Holding Register content per task execution assignment
Address Description
10 Execution status 16bits signed integer
Aborted 0
Paused 1
Running 2
11-18 Parent program name 16 characters string
Name of the started program
When sub program is not called, it is the same as program name.
When program is aborted, all members become 0.
By assigning each strings to $VAR_NAME, the type of the program can be selected. And the meaning of
line number is changed depending on the situation.
Table 3-28. Syntax examples for access of specific type of program and line number access
$VAR_NAME Program name and line number
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-28. Syntax examples for access of specific type of program and line number access
3 MODBUS DATA MODEL
3.3.8 Assign System Variables
$SNPX_ASG setting to assign system variables to Holding Registers is the following.
Table 3-31. $SNPX_ASG variable descriptions for System Variable assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers for one system variable is defined by data type of
the system variable. Please refer the following data type list.
(You can change the number of Holding Registers for one system variable by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set system variable name, for example “$SNPX_ASG[1].$ADDRESS”.
If array system variable such as “$SNPX_ASG[1]” is set, array elements are
assigned continuously like Registers.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-32. Listing of supported data types of system variables for access through Holding Registers
rounded off to no decimal place.
3 MODBUS DATA MODEL
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3.3.9 Assign comment
$SNPX_ASG setting to assign comment of Register, Position register, String register and I/O to Holding
Registers is the following.
Table 3-35. $SNPX_ASG variable descriptions for Comment assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1 to 16384
$SIZE Meaning: Number of Holding Registers to assign.
One comment uses 40 Holding Registers. Please set according to the number
of comments to assign.
(You can change the number of Holding Registers for one comment by adding “@” in
$VAR_NAME)
Range: 1 to 16384
3 MODBUS DATA MODEL
Table 3-35. $SNPX_ASG variable descriptions for Comment assignment to Holding Registers
Variable in $SNPX_ASG Description
$VAR_NAME Meaning: String to specify robot data.
Please set ”R[C1]” to assign comment of register. The number in [ ] is index of
register.
To assign comment of position register, string register and I/O, please set the
following string.
Register R[C1]
Position register PR[C1]
String register SR[C1]
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
If you want to change input signal from this function, there is a way to change input signal through flag with
assigning the input signal to flag, which is rack 34 and slot 1.
Table 3-36. $SNPX_ASG variable descriptions for I/O data and Simulation Status assignment to Holding
Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers for one I/O value or simulation status is changed by
$MULTIPLY setting.
When $MULTIPLY is 1, one I/O value or simulation status uses one Holding
Register.
When $MULTIPLY is 0, one Holding Register includes 16 I/O value or simulation
status as bit image.
(Note: Value of GI/O and AI/O use one Holding Register even if $MULTIPLY is 0.)
Range: 1~16384
3 MODBUS DATA MODEL
Table 3-36. $SNPX_ASG variable descriptions for I/O data and Simulation Status assignment to Holding
Registers
Variable in $SNPX_ASG Description
$VAR_NAME Meaning: String to specify robot data.
Please set ”DI[1]” to assign DI[1] data. The number in [ ] is index of DI.
To assign I/O data or simulation status of the other type of I/O, please set the
following string.
Value Simulation
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
When $MULTIPLY is 0, 16 I/O data or 16 simulation status are assigned to one Holding Register. When
the value is ON, the corresponded bit of Holding Register is set to 1. When the value is OFF, the
corresponded bit of Holding Register is set to 0. I/O of lower index is assigned to lower bit of Holding
Register.
Example: When DI[1-16] is assigned to Holding Register, if only DI[1] is ON and the others are OFF, the
Holding Register is 1. If only DI[16] is ON and the others are OFF, the Holding Register is 32768 (in case
of unsigned 16 bit integer).
3.3.11 Assign Integrated PMC address data
$SNPX_ASG setting to Integrated PMC address data to Holding Registers is the following.
Table 3-37. $SNPX_ASG variable descriptions for PMC Address Data assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers corresponded to PMC address is different by the
specified PMC address that is byte address or bit address.
When bit address is specified, one bit PMC address is assigned to one Holding
Register.
When byte address is specified, two bytes PMC addresses are assigned to one
Holding Register.
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Set ”PMC1:X0” to assign data of PMC address X0. The "PMC1" part is PMC path
number. "PMCS" means DCS Safety PMC.
Data of bit address is assigned by specifying bit address such as ”PMC1:X0.0”.
Example: Assign X0.0~X1.7 data of 1st path PMC
When $SIZE is set to 1 and $VAR_NAME is set to ”PMC1:X0”, two byte address
3 MODBUS DATA MODEL
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3.3.12 Assign Symbol and Comment of Integrated PMC address
$SNPX_ASG setting to symbol and comment of Integrated PMC address to Holding Registers is the
following.
Table 3-40. $SNPX_ASG variable descriptions for Symbol and Comment of Integrated PMC Address assignment
to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One symbol or comment uses 40 Holding Registers. Please set according to
the number of comments to assign.
(You can change the number of Holding Registers for one symbol and comment by
adding “@” in $VAR_NAME.)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Set ”PMC1:S:X0” to assign symbol of PMC address X0. Set ”PMC1:C:X0” to assign
comment of the PMC address. The "PMC1" part is PMC path number. "PMCS"
means DCS Safety PMC.
Symbol and comment of bit address is assigned by specifying bit address such
as ”PMC1:S:X0.0”.
Example: PMC1:S:X0.0@1.5
The “PMC1:S:X0.0” part means that symbol of bit address from X0.0 is assigned
continuously.
The @1.5 part means that the top 10 characters are assigned.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1,-1
3 MODBUS DATA MODEL
The correspondence between Holding Registers and robot data by this setting is the following.
Table 3-42. Resulting Symbol and Comment of Integrated PMC Address access
Address Assigned robot data
1-5 Symbol of R0.0
6-10 Symbol of R0.1
11-15 Comment of D0
16-20 Comment of D1
3.3.13 Hints
Assigned data is not read correctly
If an HMI device etc. reads a Holding Register that is not assigned to any data, this Holding Register is
always read as 0. If Holding Register that the problem occurs is not 0, this Holding Register is assigned to
the other data.
For example, when $SNPX_ASG is set as follows, addresses 101-150 of Holding Registers are assigned by
both $SNPX_ASG[1] and $SNPX_ASG[2].
Table 3-43. Hints: Example of overlapping holding register assignment
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 1000 R[1]@1.1 1
$SNPX_ASG[2] 101 50 PR[1] 100
In this case, the $SNPX_ASG whose index is smaller is used.
Therefore, addresses 101-150 are assigned to R[101]-R[150], and PR[1] can not be accessed by an HMI
device etc.
If the read data of Holding Register is 0, there may also be duplicated assignment as above. Please check
duplication of $SNPX_ASG.
If $SNPX_ASG setting has problem even though assignment is not duplicated, please check
$VAR_NAME of $SNPX_ASG.
The following list shows the correct format of $VAR_NAME setting. If the setting is not match to them,
robot data is not assigned.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-44. Hints: Listing of valid $VAR_NAME setting
Correct format Note
“R[n]”
“PR[n]” If you specify group number, “:” must be specified between
group number and index.
“PR[Gn:n]
“SR[n]”
“POS[n]” If you specify group number, “:” must be specified between
group number and index.
“POS[Gn:n]
“ALM[n]” Alarm line number must be specified just after E, M, A, S or P.
The ":" must not be specified.
“ALM[En]”
“ALM[Pn]
“PRG[n]” Index must be specified just after M, K, MK or KM. The ":" must
not be specified.
“PRG[Mn]”, “PRG[Kn]”
“PRG[MKn]”, “PRG[KMn]”
System variable name The first character of system variable must be “$”.
$[KAREL program name]variable name Specify KAREL program name just after ‘$[‘, then specify ‘]’
and specify KAREL variable name just after ‘]’.
“DI[n]”, “DI[Sn]”, “DI[Cn]” Index must be specified just after S or C. The ":" must not be
specified.
“DO[n]”, “DO[Sn]”, “DO[Cn]”
“RI[n]”, “RI[Sn]”, “RI[Cn]”,
“RO[n]”, “RO[Sn]”, “RO[Cn]”
“UI[n]”, “UI[Cn]”
“UO[n]”, “UO[Cn]”
“SI[n]”, “SI[Cn]”
“SO[n]”, “SO[Cn]”
“WI[n]”, “WI[Sn]”, “WI[Cn]”,
“WO[n]”, “WO[Sn]”, “WO[Cn]”
3 MODBUS DATA MODEL
Table 3-44. Hints: Listing of valid $VAR_NAME setting
“WSI[n]”, “WSI[Sn]”, “WSI[Cn]”
“WSO[n]”, “WSO[Sn]”, “WSO[Cn]”
“GI[n]”, “GI[Sn]”, “GI[Cn]”
“GO[n]”, “GO[Sn]”, “GO[Cn]”
“AI[n]”, “AI[Sn]”, “AI[Cn]”
“AO[n]”, “AO[Sn]”, “AO[Cn]”
“F[n]”, “F[Cn]”
“M[n]”, “M[Cn]”


============================================================
3 1 Modbus data model
============================================================

3.1 Modbus data model
Modbus bases its data model on a series of tables.
Table 3-1. Listing of Modbus data model nodes
Table Object type Type of
Discrete input Single bit READ only
Coils Single bit READ-WRITE
Input Registers 16-bit word READ only
Holding Registers 16-bit word READ-WRITE
3.2 OPC UA Organization of MODBUS data model
This section applies only when using OPC UA client for HMI device communication with the built-in


============================================================
3 2 1 Correspondence of Modbus Address to Robot Data
============================================================

3.2.1 Correspondence of Modbus Address to Robot Data
Each “Table” has address area 1 ~ 65535. This function defines the following correspondence of Modbus
address to Robot data. The HMI device etc. can read or write the corresponded robot data by accessing
Modbus address.


============================================================
3 2 2 Modbus Function Code
============================================================

3.2.2 Modbus Function Code
When using MODBUS TCP communication (not OPC UA communication), this function supports the
following function codes.
Table 3-4. MODBUS TCP function codes
Function code name Code
Read Coils 01h
Read Discrete Inputs 02h
Read Holding Registers 03h
Read Input Register 04h
Write Single Coil 05h
Write Single Register 06h
Write Multiple Coils 0Fh
Write Multiple Registers 10h
3.3 ASSIGNMENT OF HOLDING REGISTERS
The address range 1 ~ 16384 (0~16383 when OPC UA) of Holding Registers can be assigned to various
Robot data. Each address has 2 bytes (16 bits) memory space. It is possible to assign 32 bit data to the
continuous 2 addresses, and to assign string data to the continuous plural addresses.
The following robot data can be assigned to the Holding Registers.
- Register data
- Position resister data
- String register data
- Current position
- Alarm history
- Program execution status (Running program name and line number)
- System variable data
- Comment of Register, Position register, String register and I/O
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
- I/O data and simulation status
- Integrated PMC address data
- Symbol and comment of Integrated PMC address.
The assignment between Robot data and Holding Registers is defined by setting of $SNPX_ASG. The
$SNPX_ASG is 80 arrays of $SNPX_ASG[1]~[80], every element has the following variables. Various
robot data can be assigned to the Holding Registers by setting $SNPX_ASG.
Table 3-5. $SNPX_ASG variable descriptions
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
It specifies the robot data type and index by string. The meaning of this variable is
different according to the assigned data type. Please refer to the description in
each robot data.
Example:


============================================================
3 2 OPC UA Organization of MODBUS data model
============================================================

3.2 OPC UA Organization of MODBUS data model
This section applies only when using OPC UA client for HMI device communication with the built-in


============================================================
3 3 ASSIGNMENT OF HOLDING REGISTERS
============================================================

3.3 ASSIGNMENT OF HOLDING REGISTERS
The address range 1 ~ 16384 (0~16383 when OPC UA) of Holding Registers can be assigned to various
Robot data. Each address has 2 bytes (16 bits) memory space. It is possible to assign 32 bit data to the
continuous 2 addresses, and to assign string data to the continuous plural addresses.
The following robot data can be assigned to the Holding Registers.
- Register data
- Position resister data
- String register data
- Current position
- Alarm history
- Program execution status (Running program name and line number)
- System variable data
- Comment of Register, Position register, String register and I/O
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
- I/O data and simulation status
- Integrated PMC address data
- Symbol and comment of Integrated PMC address.
The assignment between Robot data and Holding Registers is defined by setting of $SNPX_ASG. The
$SNPX_ASG is 80 arrays of $SNPX_ASG[1]~[80], every element has the following variables. Various
robot data can be assigned to the Holding Registers by setting $SNPX_ASG.
Table 3-5. $SNPX_ASG variable descriptions
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
It specifies the robot data type and index by string. The meaning of this variable is
different according to the assigned data type. Please refer to the description in
each robot data.
Example:


============================================================
3 3 1 Data type of Holding Registers
============================================================

3.3.1 Data type of Holding Registers
Data type of Holding Register is 16 bits integer. Data range of Holding Register is -32768 ~ 32767. The
value of assigned robot data is converted as follows according to the data type of the assigned data.
Table 3-8. Holding Register data type conversions
Assigned data Description
16 bits signed integer The Holding Register data is the same as the assigned data.
Range: -32768 ~ 32767
32 bits signed integer The continued 2 Holding Registers express a 32 bits signed integer. The former
Range: -2147483648 ~ address is lower 16 bits data, and the latter address is upper 16bits data.
2147483647
Real The continued 2 Holding Registers express a single precision binary real format of


============================================================
3 3 2 Assign Robot Registers
============================================================

3.3.2 Assign Robot Registers
$SNPX_ASG setting to assign Robot Registers to Holding Registers is the following.
Table 3-9. $SNPX_ASG variable descriptions for Robot Register assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One Register uses two Holding Registers.
(You can change the number of Holding Registers for one robot register by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”R[1]” to assign Register R[1]. The number in [ ] is the index of register.
Continued registers such as R[2]-R[5] can be assigned by one $SNPX_ASG
element. In this case, please set $SIZE to 8 because the number of registers to
assign is 4. And please set $VAR_NAME “R[2]”. The index 2 means the starting
index of the continuous assignment.
If “@1.1” is added just after the string, the number of Holding Registers for one
register is changed from 2 to 1. In this case, accessing data size becomes 16 bits.
Example: R[1]@1.1
“R[1]” part means to assign robot registers from index 1.
“@1.1” part means one register is accessed as 16 bits data.
$MULTIPLY Meaning: Multiplier
The value accessed by an HMI device etc. is multiplied by $MULTIPLY.
When $MULTIPLY is 0, it means that an HMI device etc. can access Holding
Registers as 32bits REAL data.
When it is not 0, an HMI device etc. accesses Holding Registers as 32bits signed
integer. And value is rounded off to no decimal place.
Range: 0.0001~10000, 0
Example: Register value is 123.45.
When $MULTIPLY is 1, Holding Register is 123
When $MULTIPLY is 10, Holding Register is 1235.
When $MULTIPLY is 0.1, Holding Register is 12.
When $MULTIPLY is 0, Holding Register is 123.45 of REAL
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
For example, $SNPX_ASG is set as follows.
Table 3-10. Example Robot Register assignments of $SNPX_ASG
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 2 R[1]@1.1 1
$SNPX_ASG[2] 3 4 R[1] 100
$SNPX_ASG[3] 7 4 R[2] 0.1
$SNPX_ASG[4] 11 2 R[1] 0
In this case, address of Holding Registers are corresponded to robot registers as follows.
Table 3-11. Result of example Robot Register assignments of $SNPX_ASG
Address Assigned data
1 R[1] as 16bits signed integer.
2 R[2] as 16bits signed integer.
3-4 R[1] multiplied by 100 as 32bits signed integer.
5-6 R[2] multiplied by 100 as 32bits signed integer.
7-8 R[2] divided by 10 as 32bits signed integer.
9-10 R[3] divided by 10 as 32bits signed integer.
11-12 R[1] as 32bits REAL
$SNPX_ASG[1] defines that 2 Holding Registers from address 1 to 2 are assigned to robot registers from


============================================================
3 3 3 Assign Position Registers
============================================================

3.3.3 Assign Position Registers
$SNPX_ASG setting to assign Position Registers to Holding Registers is the following.
Table 3-12. $SNPX_ASG variable descriptions for Position Register assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One Position Register uses 50 Holding Registers.
(You can change the number of Holding Registers for one position register by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”PR[1]” to assign Position Register PR[1]. The number in [ ] is the index of
position register.
Continued position registers like PR[2]-PR[5] can be assigned by one $SNPX_ASG
element. In this case, please set $SIZE 200 because the number of position
registers to assign is 4. And please set $VAR_NAME “PR[2]”. The index 2 means the
starting index of the continuous assignment.
In multi group system, PR[1] means group 1 data of PR[1]. Please set PR[G2:1] to
assign group 2 data of PR[1].
If “@” is added just after the string, the specified part of the position register is
assigned. This is explained later.
$MULTIPLY Meaning: Multiplier
Only REAL values like X, Y, Z and J1 are effected by this setting. Refer to the
table below to see which elements are affected.
The value accessed by an HMI device etc. is multiplied by $MULTIPLY.
When $MULTIPLY is 0, it means special that an HMI device etc. can access Holding
Registers as 32bits REAL data.
When it is not 0, an HMI device etc. accesses Holding Registers as 32bits signed
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-12. $SNPX_ASG variable descriptions for Position Register assignment to Holding Registers
integer. And value is rounded off to no decimal place.
Range: 0.0001~10000, 0
Example: Position register member value is 123.45.
When $MULTIPLY is 1, Holding Register is 123
When $MULTIPLY is 10, Holding Register is 1235.
When $MULTIPLY is 0.1, Holding Register is 12.
When $MULTIPLY is 0, Holding Register is 123.45 of REAL


============================================================
3 3 4 Assign String Registers
============================================================

3.3.4 Assign String Registers
$SNPX_ASG setting to assign String Registers to Holding Registers is the following.
Table 3-19. $SNPX_ASG variable descriptions for String Register assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One String Register uses 40 Holding Registers.
It is possible to deal with first 80 characters of one string register in default setting.
(You can change the number of Holding Registers for one string register by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”SR[1]” to assign String Register SR[1]. The number in [ ] is the index of
string register.
Continued string registers such as SR[2]-SR[5] can be assigned by one
$SNPX_ASG element. In this case, please set $SIZE 160 because the number of
string registers to assign is 4. And please set $VAR_NAME “SR[2]”. The index 2
means the starting index of the continuous assignment.
If “@” is added just after the string, the specified part of the String Register is
assigned.
Example: SR[1]@1.50
“SR[1]” means to assign String Registers from index 1.
“@1.50” means the first 100 characters of String Register data are assigned.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1, 26 -
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
3.3.5 Assign Current Position
$SNPX_ASG setting to assign Current Position to Holding Registers is the following.
Table 3-20. $SNPX_ASG variable descriptions for Current Position assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Current Position uses 50 Holding Registers.
(You can change the number of Holding Registers for Current Position by adding “@”
in $VAR_NAME)
Range: 1~16384


============================================================
3 3 5 Assign Current Position
============================================================

3.3.5 Assign Current Position
$SNPX_ASG setting to assign Current Position to Holding Registers is the following.
Table 3-20. $SNPX_ASG variable descriptions for Current Position assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
Current Position uses 50 Holding Registers.
(You can change the number of Holding Registers for Current Position by adding “@”
in $VAR_NAME)
Range: 1~16384


============================================================
3 3 6 Assign Alarm History
============================================================

3.3.6 Assign Alarm History
$SNPX_ASG setting to assign Alarm history to Holding Registers is the following.
Table 3-22. $SNPX_ASG variable descriptions for Alarm History assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One alarm uses 100 Holding Registers.
(You can change the number of Holding Registers for one alarm by adding “@” in
$VAR_NAME)
Range: 1~16384


============================================================
3 3 7 Assign Program Execution Status
============================================================

3.3.7 Assign Program Execution Status
$SNPX_ASG setting to assign program execution status to Holding Registers is the following.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-26. $SNPX_ASG variable descriptions for Program Execution Status assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One task uses 18 Holding Registers.
(You can change the number of Holding Registers for one task by adding “@” in
$VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set ”PRG[1]” to assign program execution status. The number in [ ] is task
number.
In single task system, program execution status always can be assigned by PRG[1].
In multi task system, when 2 tasks are running at the same time, PRG[1] and PRG[2]
shows the execution status of each task.
Which task is PRG[1] is decided by timing of execution and communication. But the
task that is read as PRG[1] is always read as PRG[1] until it is aborted.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1,-1


============================================================
3 3 8 Assign System Variables
============================================================

3.3.8 Assign System Variables
$SNPX_ASG setting to assign system variables to Holding Registers is the following.
Table 3-31. $SNPX_ASG variable descriptions for System Variable assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers for one system variable is defined by data type of
the system variable. Please refer the following data type list.
(You can change the number of Holding Registers for one system variable by adding
“@” in $VAR_NAME)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Please set system variable name, for example “$SNPX_ASG[1].$ADDRESS”.
If array system variable such as “$SNPX_ASG[1]” is set, array elements are
assigned continuously like Registers.


============================================================
3 3 9 Assign comment
============================================================

3.3.9 Assign comment
$SNPX_ASG setting to assign comment of Register, Position register, String register and I/O to Holding
Registers is the following.
Table 3-35. $SNPX_ASG variable descriptions for Comment assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1 to 16384
$SIZE Meaning: Number of Holding Registers to assign.
One comment uses 40 Holding Registers. Please set according to the number
of comments to assign.
(You can change the number of Holding Registers for one comment by adding “@” in
$VAR_NAME)
Range: 1 to 16384


============================================================
3 3 10 Assign I O data and simulation status
============================================================

3.3.10 Assign I/O data and simulation status
$SNPX_ASG setting to assign I/O data and simulation status to Holding Registers is the following.
Input signal can’t be changed from this function even though it is assigned to Holding Registers.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
If you want to change input signal from this function, there is a way to change input signal through flag with
assigning the input signal to flag, which is rack 34 and slot 1.
Table 3-36. $SNPX_ASG variable descriptions for I/O data and Simulation Status assignment to Holding
Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers for one I/O value or simulation status is changed by
$MULTIPLY setting.
When $MULTIPLY is 1, one I/O value or simulation status uses one Holding
Register.
When $MULTIPLY is 0, one Holding Register includes 16 I/O value or simulation
status as bit image.
(Note: Value of GI/O and AI/O use one Holding Register even if $MULTIPLY is 0.)
Range: 1~16384


============================================================
3 3 11 Assign Integrated PMC address data
============================================================

3.3.11 Assign Integrated PMC address data
$SNPX_ASG setting to Integrated PMC address data to Holding Registers is the following.
Table 3-37. $SNPX_ASG variable descriptions for PMC Address Data assignment to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
The number of Holding Registers corresponded to PMC address is different by the
specified PMC address that is byte address or bit address.
When bit address is specified, one bit PMC address is assigned to one Holding
Register.
When byte address is specified, two bytes PMC addresses are assigned to one
Holding Register.
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Set ”PMC1:X0” to assign data of PMC address X0. The "PMC1" part is PMC path
number. "PMCS" means DCS Safety PMC.
Data of bit address is assigned by specifying bit address such as ”PMC1:X0.0”.
Example: Assign X0.0~X1.7 data of 1st path PMC
When $SIZE is set to 1 and $VAR_NAME is set to ”PMC1:X0”, two byte address


============================================================
3 3 12 Assign Symbol and Comment of Integrated PMC address
============================================================

3.3.12 Assign Symbol and Comment of Integrated PMC address
$SNPX_ASG setting to symbol and comment of Integrated PMC address to Holding Registers is the
following.
Table 3-40. $SNPX_ASG variable descriptions for Symbol and Comment of Integrated PMC Address assignment
to Holding Registers
Variable in $SNPX_ASG Description
$ADDRESS Meaning: Start address of Holding Registers to assign.
Range: 1~16384
$SIZE Meaning: Number of Holding Registers to assign.
One symbol or comment uses 40 Holding Registers. Please set according to
the number of comments to assign.
(You can change the number of Holding Registers for one symbol and comment by
adding “@” in $VAR_NAME.)
Range: 1~16384
$VAR_NAME Meaning: String to specify robot data.
Set ”PMC1:S:X0” to assign symbol of PMC address X0. Set ”PMC1:C:X0” to assign
comment of the PMC address. The "PMC1" part is PMC path number. "PMCS"
means DCS Safety PMC.
Symbol and comment of bit address is assigned by specifying bit address such
as ”PMC1:S:X0.0”.
Example: PMC1:S:X0.0@1.5
The “PMC1:S:X0.0” part means that symbol of bit address from X0.0 is assigned
continuously.
The @1.5 part means that the top 10 characters are assigned.
$MULTIPLY Meaning: Specify byte order of string.
Range: 1,-1


============================================================
3 3 13 Hints
============================================================

3.3.13 Hints
Assigned data is not read correctly
If an HMI device etc. reads a Holding Register that is not assigned to any data, this Holding Register is
always read as 0. If Holding Register that the problem occurs is not 0, this Holding Register is assigned to
the other data.
For example, when $SNPX_ASG is set as follows, addresses 101-150 of Holding Registers are assigned by
both $SNPX_ASG[1] and $SNPX_ASG[2].
Table 3-43. Hints: Example of overlapping holding register assignment
$ADDRESS $SIZE $VAR_NAME $MULTIPLY
$SNPX_ASG[1] 1 1000 R[1]@1.1 1
$SNPX_ASG[2] 101 50 PR[1] 100
In this case, the $SNPX_ASG whose index is smaller is used.
Therefore, addresses 101-150 are assigned to R[101]-R[150], and PR[1] can not be accessed by an HMI
device etc.
If the read data of Holding Register is 0, there may also be duplicated assignment as above. Please check
duplication of $SNPX_ASG.
If $SNPX_ASG setting has problem even though assignment is not duplicated, please check
$VAR_NAME of $SNPX_ASG.
The following list shows the correct format of $VAR_NAME setting. If the setting is not match to them,
robot data is not assigned.
3 MODBUS DATA MODEL MARUCHOPM05191E REV A
Table 3-44. Hints: Listing of valid $VAR_NAME setting
Correct format Note
“R[n]”
“PR[n]” If you specify group number, “:” must be specified between
group number and index.
“PR[Gn:n]
“SR[n]”
“POS[n]” If you specify group number, “:” must be specified between
group number and index.
“POS[Gn:n]
“ALM[n]” Alarm line number must be specified just after E, M, A, S or P.
The ":" must not be specified.
“ALM[En]”
“ALM[Pn]
“PRG[n]” Index must be specified just after M, K, MK or KM. The ":" must
not be specified.
“PRG[Mn]”, “PRG[Kn]”
“PRG[MKn]”, “PRG[KMn]”
System variable name The first character of system variable must be “$”.
$[KAREL program name]variable name Specify KAREL program name just after ‘$[‘, then specify ‘]’
and specify KAREL variable name just after ‘]’.
“DI[n]”, “DI[Sn]”, “DI[Cn]” Index must be specified just after S or C. The ":" must not be
specified.
“DO[n]”, “DO[Sn]”, “DO[Cn]”
“RI[n]”, “RI[Sn]”, “RI[Cn]”,
“RO[n]”, “RO[Sn]”, “RO[Cn]”
“UI[n]”, “UI[Cn]”
“UO[n]”, “UO[Cn]”
“SI[n]”, “SI[Cn]”
“SO[n]”, “SO[Cn]”
“WI[n]”, “WI[Sn]”, “WI[Cn]”,
“WO[n]”, “WO[Sn]”, “WO[Cn]”


============================================================
4 DYNAMIC ASSIGNMENT TO HOLDING REGISTERS
============================================================

4 DYNAMIC ASSIGNMENT TO HOLDING REGISTERS MARUCHOPM05191E REV A
4 DYNAMIC ASSIGNMENT TO HOLDING
4 DYNAMIC ASSIGNMENT TO HOLDING REGISTERS
Example: If assignments are set as following
Table 3-45. Example of desired dynamic assignment to Holding Registers
No. $ADDRESS $SIZE $VAR_NAME $MULTIPLY
1 1 2 R[1]@1.1 1
2 3 4 R[1] 100
3 7 4 R[2] 0.1
4 11 2 R[1] 0
Write following strings in order:



## Citations

- Primary: FANUC Modbus/OPC UA Manual (keywords: Modbus, TCP, RTU, holding register, HMI, communication, address mapping, function code, PLC, register assignment, I/O mapping, PMC, system variables, OPC UA, Ethernet, slave, connection).
- Applicability: R-30iB Plus, HMI Communication, PLC Integration.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/protocols/FANUC_Modbus_Reference.txt`.
- Classification: protocols / topic=protocols.

