/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strncmp.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strncmp, test_with_equal_strings)
{
    char *str1 = "Hello World !";
    char *str2 = "Hello World";

    cr_assert(strncmp(str1, str2, 11) == 0);
}

Test(strncmp, test_with_empty_strings)
{
    char *str1 = "";
    char *str2 = "";

    cr_assert(strncmp(str1, str2, 0) == 0);
}

Test(strncmp, test_with_greater_strings)
{
    char *str1 = "Hello World !";
    char *str2 = "Hello World";

    cr_assert(strncmp(str1, str2, 13) > 0);
}

Test(strncmp, test_with_lower_strings)
{
    char *str1 = "Hello World";
    char *str2 = "Hello World !";

    cr_assert(strncmp(str1, str2, 13) < 0);
}