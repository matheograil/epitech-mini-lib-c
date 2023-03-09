/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strrchr.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strrchr, test_with_filled_string_and_match_string)
{
    char *str = "Hello World !";
    char query = 'o';

    cr_assert_str_eq(strrchr(str, query), "orld !");
}

Test(strrchr, test_with_filled_string_and_no_match)
{
    char *str = "Hello World !";
    char query = 'b';

    cr_assert_eq(strrchr(str, query), NULL);
}

Test(strrchr, test_with_empty_string_and_no_match)
{
    char *str = "";
    char query = 'o';

    cr_assert_eq(strrchr(str, query), NULL);
}
