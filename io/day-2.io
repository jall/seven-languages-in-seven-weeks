# Loops
i := 1
while(i <= 11, i println; i = i + 1); "This one goes to 11" println

"" println

# Adding xor
OperatorTable addOperator("xor", 11)
true xor := method(bool, if (bool, false, true))
false xor := method(bool, if (bool, true, false))

# Messages
postOffice := Object clone
postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)

mailer := Object clone
mailer deliver := method(postOffice packageSender)

# Control structures
unless := method(
  (call sender doMessage(call message argAt(0))) ifFalse(
      call sender doMessage(call message argAt(1))) ifTrue(
      call sender doMessage(call message argAt(2))))

westley := Object clone
princessButtercup := Object clone

trueLove := 1 == 1
westley princessButtercup unless(trueLove, ("It is false" println), ("It is true" println))

"" println

# Reflection
Object ancestors := method(
  prototype := self proto
  if(prototype != Object,
    writeln("Slots of ", prototype type, "\n-------------------")
    prototype slotNames foreach(slotName, writeln(slotName))

    writeln
    prototype ancestors))

Animal := Object clone
Animal speak := method("ambigous animal noise" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors

"" println

# Fibonacci
fib := method(n, if(n <= 2, 1, fib(n - 1) + fib(n - 2)))
("15th Fibonacci (recursive): " .. fib(15)) println

fibLoop := method(n, (
  tmp := 0;
  overPrevious := 0;
  previous := 1;
  for(i, 2, n, (
    tmp = previous;
    previous = previous + overPrevious;
    overPrevious = tmp));
  previous + overPrevious))
("18th Fibonacci (loop): " .. fibLoop(18)) println

"" println

# Redefine `/` to return 0 if denominator is 0
Number originalDivide := Number getSlot("/")
OperatorTable addOperator("originalDivide", 2)
Number / := method(denominator,
  if(denominator == 0,
    0,
    (call target originalDivide denominator)))
("1 / 0 = " .. (1 / 0)) println
Number / := Number getSlot("originalDivide")
Number removeSlot("originalDivide")

"" println

# Add up all of the numbers in a multi-dimensional array
matrixSummer := method(matrix, matrix flatten sum)
twoDMatrix := list(list(1,2,3), list(4,5,6), list(7,8,9))
matrixSummer(twoDMatrix)

"" println

# Add a slot calledmyAverageto a list that computes the average ofall the numbers in a list.
myList := list(1,2,3,4,5,6,7,8)
myList myAverage := method(if((self size) == 0, nil, (self sum) / (self size)))
myList myAverage

"" println

# Write a prototype for a two-dimensional list.
List2 := List clone
List2 dim := method(x, y,
  self setSize(x) mapInPlace(idx, value,
    col := List clone;
    col setSize(y)))
List2 get := method(x, y, self at(x) at(y))
List2 set := method(x, y, value, (self at(x) atPut(y, value)); self)

List2 transpose := method(
  new := self copy;
  self foreach(x, col,
    col foreach(y, value,
      new set(y, x, value)));
  self := new)

# Write a list to file and read it again
storableList := list(1, "hello", 2)
println storableList

f := File with("storage.txt")
f openForUpdating
f write(storableList asEncodedList)
f close

f2 := File with("storage.txt")
f2 openForReading
restoredList := List fromEncodedList(f2 contents)
f2 close
println restoredList

# Write a program that gives you ten tries to guess a random number from 1–100
guessedCorrectly := false
numberOfGuesses := 0
answer := (Random value(99) floor) + 1
while(numberOfGuesses < 10 and guessedCorrectly != true,
  "Guess a number between 1 and 100" println;
  input := File standardInput readLine;
  if(input == (answer asSimpleString),
    (guessedCorrectly = true; "Well done, that's correct!"),
    numberOfGuesses = numberOfGuesses + 1))
if(guessedCorrectly != true, "Sorry, you didn't guess it this time!")
