/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_strlen.c file.
*/

#include <criterion/criterion.h>
#include <string.h>

Test(strlen, test_with_basic_string)
{
    char *str = "Hello World !";

    cr_assert_eq(strlen(str), 13);
}

Test(strlen, test_with_empty_string)
{
    char *str = "";

    cr_assert_eq(strlen(str), 0);
}