

#include <stdio.h>
#include <stdlib.h>

int main()
{
  int i;
  for(i = 1; i < 200000; i++)
    {
      fprintf(stderr, "%d", i);
    }

  return 0;
}
