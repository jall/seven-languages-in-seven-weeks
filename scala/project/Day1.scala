//  The Scala API
// https://docs.scala-lang.org/api/all.html

// A comparison of Java and Scala
// https://www.guru99.com/scala-vs-java.html

// A discussion of `val` versus `var`



class Board {
  var positions = ((Nil,Nil,Nil),
                   (Nil,Nil,Nil),
                   (Nil,Nil,Nil))

  def move(x: Int, y: Int, player: "X" | "O") {
    if (this.isSet(x, y)) {
      println(this.get(x, y))
      return this
    }

    if (this.isComplete()) {
      println("The game is over!")
      return this
    }

    return
  }

  def isComplete(): Boolean {
    return false
  }
}
