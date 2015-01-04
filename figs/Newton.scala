import scala.math._
object Newton {
  val epsilon = 0.000001  /*誤差の許容範囲*/
  def newton(a:Double, f:Double=>Double, f_dash:Double=>Double):Double = {
    val b = a - f(a) / f_dash(a) /*次の移動先を求める*/
    if (abs(b-a) < epsilon) b else newton(b,f,f_dash) /*許容誤差の範囲内なら移動先のx座標を表示．そうでなければ探索を続行*/
  }
  def main(args: Array[String]) {
    val x = newton(8.0, x=>x+tan(x), x=>1+(1/pow(cos(x),2))) /*解に近いであろう8.0を初期値として与える*/
    println("x is " + x)
    println("the minimum value is " + -x*sin(x))
  }
}
