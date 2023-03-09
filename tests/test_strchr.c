/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strchr.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strchr, test_with_filled_string_and_match_string)
{
    char *str = "Hello World !";
    char query = 'o';

    cr_assert_str_eq(strchr(str, query), "o World !");
}

Test(strchr, test_with_filled_string_and_match_backslash_zero)
{
    char *str = "Hello World !";
    char query = '\0';

    cr_assert_str_eq(strchr(str, query), "");
}

Test(strchr, test_with_filled_string_and_no_match)
{
    char *str = "Hello World !";
    char query = 'b';

    cr_assert_eq(strchr(str, query), NULL);
}

Test(strchr, test_with_empty_string_and_no_match)
{
    char *str = "";
    char query = 'o';

    cr_assert_eq(strchr(str, query), NULL);
}
