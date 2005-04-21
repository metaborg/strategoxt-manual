class Try
{
  public int x;
  public double y;

  public void set(int x, double y1)
  {
    this.x = x;
    y = y1;
  }

  public void print()
  {
    System.out.println("x = " + x + ", y = " + y);
  }

  public static void main(String[] args)
  {
    Try t = new Try();
    t.set(7, 8.5);
    t.print();
  }
}
