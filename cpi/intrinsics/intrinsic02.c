/* 
   @__llvm__cpi_move_range
 */

#include <string.h>
#include <stdio.h>

#define SIZE    21
 
char target[SIZE] = "a shiny white sphere";
 
int main( void )
{
  char *p = target + 8;  /* p points at the starting character
                            of the word we want to replace */
  char *source = target + 2; /* start of "shiny" */
 
  printf( "Before memmove, target is \"%s\"\n", target );
  memmove( p, source, 5 );  // @__llvm__cpi_move_range
  printf( "After memmove, target becomes \"%s\"\n", target );
}

/*********************  Expected output:  ************************
 
Before memmove, target is "a shiny white sphere"
After memmove, target becomes "a shiny shiny sphere"

*/