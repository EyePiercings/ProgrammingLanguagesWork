class MoveCommand(protected val buffer: Buffer, loc: Int) extends EditCommand(buffer) {
  val lastPos = buffer.getCursor()
  override def execute(): Unit = {
    val l = if (loc < 0) { 
      0 
    } else if (loc > buffer.size()) { 
      buffer.size() 
    } else {
      loc
    }
    buffer.setCursor(l);

  }
  override def undo(): Unit = { buffer.setCursor(lastPos) }
  override def toString(): String = {
    "[Move to " + loc + "]"
  }
}
