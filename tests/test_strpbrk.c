/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strpbrk.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strpbrk, test_with_filled_string_with_filled_query_and_match)
{
    char *str = "Hello world !";
    char *query = "wd";

    cr_assert_str_eq(strpbrk(str, query), "world !");
}

Test(strpbrk, test_with_filled_string_with_filled_query_and_no_match)
{
    char *str = "Hello world !";
    char *query = "bz";

    cr_assert_eq(strpbrk(str, query), NULL);
}

Test(strpbrk, test_with_empty_string_with_filled_query_and_no_match)
{
    char *str = "";
    char *query = "wd";

    cr_assert_eq(strpbrk(str, query), NULL);
}

Test(strpbrk, test_with_filled_string_with_empty_query_and_no_match)
{
    char *str = "Hello world !";
    char *query = "";

    cr_assert_eq(strpbrk(str, query), NULL);
}