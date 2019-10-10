/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lib_main.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amansour <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/03 17:01:53 by amansour          #+#    #+#             */
/*   Updated: 2019/10/10 11:25:02 by amansour         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libfts.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>
#include <fcntl.h>


# define RED		"\033[1;31m"
# define GREEN		"\033[1;32m"
# define WHITE		"\033[1;37m"
# define RESET 		"\033[0m"

void	title(char *title)
{
	fprintf(stdout, "\n"WHITE"%s"RESET"\n", title);
}

char	*diff_str(char *s1, char *s2)
{
	if (s1 == NULL && s2 == NULL)
		return (GREEN"OK"RESET);
	if ((s1 == NULL && s2 != NULL)
		|| (s1 != NULL && s2 == NULL))
	{
		return (RED"NO !"RESET);
	}
	if (strcmp(s1, s2) == 0)
		return (GREEN"OK"RESET);
	return (RED"NO !"RESET);
}

char	*diff_ret(int r1, int r2)
{
	if (r1 == r2)
		return (GREEN"OK"RESET);
	return (RED"NOPE !"RESET);
}

void		check_char(void)
{
	title("\tISALPHA\tISDIGIT\tISALNUM\tISASCII\tISPRINT\tTOUPPER\tTOLOWER");
	int i = -1;
	while (i <= 130)
	{
		fprintf(stdout, "%3d %c \t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", i, isprint(i) ? i : '.',
			diff_ret(ft_isalpha(i), isalpha(i)),
			diff_ret(ft_isdigit(i), isdigit(i)),
			diff_ret(ft_isalnum(i), isalnum(i)),
			diff_ret(ft_isascii(i), isascii(i)),
			diff_ret(ft_isprint(i), isprint(i)),
			diff_ret(ft_toupper(i), toupper(i)),
			diff_ret(ft_tolower(i), tolower(i))
		);
		i++;
	}
}

void		check_memalloc(void)
{
	char *s = NULL;

	printf("MEMALLOC\n");
	printf("before: %s\n", s);
	s = ft_memalloc(20);
	printf("after: %s\n", s);
	printf("END OF MEMALLOC\n");
}

void		check_strnew(void)
{
	char *s = NULL;

	printf("STRNEW\n");
	printf("before: %s\n", s);
	s = ft_strnew(20);
	printf("after: %s\n", s);
	printf("END OF STRNEW\n");

}

void		check_strchr(void)
{
	char *str;
	char c;

	printf("STRCHR\n");
	/******************test1**********************/
	str = strdup("lol");
	c = 'l';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test2**********************/
	str = strdup("lol");
	c = 'o';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test3**********************/
	str = strdup("lol");
	c = 'z';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test4**********************/
	str = strdup("lol");
	c = '\0';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test5**********************/
	str = strdup("");
	c = '\0';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test6**********************/
	str = strdup("");
	c = 'o';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test7**********************/
	str = strdup("o");
	c = 'o';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test8**********************/
	str = strdup("o");
	c = 'z';
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	/******************test9**********************/
	str = strdup("o");
	c = -1;
	printf("str: %s c: %c - my_ret: %s ret: %s -> %s\n", str, c, ft_strchr(str, c), strchr(str, c), diff_str(ft_strchr(str, c), strchr(str, c)));
	free(str);
	printf("END OF STRCHR\n");
}

void		check_strjoin(void)
{
	char *s1;
	char *s2;

	printf("STRJOIN\n");
	/******************test1**********************/
	s1 = strdup("lol");
	s2 = strdup("lol");
	printf("s1: %s s2: %s -> %s\n", s1, s2, diff_str(ft_strjoin(s1, s2), "lollol"));
	free(s1); free(s2);
	/******************test2**********************/
	s1 = strdup("lol");
	s2 = strdup("lol2");
	printf("s1: %s s2: %s -> %s\n", s1, s2, diff_str(ft_strjoin(s1, s2), "lollol2"));
	free(s1); free(s2);
	/******************test3**********************/
	s1 = strdup("lolilol");
	s2 = strdup("");
	printf("s1: %s s2: %s -> %s\n", s1, s2, diff_str(ft_strjoin(s1, s2), "lolilol"));
	free(s1); free(s2);
	/******************test4**********************/
	s1 = strdup("");
	s2 = strdup("lolilol");
	printf("s1: %s s2: %s -> %s\n", s1, s2, diff_str(ft_strjoin(s1, s2), "lolilol"));
	free(s1); free(s2);
	/******************test5**********************/
	s1 = strdup("");
	s2 = strdup("");
	printf("s1: %s s2: %s -> %s\n", s1, s2, diff_str(ft_strjoin(s1, s2), ""));
	free(s1); free(s2);
	printf("END OF STRJOIN\n");
}

