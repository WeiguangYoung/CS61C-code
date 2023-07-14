#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head)
{
    /* TODO: Implement ll_has_cycle */
    // length=0 or length=1
    if (head == NULL || head->next == NULL)
    {
        return 0;
    }

    // tortoise and hare run
    node *tortoise = head->next;
    node *hare = head->next->next;
    while (tortoise != hare && hare != NULL && tortoise != NULL && hare->next != NULL)
    {
        tortoise = tortoise->next;
        hare = hare->next->next;
    }

    // no meeting
    if (tortoise == hare && hare == NULL)
    {
        return 0;
    }

    // determine whether to meet or not
    return tortoise == hare;
}
