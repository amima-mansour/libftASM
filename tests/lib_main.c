int     ft_isalpha(int c);
 
int     main(void)
{
    if (ft_isalpha('A') == 1)
        printf("alpha\n");
    else
        printf("no alpha\n");
    return (0);
}