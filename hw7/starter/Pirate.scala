/*
 * Scala Pirate Translation
 * CS 334.
 */

import scala.collection.JavaConversions._
import java.util.StringTokenizer;

// Finish writing all methods
class Translator {
  val dict = scala.collection.mutable.Map[String,String]();
  // Add the given translation from an english word to a pirate word
  def += (k : String, v : String) : Unit = dict += (k -> v)
 
  // Look up the given english word.  If it is in the dictionary,
  //    return the pirate equivalent.  Otherwise, just return english.
  def apply(k : String) : String = { 
    if (dict.contains(k)) {
      dict(k)
    } else {
      k
    }
  }
  // Print the dictionary to stdout
  override def toString() = dict.toString()
}


object Pirate {
  
  def main(args: Array[String]) {
    
    val punctation = "=+!@#$%^&*():_-|\"\\'<>,.?/[]{}`~ \t\n"
    val pirate = new Translator()
    val lines = scala.io.Source.fromFile("pirate.txt").getLines()
    val data = lines.toList
    var k = ""
    var v = "" 

    for(i <- data){
      val strArr = i.split(":")
      k = strArr(0)
      v = strArr(1)
      pirate += (k, v)
    }    

    // For the last part:    
    // Iterate over each line of stdin
    
    for(line <- io.Source.stdin.getLines) {
      // create iterator for all words on a line of input, when broken
      // apart into tokens.  
      val words = for (s <- new StringTokenizer(line + "\n", 
                                                punctation, 
                                                true)) yield s.toString();
     //iterate through words converting to Pirate language
      while(words.hasNext){
	val x = words.next()
	print(pirate(x.toLowerCase()))
      }
    }
  }
}

