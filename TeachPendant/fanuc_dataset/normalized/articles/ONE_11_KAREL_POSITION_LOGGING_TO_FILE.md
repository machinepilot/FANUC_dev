---
id: ONE_11_KAREL_POSITION_LOGGING_TO_FILE
title: "KAREL Position Logging to File"
topic: karel
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: KAREL
source:
  type: third_party_integrator
  title: "ONE Robotics Company Blog"
  tier: T3
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# KAREL Position Logging to File

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_11_KAREL_Position_Logging_to_File.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# KAREL Position Logging to File

Filed under:FANUCKAREL Programming
I received a question via email the other day where someone wanted to know how to log timestamped position data to a file. As luck would have it, I’d been meaning to write a post about something like this for quite a while now.
This application ends up being a great example that covers a broad range of KAREL programming fundamentals:
Let’s get started by considering our desired TPE interface. We want to be able to log Position Register (PR) values (X, Y, Z, W, P, R) to a logfile whenever this KAREL program is called from a TP program. For maximum flexibility, let’s accept two parameters: one will be anINTEGERid for the PR we want to log, and the other will be aSTRINGfilename for the desired logfile.
Here’s how you might use this utility from a TP program:
We’re going to record comma-separated values (CSV) with the following “schema”:timestamp, PR id, X, Y, Z, W, P, R. The output will look something like this when we’re done:
At minimum we are going to need three variables for our KAREL program:
Let’s create a skeleton program with these three variables:
Next we’ll add some functionality by grabbing our parameters from the TP environment via theGET_TPE_PRMbuilt-in. The interface for this procedure is as follows:
The first parameter,paramNo, is the only input parameter. The rest are outputs. As you can see, each call toGET_TPE_PRMwill return anINTEGERtodataType(1 forINTEGER, 2 forREALand 3 forSTRING), the actual value in one ofintVal,realValorstrVal, and astatusoutput. The procedure follows the standard FANUC KAREL convention of using 0 as a “normal” status; anything non-zero indicates an error.
Here’s the code we need to get the target Position Register id:
You may have noticed an issue with our program already. We’ve provided some variables to the procedure that we haven’t defined yet.
TheGET_TPE_PRMbuilt-in requires a variables for all three data types, even if we know that we only want one of them. Let’s satisfy the interface by adding a few “temp” or “throw-away” variables to ourVARdeclaration section.
Your program should look like this and compile just fine:
We’ve fixed our program and gotten it to compile, but there are a couple of glaring issues with our use ofGET_TPE_PRM:
These are easy enough to fix. Add a couple ofIF-blocks immediately beneath the call toGET_TPE_PRMto check for each error condition. Our error reporting will just be a simple message written to the TP message line before aborting the log program entirely.
TheIF-statement and associated block should be easy enough to follow (though the<>operator for “not equal” may look strange to you).
TheWRITEbuilt-in is used as follows:
Thefile_varis optional (TPDISPLAYis the default, theUSERscreen), and you only need onedata_item, but the routine will accept more separated by commas.
Our statement writes a simple message to the pre-definedTPERRORfile (again, TP message line) followed by the predefinedCR(carriage return) constant. (If you don’t send a carriage return, your subsequent error messages won’t clear the line and will pile up.)
I don’t like thedataType<>1expression. What does the1represent? I prefer to define constants for situations like this rather than just having random integers lying around with no meaning behind them.
After adding some code to get the second logfile name parameter, your program should look like this:
NOTE:I added a line using theCHRbuilt-in to send the special 128 character code toTPERRORwhich clears the window.
This will work, but there’s a lot of duplication here. Let’s take this opportunity to refactor into dedicated subroutines for gettingINTEGERs andSTRINGs from TPE parameters:
Ok so we did a lot in this step. Let’s break it down:
While our program did get longer, the all-important “main” section of our code is only two lines long (outside of clearing theTPERRORscreen), and it’s easy to tell what it’s doing. (If we had more than 12 characters available for identifiers, I’d probably rename each routine to something likeGET_TPE_INT_OR_ABORTto make the functionality more clear. Alternatively, you could leave thestatuschecking to the main part of the routine to keep it obvious.)
By separating this other functionality into separateROUTINES, we’ve reduced our complexity and increased the “testability” of our program. (i.e. we could easily test theGET_TPE_PRM2routine to make sure that it writes an error on a non-zero status, but it might be more difficult to validate that when all that logic just exists within our main code block.)
The next major bit of functionality is getting the current time and formatting it appropriately. The good news is FANUC provides a couple of built-in procedures for this; the bad news is that one of them doesn’t work quite right.
TheGET_TIMEbuilt-in accepts oneINTEGERparameter which is where the current time will be stored. You might expect a UNIX timestamp here (number of seconds since January 1, 1970), but a FANUC timestamp is a little funky. The year, month, day, hour, minute and second (in two-second intervals) are stored in bits 31-25, 24-21, 20-16, 15-11, 10-5 and 4-0 respectively.
It’s great that we can get the current time, but we want to log in a  more readable format (e.g.29-OCT-18 07:56:42). Luckily FANUC provides another built-in to do just this:CNV_TIME_STR. UnfortunatelyCNV_TIME_STRseems to only return a readable timestamp to the nearest minute.
We’ll need to write another wrapper routine to add the seconds functionality:
First we use FANUC’s built-in to get our timestamp in this format:29-OCT-18 07:56(note the trailing space). TheSUB_STRbuilt-in is used to only grab the first 15 characters of the string, eliminating that pesky trailing space before concatenating a ‘:’ onto the end. (STRINGconcatenation is easy in KAREL, just use the+operator between twoSTRINGs.)
Because FANUC stores the seconds of a timestamp in bits 4-0, we can get the value of just those bits by bitwiseAND-ing our timestamp with the number 31 (binary11111). We then multiply by two since those seconds are actually stored in two-second increments.
We convert this new integer value to a string via theCNV_INT_STRbuilt-in. Unfortunately this built-in puts an annoying leading space on our string, so we get rid of it with theSUB_STRbuilt-in. We add on a leading0if we have to in order to keep things consistent with how FANUC’s built-in reports months and days. Finally we concatenate the original timestamp with our secondsSTRINGas the final output value.
Once this routine is added, we simply add a couple of lines to our main program to get our nicely formatted timestamp (after adding the timeInt and timeStr variables as well):
Next we have to get the value of the target Position Register. For this we’ll use theGET_POS_REGbuilt-in which only takes anINTEGERid input and anINTEGERstatus output.
NOTE:Be sure to add anXYZWPRvariable namedposregand anINTEGERstatusvariable.
We’ll also want to check to make sure no part of our Position Register is uninitialized before trying to write those components to our logfile. (You’ll get an error otherwise if a component isUNINIT.)
We’re almost done. Here’s what we have so far:
The last bit of functionality is actually writing data to our logfile. In order to do this we need to 1) open the file for writing, 2) write our data and 3) close the file when we’re done.
For reference, here’s how we want the data to look again:
We can open files with KAREL with the appropriately namedOPEN FILEstatement. The interface is as follows:
The usage string determines how the file will be accessed:
If you specify “RO”, you wont’ be able to write to the file (not good for logging). “RW” will allow you to write to the file, but it will clear the contents each time the file is accessed (not good for logging). “UD” won’t clear the contents of the file, but it will overwrite your existing data (not good for logging). Finally, “AP” will simply append new data to the end of the file (good for logging).
Remember that the file name for our logfile is passed via a TPE parameter,prmLogFile:
We can then use theIO_STATUSbuilt-in to make sure the file was opened succesfully:
Now that the file has been opened, we can write some data. We’ve already seen theWRITEstatement; we just need to change thefile_vartologFileso the operation works on the file we just opened for appending.
A first pass to include all our data might look like this:
This would work just fine, but I dont’ like the defaultREALnumber formatting when writing (scientific notation). KAREL allows you to add formatting specifiers to items withinREADandWRITEstatements.
ForREALnumbers, the first number indicates how many characters will be written. The second number indicates how many numbers after the decimal will be included. To make sure we don’t lose data, we’ll use9as the first format specifier and a2for the second format specifier to only include two numbers after the decimal:
Let’s check theIO_STATUSagain to make sure ourWRITEoperation was succesfull:
You can always debug thestatusvalue and use the Error Code manual to find out what’s wrong. Thestatuscodes are output like so:FFCCCwhereFFis the facility code andCCCis the actual error code. For example, astatuscode of 66013 corresponds to facility code 66, HRTL, code 13:HRTL-013Access permission denied. (Interestingly enough, I get this error code when attempting toWRITEto a read-onlyFILEhandle. I would have expected to get a code of02040:FILE-040Illegal file access mode. Oh well.)
Lastly, let’s be a good citizen and close the file before returning to the TP program:
Here’s the KAREL logging utility program in its entirety:
Not too bad, right?
The easiest way to view your logfile is with a web browser:http://robot.host/pip/logpr.dt. You could also grab it via FTP (be sure tocd pip:to change to thePIP:device).
One last thing:
You may be wondering why I chose to write to a file on thePIP:device in my example usage:
We could written toUD1:orUT1:just as easily.
Here are two reasons why thePIP:device is perfect for this application:
I hope you’ve found this KAREL programming tutorial helpful. As always, let me know if you have any questions.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2018/how-to-write-a-fanuc-karel-logging-utility/

## Citations

- Primary: ONE Robotics Company Blog (keywords: KAREL, position logging, file I/O, PR, timestamp, data logging, CSV).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_11_KAREL_Position_Logging_to_File.txt`.
- Classification: articles / topic=karel.

