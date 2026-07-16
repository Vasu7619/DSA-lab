#include<stdio.h>

void main()
{
    int n, src, i, j;
    int visited[10] = {0};
    int cost[10][10], dist[10];
    int min, u = 0, count = 1;

    printf("\nDijkstra's Algorithm\n");
    printf("Enter number of nodes: ");
    scanf("%d", &n);

    printf("Enter the cost matrix:\n");
    for(i = 0; i < n; i++)
        for(j = 0; j < n; j++)
            scanf("%d", &cost[i][j]);

    printf("Enter the source node: ");
    scanf("%d", &src);

    for(i = 0; i < n; i++)
        dist[i] = cost[src][i];

    visited[src] = 1;

    while(count < n)
    {
        min = 99;

        for(i = 0; i < n; i++)
        {
            if(dist[i] < min && visited[i] == 0)
            {
                min = dist[i];
                u = i;
            }
        }

        visited[u] = 1;
        count++;

        for(i = 0; i < n; i++)
        {
            if(visited[i] == 0 && (dist[u] + cost[u][i] < dist[i]))
                dist[i] = dist[u] + cost[u][i];
        }
    }

    printf("The shortest distance from node %d:\n", src);

    for(i = 1; i < n; i++)
        printf("To node %d: %d\n", i, dist[i]);
}
