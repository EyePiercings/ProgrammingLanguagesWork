class InsertCommand(protected val buffer: Buffer, text: String) extends EditCommand(buffer) {
    val len = text.length
    val loc = buffer.getCursor()
  override def execute(): Unit = {
    buffer.insert(text)
    buffer.setCursor(loc + len)
  }
  override def undo(): Unit = { 
    buffer.setCursor(buffer.getCursor()-len)
    buffer.delete(len) 
  }
  override def toString(): String = {
    "[Insert " + "\"" + text + "\"" + "]"
  }
}
