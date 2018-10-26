class InsertCommand(protected val buffer: Buffer, text: String) extends EditCommand(buffer) {
    var txt = text
    val len = text.length
    val loc = buffer.getCursor()
  println("Location: " + (loc+len))
  override def execute(): Unit = {
    buffer.insert(text)
    println(text)
    buffer.setCursor(loc + len)
  }
  override def undo(): Unit = { 
    buffer.setCursor(buffer.getCursor()-len)
    buffer.delete(len) 
  }
  override def toString(): String = {
    "[Insert " + "\"" + text + "\"" + "]"
  }
  override def compose(other : EditCommand) : Option[EditCommand] = {
    if(other.isInstanceOf[InsertCommand]) {
      val o: InsertCommand = other.asInstanceOf[InsertCommand]
      val newStr = o.txt + this.txt
      val ic = new InsertCommand(buffer, newStr)
      Some(ic)
    } else {
      None
    }
  }
}
