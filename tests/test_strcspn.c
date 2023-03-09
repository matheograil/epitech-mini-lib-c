/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strcspn.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strcspn, test_with_filled_string_with_filled_query_and_match)
{
    char *str = "Hello world !";
    char *query = "wd";

    cr_assert_eq(strcspn(str, query), 6);
}

Test(strcspn, test_with_filled_string_with_filled_query_and_no_match)
{
    char *str = "Hello world !";
    char *query = "yz";

    cr_assert_eq(strcspn(str, query), 13);
}

Test(strcspn, test_with_empty_string_with_filled_query_and_no_match)
{
    char *str = "";
    char *query = "wd";

    cr_assert_eq(strcspn(str, query), 0);
}

Test(strcspn, test_with_filled_string_with_empty_query_and_no_match)
{
    char *str = "Hello world !";
    char *query = "";

    cr_assert_eq(strcspn(str, query), 13);
}