#!/usr/bin/env io

# Sample problems
# http://iolanguage.org/guide/guide.html#Syntax

# Community
# https://stackoverflow.com/questions/tagged/iolanguage

# Style guide
# http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

# Evaluate `1 + 1` and then `1 + "one"`. Is Io strongly typed or weakly typed? Support your answer with code.
1 + 1

e := try((1 + "one") "Weakly typed, no error thrown for type conversion" println)
e catch(Exception, "Strongly typed: error message for `1 + \"one\"` is a type comparison" println)

# Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.

("0 is " .. if(0, "truthy", "falsy")) println
("Empty string is " .. if("", "truthy", "falsy")) println
("nil is " .. if(nil, "truthy", "falsy")) println

# What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)? When would you use each one?

# `=`: assign to an existing slot
# `:=`: create a new slot & assign to it
# `::=`: create a new slot, create a setter, assign to it
# `==`: equality comparison

# How can you tell what slots a prototype supports?

Vehicle := Object clone
Vehicle slotNames println

# Run an Io program from a file.

# `io io/day-1.io`

# Execute the code in a slot given its name.

Vehicle drive := method("I'm driving!" println)
Vehicle run := method(name, self getSlot(name) call)
Vehicle run("drive")
