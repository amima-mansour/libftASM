#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//int     ft_isalpha(int c);
int     ft_isdigit(int c);
int     ft_isascii(int c);
int     ft_isprint(int c);
int     ft_isalpha(int c);
int     ft_isalnum(int c);
int     ft_puts(char *s);
int     ft_strlen(char *s);
void    ft_bzero(void *s, size_t n);
int     ft_toupper(int c);
int     ft_tolower(int c);
void    *ft_memset (void *s, int c, size_t n);
char    *ft_strdup(const char *s);
char    *ft_strcat(char *dest, const char *src);
void    *ft_memcpy(void *dest, const void *src, size_t n);
int     ft_cat(int fd);
int     ft_strcmp(char *str1, char *str2);
char    *ft_strchr(char * string, int searchedChar);

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
  char *str = (char*)malloc(15);
  ft_bzero(str, 15);
  int i;
  i = -1;
  //while (++i < 10)
   // str[i] = 'A';
  str = ft_memcpy(str, s, 5);
  printf("MEMCPY = %s\n", str);
  //s = ft_memset(s, 'k', 120);
  //printf("S1 = %s\n", s);
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
    /****ft_isalnum***/
  /*if (ft_isalnum(123) == 1)
      printf("alnum\n");
  else
      printf("no alnum\n");*/
    /***ft_cat***/
    //printf("%d\n", ft_cat(0));
    /**ft_strcmp**/
    //printf("%d\n", ft_strcmp("Amina", "Amika"));
    /**ft_strchr**/
    printf("occ = %s\n", ft_strchr("Aminamansour", 'a'));
    return (0);
}
