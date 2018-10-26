import java.util.InputMismatchException
import java.util.Scanner
import scala.collection.mutable.ListBuffer

/**
 * Simple Edit Buffer
 */
object TextEditor {
  
  protected val input = new Scanner(System.in);
  
  /** The "document" that the editor operates on. */
  protected val buffer = new Buffer();
  
  /** Data structure holding EditCommands. */
  protected var comArray = new ListBuffer[EditCommand]();
  protected var index = 0
  /**
   * Return the current cursor position in the buffer.
n   */
  def getCursor() = {
    buffer.getCursor();
  }
  
  /**
   * Set the current cursor position in the buffer.  
   * <p> 
   * Clips the cursor movement to the ends of the buffer.  Ie, if loc
   * < 0, move cursor to 0, and if loc > buffer.size() move cursor
   * to buffer.size().
   */
  def setCursor(loc: Int) = {
    val l = if (loc < 0) { 
      0 
    } else if (loc > buffer.size()) { 
      buffer.size() 
    } else {
      loc
    }
    buffer.setCursor(l);
  }
  
  /**
   * Move the cursor to the location specified in the parameter
   * in the buffer.
   */
  def move(count: Int) = {
    val command = new MoveCommand(buffer, count)
    if(index == (comArray.size-1)) {
      index += 1
    } else {
      comArray.trimEnd((comArray.size-1)-index)
      index = comArray.size-1
      index += 1
    }
    comArray += command
    command.execute()
  }

  /**
   * Insert the given text into the buffer at the current cursor
   * position and move the cursor to the end of the inserted text.
   */
  def insert(text: String) = {
    val command = new InsertCommand(buffer,text)
    if(index == comArray.size-1) {
      index += 1
    } else {
      comArray.trimEnd((comArray.size-1)-index)
      index = comArray.size-1
      index += 1
    }
    comArray += command
    command.execute()
  }
  
  /**
   * Delete count characters to the right of the cursor.
   *
   * <pre> pre: You must not delete past end of buffer </pre>
   */
  def delete(count: Int) =  {
    val command = new DeleteCommand(buffer,count);
    if(index == comArray.size-1) {
      index += 1
    } else {
      comArray.trimEnd((comArray.size-1)-index)
      index = comArray.size-1
      index += 1
    }
    comArray += command
    command.execute()
  }
  
  /**
   * Undo the previous editing command
   * (either a move, insert, or delete).
   */
  def undo() = {
    assert(index == 0, 
	   {"Bad call to undo(): index=" + index })
    index -= 1
    val command = comArray(index)
    command.undo()
      

  }

  /**
   * Undo the previous editing command
   * (either a move, insert, or delete).
   */
  def redo() = {
    assert(index == (comArray.size-1), 
	   {"Bad call to redo(): index=" + index })
    index += 1
    val command = comArray(index)
    command.execute()
  }
  
  
  /**
   * Print the commands on the undo stack.
   */
  protected def printHistory() = {
    println("History: ")
    for(i <- comArray.toList) { println("     " + i.toString()) }
  }
  
  
  /**
   * Return the contents of the buffer.
   */
  override def toString(): String = {
    buffer.toString();
  }
  
  /**
   * Read the next piece of input from Scanenr in as an integer, if
   * it is in fact an integer.  Otherwise, return 1 if there is no
   * input or generate an exception if there is something
   * unexpected.
   */
  def readOptionalInt(in: Scanner): Int = {
    if (in.hasNextInt()) {
      return in.nextInt();
    } else if (in.hasNext()) {
      throw new InputMismatchException("Missing number");
    } else {
      return 1;
    }
  }
  
  /**
   * Read and process one command from the user.  Returns true if
   * additional commands should be read, or false if the user has
   * quit.
   */    
  def processOneCommand(): Boolean = {
    System.out.print("? ");
    if (!input.hasNext()) return false;
    val commandStr = input.nextLine();
    val commandScanner = new Scanner(commandStr);
    val letter = commandScanner.next().toUpperCase();
    try {
      letter match {
	case "I" => {
	  commandScanner.skip(" ");  // skip space after 'I'
	  val text = commandScanner.nextLine();
	  insert(text);
	}
	case "D" => delete(readOptionalInt(commandScanner));
	case "<" => move(getCursor() - readOptionalInt(commandScanner));
	case ">" => move(getCursor() + readOptionalInt(commandScanner));
	case "U" => undo();
	case "R" => redo();
	case "P" => printHistory();
	case "Q" => return false;
	case _ => System.out.println("Invalid command: '" + commandStr + "'");
      }
    } catch {
      case e => System.out.println("Invalid Command: '" + commandStr + "' " + e);
    }
    return true;
  }
  
  
  /**
   * Create a new TextEditor that reads commands from the terminal
   * window.  Process commands until the user enters "Q".
   */
  def main(args: Array[String]) = {
    System.out.println(toString());
    while (processOneCommand()) {
      System.out.println(toString());
    }
  }
}
  
