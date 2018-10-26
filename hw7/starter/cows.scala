object cows {
  def main(args: Array[String]): Unit = {
    val lines = scala.io.Source.fromFile("cows.txt").getLines()
    val data = lines.toList
    for(i <- data) println(i)
    println("Part b")
    data.foreach { println }
    println("Part c")
    for(i <- data if (i.contains("s") || i.contains("S"))) println(i)
    println("Part d")
    for(i <- data if (i.contains("s") || i.contains("S")) if !(i.contains("h") || i.contains("H"))) println(i)
    println("Part e")
    val jdata = for(i <- data if i.startsWith("1")) yield i
    jdata.foreach { println }
  }
}
