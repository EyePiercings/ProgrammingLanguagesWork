class MoveCommand(protected val buffer: Buffer, loc: Int) extends EditCommand(buffer) {
  val lastPos = buffer.getCursor()
  println(lastPos)
  val l = loc
  override def execute(): Unit = {
    val l = if (loc < 0) { 
      0 
    } else if (loc > buffer.size()) { 
      buffer.size() 
    } else {
      loc
    }
    buffer.setCursor(loc);

  }
  override def undo(): Unit = { buffer.setCursor(lastPos) }
  override def toString(): String = {
    "[Move to " + loc + "]"
  }
  override def compose(other : EditCommand) : Option[EditCommand] = {
    if(other.isInstanceOf[MoveCommand]) {
      val o : MoveCommand = other.asInstanceOf[MoveCommand]
      val newLoc = l
      val mc = new MoveCommand(buffer, newLoc)
      Some(mc)
    } else {
      None
    }
  }
}
