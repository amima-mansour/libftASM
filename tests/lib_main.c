#include <stdio.h>
//int     ft_isalpha(int c);
int     ft_isdigit(int c);
int     ft_isascii(int c);
int     ft_isprint(int c);
int     ft_puts(char *s);

int     main(void)
{
  ft_puts("hello");
  if (ft_isprint(31) == 1)
      printf("print\n");
  else
      printf("no print\n");
    return (0);
}
