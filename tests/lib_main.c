#include <stdio.h>
#include <string.h>

//int     ft_isalpha(int c);
int     ft_isdigit(int c);
int     ft_isascii(int c);
int     ft_isprint(int c);
int     ft_puts(char *s);
int     ft_strlen(char *s);
void    ft_bzero(void *s, size_t n);
int     ft_toupper(int c);
int     ft_tolower(int c);
void    *ft_memset (void *s, int c, size_t n);
char    *strdup(const char *s);

int     main(void)
{
  /****ft_toupper****/
  //printf("%c\n", ft_tolower(91));
  /****ft_bzero*****/
  /*char *s = strdup("hellohello"); 
  ft_bzero(s, 8);
  printf("S1 = %s\n", s);
  printf("S2 = %s\n", s + 8);*/
  
  char *s = strdup("hellohello"); 
  printf("STRDUP = %s\n", s);
  s = ft_memset(s, 'k', 120);
  printf("S1 = %s\n", s);
  /****ft_strlen****/
  //printf("%d\n", ft_strlen("hello"));
  
  /****ft_puts*****/
  //ft_puts("hello");
  
  /****ft_isprint***/
  /*if (ft_isprint(31) == 1)
      printf("print\n");
  else
      printf("no print\n");
    return (0);*/
}
