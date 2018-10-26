class DeleteCommand(protected val buffer: Buffer, protected val count: Int) extends EditCommand(buffer){
  val pastStr = buffer.getText(buffer.size()-count, buffer.size())
  val c = count
  override def execute(): Unit = {
    println(buffer.getCursor()-c)
    buffer.setCursor(buffer.getCursor()-c)
    buffer.delete(count)
  }

  override def undo(): Unit = {
    buffer.insert(pastStr)
    buffer.setCursor(buffer.getCursor()+c)
  }

  override def toString(): String = {
    "[Delete " + count + "]"
  }

  override def compose(other : EditCommand) : Option[EditCommand] = {
    if(other.isInstanceOf[DeleteCommand]) {
      val o : DeleteCommand = other.asInstanceOf[DeleteCommand]
      val newCount = o.c + this.c
      val dc = new DeleteCommand(buffer, newCount)
      Some(dc)
    } else {
      None
    }
  }
}