void		check_atoi(void)
{
	char *str;

	printf("ATOI\n");
	/******************test1**********************/
	str = strdup("1");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test2**********************/
	str = strdup("-42");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test3**********************/
	str = strdup("   123");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test4**********************/
	str = strdup("	-123");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test5**********************/
	str = strdup("0");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test6**********************/
	str = strdup("2147483647");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test7**********************/
	str = strdup("-2147483648");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test8**********************/
	str = strdup("214748364700");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test9**********************/
	str = strdup("-214748364800");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test10**********************/
	str = strdup("123abc");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test11**********************/
	str = strdup("+42");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test12**********************/
	str = strdup("++++42");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test13**********************/
	str = strdup("oups");
	printf("str: %-25s -> %s\n", str, diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test14**********************/
	str = strdup("           ");
	printf("str: %-25s -> %s\n", "(only spaces)", diff_ret(ft_atoi(str), atoi(str)));
	free(str);
	/******************test15**********************/
	str = strdup("");
	printf("str: %-25s -> %s\n", "(empty)", diff_ret(ft_atoi(str), atoi(str)));
	free(str);
}

void		check_strcpy(void)
{
	char *dest1;
	char *dest2;
	char *src;

	printf("STRCPY\n");
	/******************test1**********************/
	dest1 = strdup("                   ");
	dest2 = strdup("                   ");
	src = strdup("hi it is just a copy!");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
	free(dest1); free(dest2);
	/******************test2**********************/
	dest1 = strdup("*******************");
	dest2 = strdup("*******************");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
	free(src);
	/******************test3**********************/
	src = strdup("");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
	free(dest1); free(dest2); free(src);
	printf("END OF STRCPY\n");
}
void		check_strlen(void)
{
	char	str[13] = "Hello World !";
	char	*s;

	printf("STRLEN\n");
	/******************test1**********************/
	printf("src: %s = %zu -> %s\n", str, ft_strlen(str), diff_ret(ft_strlen(str), strlen(str)));
	/******************test2**********************/
	s = strdup("Hello World!");
	printf("src: %s = %zu -> %s\n", s, ft_strlen(s), diff_ret(ft_strlen(s), strlen(s)));
	free(s);
	/******************test3**********************/
	s = strdup("");
	printf("src: %s = %zu -> %s\n", s, ft_strlen(s), diff_ret(ft_strlen(s), strlen(s)));
	free(s);
	printf("END OF STRLEN\n");
}

void		check_strcmp(void)
{
	char	*s1;
	char	*s2;

	printf("STRCMP\n");
	/******************test1**********************/
	s1 = strdup("hello");
	s2 = strdup("hello");
	printf("s1: %s s2: %s - my_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), diff_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
	free(s1); free(s2);
	/******************test2**********************/
	s1 = strdup("hello My World");
	s2 = strdup("hello The World");
	printf("s1: %s s2: %s - my_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), diff_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
	free(s1); free(s2);
	/******************test3**********************/
	s1 = strdup("hello My World");
	s2 = strdup("");
	printf("s1: %s s2: %s - my_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), diff_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
	free(s1); free(s2);
	/******************test3**********************/
	s2 = strdup("hello My World");
	s1 = strdup("");
	printf("s1: %s s2: %s - my_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), diff_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
	free(s1); free(s2);
	printf("END OF STRCMP\n");
}

void		check_strcat(void)
{
	char *src;
	char *dest1;
	char *dest2;

	printf("STRCAT\n");
	/******************test1**********************/
	src = strdup("*********");
	dest1 = malloc(20); strcpy(dest1, "Hello World !");
	dest2 = malloc(20); strcpy(dest2, "Hello World !");
	printf("Before str1: %s\t- str2: %s\t", dest1, src);
	printf("Result: -> %s\n", diff_str(ft_strcat(dest1, src), strcat(dest2, src)));
	free(dest1); free(dest2);
	/******************test2**********************/
	dest1 = malloc(20); strcpy(dest1, "");
	dest2 = malloc(20); strcpy(dest2, "");
	printf("Before str1: %s\t- str2: %s\t", dest1, src);
	printf("Result: -> %s\n", diff_str(ft_strcat(dest1, src), strcat(dest2, src)));
	free(dest1); free(dest2); free(src);
	/******************test3**********************/
	src = strdup("");
	dest1 = malloc(20); strcpy(dest1, "Hello World !");
	dest2 = malloc(20); strcpy(dest2, "Hello World !");
	printf("Before str1: %s\t- str2: %s\t", dest1, src);
	printf("Result: -> %s\n", diff_str(ft_strcat(dest1, src), strcat(dest2, src)));
	free(dest1); free(dest2); free(src);
	/******************test4**********************/
	src = strdup("here we are !");
	dest1 = malloc(20); strcpy(dest1, "Hello World !");
	dest2 = malloc(20); strcpy(dest2, "Hello World !");
	printf("Before str1: %s\t- str2: %s\t", dest1, src);
	printf("Result: -> %s\n", diff_str(ft_strcat(dest1, src), strcat(dest2, src)));
	free(dest1); free(dest2); free(src);
	printf("END OF STRCAT\n");
}
void		check_puts(void)
{
	char *str;
	char s[20] = "Hello World stack";

	printf("PUTS\n");
	/******************test1**********************/
	ft_puts(s);
	/******************test2**********************/
	str = strdup("hello World strdup");
	ft_puts(str);
	free(str);
	/******************test3**********************/
	str = strdup("");
	write(1, "empty: ", 7);
	ft_puts(str);
	free(str);
	/******************test4**********************/
	write(1, "null: ", 6);
	ft_puts(NULL);
	printf("END OF PUTS\n");
}

void		check_bzero(void)
{
	char	str[14] = "Hello World !";

	printf("BZERO\n");
	/******************test1**********************/
	printf("str: %s\t", str);
	ft_bzero(str, strlen(str));
	printf("\t- result: %lu -> %s\n", strlen(str), diff_ret(strlen(str), 0));
	/******************test2**********************/
	char *str1 = strdup("Hello World !");
	printf("str: %s\t", str1);
	ft_bzero(str1, strlen(str1));
	printf("\t- result: %lu -> %s\n", strlen(str1), diff_ret(strlen(str1), 0));
	free(str1);
	/******************test3**********************/
	str1 = strdup("");
	printf("str: %s\t", str1);
	ft_bzero(str1, strlen(str1));
	printf("\t- result: %lu -> %s\n", strlen(str1), diff_ret(strlen(str1), 0));
	free(str1);
	/******************test4**********************/
	str1 = strdup("Check ft_bzero");
	printf("str: %s\t", str1);
	ft_bzero(str1, strlen(str1));
	printf("\t- result: %lu -> %s\n", strlen(str1), diff_ret(strlen(str1), 0));
	free(str1);
	printf("END OF BZERO \n");
}

void		check_memset(void)
{
	char		*src2;
	char		*src1;
	char		c;

	printf("MEMSET\n");
	/******************test1**********************/
	src1 = strdup("                   ");
	src2 = strdup("                   ");
	c = 'H';
	printf("src: %s -> %s\n", src1, diff_str(ft_memset(src1, c, strlen(src1)), memset(src2, c, strlen(src2))));
	free(src1); free(src2);
	/******************test2**********************/
	src1 = strdup("Hi, it's the original string !");
	src2 = strdup("Hi, it's the original string !");
	c = 'K';
	printf("src: %s -> %s\n", src1, diff_str(ft_memset(src1, c, strlen(src1)), memset(src2, c, strlen(src2))));
	/******************test3**********************/
	src1 = strdup("Hi, it's the original string !");
	src2 = strdup("Hi, it's the original string !");
	c = 0;
	printf("src: %s -> %s\n", src1, diff_str(ft_memset(src1, c, strlen(src1)), memset(src2, c, strlen(src2))));
	free(src1); free(src2);
	printf("END OF MEMSET\n");
}

void		check_memcpy(void)
{
	char		*dest2;
	char		*dest1;
	char		*src;

	printf("MEMCPY\n");
	/******************test1**********************/
	dest1 = strdup("                   ");
	dest2 = strdup("                   ");
	src = strdup("just a simple copy !");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
	free(dest1); free(dest2);
	/******************test2**********************/
	dest1 = strdup("Hi, it's the original string !");
	dest2 = strdup("Hi, it's the original string !");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
	free(src);
	/******************test3**********************/
	src = strdup("just a simple copy !");
	printf("dest: %s src: %s\t", dest1, src);
	printf(" -> %s\n", diff_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
	free(dest1); free(dest2); free(src);
	printf("END OF MEMCPY\n");
}

void		check_strdup(void)
{
	char		*str;
	char		s[14] = "Hello World !";

	printf("STRDUP\n");
	/******************test1**********************/
	printf("src: %s -> %s\n", s, diff_str(ft_strdup(s), strdup(s)));
	/******************test2**********************/
	str = strdup("Hello World ! (strdup)");
	printf("src: %s -> %s\n", str, diff_str(ft_strdup(str), strdup(str)));
	free(str);
	/******************test3**********************/
	str = strdup("");
	printf("src: %s -> %s\n", str, diff_str(ft_strdup(str), strdup(str)));
	free(str);
	printf("END OF STRDUP\n");
}

void 		check_cat(void)
{
	int fd;

	fd = open("author", O_RDONLY);
	printf("CAT\n");
	ft_cat(0);
	ft_cat(open("Makefile", O_RDONLY));
	printf("\n");
	ft_cat(fd);
	printf("\n");
	ft_cat(-42);
	printf("END OF CAT\n");
	close(fd);
}

int			main(void)
{
	check_char();
	printf("\n");
	check_puts();
	printf("\n");
	check_bzero();
	printf("\n");
	check_strlen();
	printf("\n");
	check_strdup();
	printf("\n");
	check_memset();
	printf("\n");
	check_memcpy();
	printf("\n");
	check_strcat();
	printf("\n");
	check_atoi();
	printf("\n");
	check_strcpy();
	printf("\n");
	check_strjoin();
	printf("\n");
	check_strnew();
	printf("\n");
	check_memalloc();
	printf("\n");
	check_strcmp();
	printf("\n");
	check_strchr();
	printf("\n");
	check_cat();
	return 0;
}
