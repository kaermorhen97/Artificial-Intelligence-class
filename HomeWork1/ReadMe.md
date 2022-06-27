# Problem 1
Consider the problem of finding the shortest path between two points on a plane that has convex polygonal obstacles as shown in Figure 1. This is an idealization of the problem that a robot has to solve to navigate in a crowded environment.

![image](https://user-images.githubusercontent.com/80089377/176014373-bda2e5dd-b5ef-46c8-ab0e-78fbeb8bb976.png)

## Question A
The shortest distance between two points is a straight line, and if it is not possible to travel in a straight line because some obstacle is in the way, then the next shortest distance is a sequence of line segments, end-to-end, that deviate from the straight line by as little as possible. So the first segment of this sequence must go from the start point to a tangent point on an obstacle – any path that gave the obstacle a wider girth would be longer. Because the obstacles are polygonal, the tangent points must be at vertices of the obstacles, and hence the entire path must go from vertex to vertex. So now the state space is the set of vertices, of which there are 35 in Figure 1, including S and G. Define a good state space by naming every vertex as **`v1,v2,…v35`**. **Draw a graph that connects all the vertices**.

## Question B
Apply **BFS (Breadth First Search)**, **UCS (Uniform Cost Search)**, **DFS (Depth-First Search)**, **Greedy Search (Greedy best-first Search)**, and **A-star** search algorithms to solve a range of problems. Use the straight-line distance for the actual distance between neighboring vertices and straight-line distance for the heuristic function of the last two algorithms (assuming that the robot can move along the edges of polygons and defining your distances proportionally by measuring in the Figure 1 ).
