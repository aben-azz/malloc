/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   malloc.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aben-azz <aben-azz@student.s19.be>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/17 09:13:35 by aben-azz          #+#    #+#             */
/*   Updated: 2020/01/17 10:23:50 by aben-azz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "malloc.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>

void	*malloc(size_t size)
{
	(void)size;
	printf("malloc appelée\n");
	return (NULL);
}
