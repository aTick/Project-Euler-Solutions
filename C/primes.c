#include <stdio.h>
#include <stdlib.h>


#define MAX 100000000

int main()
{

  //int nums[MAX];


  int *nums;
  nums = calloc(MAX, sizeof(int));

  if(nums == NULL)
    {
      fprintf(stderr, "Could not allocate memory\n");
      return 1;
    }
  
  int i;
  
  for(i = 0; i < MAX; i++)
    {
      nums[i] = i;
    }

  nums[1] = 0;

  
  int flag = 1;
  int current = 0;

  while(flag)
    {
      flag = 0;

      while(current < MAX && nums[current] == 0)
	{
	  ++current;
	}

      if(current < MAX)
	{
	  flag = 1;
	  for(i = 2; i * current < MAX; i++)
	    {
	      nums[i*current] = 0;
	    }
	}
      ++current;
    }


  for(i = 0; i < MAX; i++)
    {
      if(nums[i] != 0)
	printf("%d ", nums[i]);
    }
  printf("\n");


  return 0;
}
