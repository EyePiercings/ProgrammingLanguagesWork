class DeleteCommand(protected val buffer: Buffer, protected val count: Int) extends EditCommand(buffer){
  val pastStr = buffer.getText(buffer.size()-count, buffer.size())
  override def execute(): Unit = {
    buffer.setCursor(buffer.getCursor()-count)
    buffer.delete(count)
  }

  override def undo(): Unit = {
    buffer.insert(pastStr)
    buffer.setCursor(buffer.getCursor()+count)
  }

  override def toString(): String = {
    "[Delete " + count + "]"
  }
}
