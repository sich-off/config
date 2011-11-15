#include <stdio.h>
#include <time.h>

int main()
{
  time_t a, b;
  printf("Press return to start. ");
  scanf("%*c");
  a = time(NULL);
  printf("Press return to finish. ");
  scanf("%*c");
  b = time(NULL);
  printf("%d\n", b - a);
  return 0;
}
