/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aben-azz <aben-azz@student.s19.be>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/17 09:22:22 by aben-azz          #+#    #+#             */
/*   Updated: 2020/01/17 10:23:23 by aben-azz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "malloc.h"
#include <stdio.h>

int main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
	printf("Main de test:\n\n");
	char *mal = malloc(0);
	free(mal);
	realloc(mal, 0);
	return (1);
}
