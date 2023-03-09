/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_memset.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(memset, test_with_basic_string)
{
    char str[20] = "Hello World !";

    memset(str + 6, 'U', 5);
    cr_assert_str_eq(str, "Hello UUUUU !");
}

Test(memset, test_with_empty_string)
{
    char str[20] = "";

    memset(str, 'U', 5);
    cr_assert_str_eq(str, "UUUUU");
}

Test(memset, test_with_basic_string_and_greater_position)
{
    char str[20] = "Hello World !";

    memset(str + 13, 'U', 5);
    cr_assert_str_eq(str, "Hello World !UUUUU");
}