#!/usr/bin/python3
import os
import sys

from changewindowbordertext import globalvalue
howmany=1
commandcall=sys.argv[1]

def fixarguments():
    global commandcall
    global howmany
    if len(sys.argv) == 2:
        commandvalue=sys.argv[1]
        commandcall=commandvalue
        print(commandcall)
    elif len(sys.argv) == 3:
        intvalue=int(sys.argv[2])
        commandcall=sys.argv[1]
        if isinstance(intvalue, (int, float)):
            howmany = intvalue
            print(howmany)
        else:
            howmany = 1
            print(howmany)
    elif len(sys.argv) > 3:
        print("Error, too much arguments")

fixarguments()

# Functions Area

def writenewvalue(value):
    location = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
    textfile = open(os.path.join(location, 'changewindowbordertext.py'),"w")
    newtext='globalvalue={}'.format(value)
    textfile.write(newtext)
    textfile.close

def applyexisting():
    global globalvalue
    existingvalue = 'i3-msg [class="^.*"] border pixel {}'.format(globalvalue)
    os.system(existingvalue)

def add():
    global howmany
    global globalvalue
    globalvalue+=howmany
    newadd='i3-msg [class="^.*"] border pixel {}'.format(globalvalue)
    print(newadd)
    os.system(newadd)
    writenewvalue(globalvalue)

def subtract():
    global howmany
    global globalvalue
    if (globalvalue - howmany) < 0:
        globalvalue=0
        newminus='i3-msg [class="^.*"] border pixel {}'.format(globalvalue)
        print(newminus)
    else:
        globalvalue-=howmany
        newminus='i3-msg [class="^.*"] border pixel {}'.format(globalvalue)
        print(newminus)
    os.system(newminus)
    writenewvalue(globalvalue)

if commandcall == "add":
    add()
elif commandcall == "subtract":
    subtract()
elif commandcall == "apply":
    applyexisting()
else:
    print("error, unknown command")
