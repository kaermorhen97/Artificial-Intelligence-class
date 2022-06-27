function [shortestPath] = DfsToFindTheShortestPath(importedCoordinateData, tableForConnectedVertices, commonData, dfsSpecificData, shortestPath, currentPath)
% Depth First Search (DFS)
currentVertex = commonData.currentVertex;
targetVertex = commonData.targetVertex;
accumulatedDistance = dfsSpecificData.accumulatedDistance;
% Find the next connected Vertices
nextPossibleVertices = find(tableForConnectedVertices(currentVertex,:));
currentPath = [currentPath currentVertex];
if currentVertex == targetVertex
 if shortestPath.distance > accumulatedDistance
 shortestPath.distance = accumulatedDistance;
 shortestPath.path = currentPath;
 end
 return;
end
dfsSpecificData.visitedList(currentVertex) = 1;
for index = 1:length(nextPossibleVertices)
 nextVertexToVisit = nextPossibleVertices(index);
 
 % Calculate the distance of the current Vertex and the next transit.
 distance = DistanceCalculator(importedCoordinateData, currentVertex, 
nextVertexToVisit);
 
 if(dfsSpecificData.visitedList(nextVertexToVisit) == 0)
 % Recursion to perform the next transit with the next Vertex to visit
 % as the starting point
 currentPathForRecursion = currentPath;
 dfsSpecificData.accumulatedDistance = accumulatedDistance + distance;
 commonData.currentVertex = nextVertexToVisit;
 commonData.searchCount = commonData.searchCount + 1;
 [shortestPath] = DfsToFindTheShortestPath(importedCoordinateData, 
tableForConnectedVertices, commonData, dfsSpecificData, shortestPath, 
currentPathForRecursion);
 end
end
dfsSpecificData.visitedList(currentVertex) = 0;
end
