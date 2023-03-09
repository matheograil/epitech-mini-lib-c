/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strcasecmp.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strcasecmp, test_with_equal_strings)
{
    char *str1 = "hello world !";
    char *str2 = "Hello World !";

    cr_assert(strcasecmp(str1, str2) == 0);
}

Test(strcasecmp, test_with_empty_strings)
{
    char *str1 = "";
    char *str2 = "";

    cr_assert(strcasecmp(str1, str2) == 0);
}

Test(strcasecmp, test_with_greater_strings)
{
    char *str1 = "Hello World !";
    char *str2 = "Hello World";

    cr_assert(strcasecmp(str1, str2) > 0);
}

Test(strcasecmp, test_with_lower_strings)
{
    char *str1 = "Hello World";
    char *str2 = "Hello World !";

    cr_assert(strcasecmp(str1, str2) < 0);
}