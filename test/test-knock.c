#include "../knock.h"
#include <time.h>

int
main()
{
  ok(1 == 1);
  ok(1 == 1, "one equals one");

  ok(1 == 2);
  ok(1 == 2, "one equals two");

  is(1, 1);
  is(1, 1, "one equals one");

  is(1, 2);
  is(1, 2, "one equals two");

  diag ("It's now %d.", (int) time(0));

  fail("foo");
  pass("yay");
  pass("yum");

  fail();
  pass();

  diag ("mumble...");

  fail("you fail");
  
  return 0;
}
