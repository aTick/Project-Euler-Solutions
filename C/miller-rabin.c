#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int mod_expt(int b, int e, int n)
{
  int acc = 1;

 top:

  if(e == 0)
    return acc;

  if(e % 2 == 0)
    {
      e = e / 2;
      b = (b * b) % n;
      goto top;
    }
  else
    {
      acc = (acc * b) % n;
      e = e - 1;
      goto top;
    }

  return -1;
}
int miller_rabin(int n, int k)
{

  srand(time(NULL));

  if (n == 2 || n == 3)
    return n;

  if((n == 1) || (n % 2 == 0))
    return 0;

  int i;
  int j;
  int r;

  int temp_n = n - 1;
  int s = 0;
  int d = 0;
  int a;
  int x;

  while(temp_n % 2 == 0)
    {
      ++s;
      temp_n /= 2;
    }

  d = n / pow(2,s);
  
  for(i = 0; i < k; i++)
    {
    loop:
      if(i == (k-1))
	return n;

      if(n > 4)
	{
	  a = 2 + (rand() % (n - 4));
	}
      else
	{
	  a = 2;
	}
      x = mod_expt(a, d, n);
      if((x == 1) || (x == n - 1))
	{
	  continue;
	}
      
      for(r = 1; r < s; r++)
	{
	  x = mod_expt(x, 2, n);
	  if(x == 1)
	    return 0;
	  if(x == (n - 1))
	    {
	      ++i;
	      goto loop;
	    }
	  
	}
      return 0;
    }

  return n;
}

int main()
{

  printf("%d\n", mod_expt(2, 124124, 500));

  
  int primes[] = {2,3,5,7,11,13,17,19,23};

  int i;
  int p;
  for(i = 1; i < 10000000; i++)
    {
      p = miller_rabin(i, 5);
      //if(p != 0)
      //printf("%d\n",p);
    }

  return 0;

}
