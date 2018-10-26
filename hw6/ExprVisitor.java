
/* 
3a. Only one class, 'class Division', would be added 
because the division class would not require any 
additional methods/changes to any existing classes. 

3b. n+1 because we would needd to change all the 
other classes to add the functionality of drawing 
parse trees.

3c. First the method accept in the Sum class will call where v is toString,
then accept in the Number class is called by left.accept(v) because left is
defined as a NUmber. The Number accept then calls visitNumber, which then 
returns the String value of the number. Then the Number accept class is 
called for the right instance variable, calling visitNumber from there. 
Then visitSum is called to return the parse tree.   

3e. We would add 1 new subclass of expr and change m classes of visitor.

3f. We would add 1 class to visitor.

3g. We would use the original design if we only needed one set of operations 
(i.e eval) to be done on an object.

3h. We would use the visitor design pattern when we have more than one set of
operations (i.e. eval, toString, compile) that can be performed on an object.
    
*/

/** Abstract class for all expressions */
abstract class Expr {
    abstract <T> T accept(Visitor<T> v);
}

class Number extends Expr {
    protected int n;

    public Number(int n) { this.n = n; }

    public <T> T accept(Visitor<T> v) {
	return v.visitNumber(this.n);
    }
}

class Sum extends Expr {
    protected Expr left, right;

    public Sum(Expr left, Expr right) {
	this.left = left;
	this.right = right;
    }

    public <T> T accept(Visitor<T> v) {
	return v.visitSum(left.accept(v), right.accept(v));
    }
}

class Times extends Expr {
    protected Expr left, right;

    public Times(Expr left, Expr right) {
	this.left = left;
	this.right = right;
    }

    public <T> T accept(Visitor<T> v) {
	return v.visitTimes(left.accept(v), right.accept(v));
    }
}

class Subtract extends Expr {
    protected Expr left, right;

    public Subtract(Expr left, Expr right) {
	this.left = left;
	this.right = right;
    }

    public <T> T accept(Visitor<T> v) {
	return v.visitSubtract(left.accept(v), right.accept(v));
    }
}
    

/** Abstract class for all visitors */
abstract class Visitor<T> {
    abstract T visitNumber(int n);
    abstract T visitSum(T left, T right);
    abstract T visitTimes(T left, T right);
    abstract T visitSubtract(T left, T right);
}

/** Example visitor to convert an Expr to a String */
class ToString extends Visitor<String> {
    public String visitNumber(int n) { 
	return "" + n;
    }
    public String visitSum(String left, String right) {
	return "(" + left + " + " + right + ")";
    }
    public String visitTimes(String left, String right) {
	return "(" + left + "*" + right + ")";
    }
    public String visitSubtract(String left, String right) {
	return "(" + left + "-" + right + ")";
    }
}

class Eval extends Visitor<Integer> {
    public Integer visitNumber(int n) {
	return n;
    }
    public Integer visitSum(Integer left, Integer right) {
	return left + right;
    }
    public Integer visitTimes(Integer left, Integer right) {
	return left * right;
    }
    public Integer visitSubtract(Integer left, Integer right) {
	return left - right;
    }
}

class Compile extends Visitor<String> {
    public String visitNumber(int n) {
	return "PUSH(" + n + ") ";
    }
    public String visitSum(String left, String right) {
	return left + right + "ADD ";
    }
    public String visitTimes(String left, String right) {
	return left + right + "MULT ";
    }
    public String visitSubtract(String left, String right) {
	return left + right + "SUB ";
    }
}




public class ExprVisitor { 
    public static void main(String args[]) { 
	Expr e = new Subtract(new Number(3), new Number(2));
	Expr z = new Times(new Number(3), new Subtract(new Number(1), new Number(2))); 
	ToString printer = new ToString();
	Eval evaluator = new Eval();
	Compile compiler = new Compile();
	String stringRep = e.accept(printer);
	int realEval = z.accept(evaluator);
	String stack = z.accept(compiler);
	System.out.println(stringRep);
	System.out.println(realEval);
	realEval = e.accept(evaluator);
	System.out.println(stack);
    }

}
