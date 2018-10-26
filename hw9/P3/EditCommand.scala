/**
 * An abstract super class of all Edit Commands on Buffers.
 *
 * This class simply specifies the interface to all commands
 * and stores the target buffer of the command.
 */
abstract class EditCommand(protected val target: Buffer) {
	
	/** Perform the command on the target buffer */
	def execute(): Unit;

	/** Undo the command on the target buffer */
	def undo(): Unit;
	
	/** Print out what this command represents */
	def toString(): String;
 
	/** Lumps two consecutive commands into one command */
	def compose(other : EditCommand) : Option[EditCommand];
}
