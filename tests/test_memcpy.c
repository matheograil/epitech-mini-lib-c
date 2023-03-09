/*
** EPITECH PROJECT, 2023
** MiniLibC
** File description:
** test_memcpy.c file.
*/

#include <criterion/criterion.h>
#include <string.h>
#include <stdlib.h>

Test(memcpy, test_with_basic_string)
{
    char *str1 = "Hello World !";
    char *str2 = malloc(sizeof(char) * (strlen(str1) + 1));

    memcpy(str2, str1, strlen(str1) + 1);
    cr_assert_str_eq(str1, str2);
    free(str2);
}

Test(memcpy, test_with_empty_string)
{
    char *str1 = "";
    char *str2 = malloc(sizeof(char) * (strlen(str1) + 1));

    memcpy(str2, str1, strlen(str1) + 1);
    cr_assert_str_eq(str1, str2);
    free(str2);
}
