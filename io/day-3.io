// Enhance the XML program to add spaces to show the indentation structure
Builder := Object clone

Builder forward := method(
  indentation := if(call message hasSlot("indentation"), call message indentation, 0)
  unitOfSpace := "  "
  spacing := indentation repeat(unitOfSpace)
  if(spacing == nil, spacing = "")
  writeln(spacing, "<", call message name, ">")
  call message arguments foreach(arg,
    arg indentation := indentation + 2;
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(spacing, unitOfSpace, content)))
  writeln(spacing, "</", call message name,">"))

"" println
"Builder:" println

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"))

// Create a list syntax that uses brackets
squareBrackets := method(
  array := list()
  call message arguments foreach(arg,
    array append (call sender doMessage(arg)))
  array)

"" println
"List literals:" println
doString("[1,2,3]") println

// Enhance the XML program to handle attributes: if the first argument is a map
// (use the curly brackets syntax), add attributes to the XML program.
OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)))

EnhancedBuilder := Object clone

EnhancedBuilder curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg))
  r)

EnhancedBuilder forward := method(
  indentation := if(call message hasSlot("indentation"), call message indentation, 0)
  unitOfSpace := "  "
  spacing := indentation repeat(unitOfSpace)
  isFirst := spacing == nil
  if(isFirst, spacing = "")

  write(spacing, "<", call message name)
  if (isFirst, write(">\n"))

  call message arguments foreach(arg,
    arg indentation := indentation + 2;
    content := self doMessage(arg);
    if(content type == "Map", content map(key, value,
      write(" ", key, "='", value, "'"))))

  if (isFirst == false, write(">\n"))

  call message arguments foreach(arg,
    arg indentation := indentation + 2;
    if(content type == "Sequence", writeln(spacing, unitOfSpace, content)))

  writeln(spacing, "</", call message name,">"))

"" println
"EnhancedBuilder:" println

doString(File with("enhanced-builder-syntax.txt") openForReading contents)
