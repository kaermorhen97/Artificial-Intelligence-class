function [shortestPath] = UcsToFindTheShortestPath(importedCoordinateData, tableForConnectedVertices, commonData)
% Uniform-Cost Search. 
startVertex = commonData.currentVertex;
targetVertex = commonData.targetVertex;
queue = startVertex;
% Update the connected table according to the user specified
% target Vertex
tableForConnectedVertices = tableForConnectedVertices(1:targetVertex, 1:targetVertex);
tableForConnectedVertices(targetVertex,:) = 0;
currentDistance(1:targetVertex) = inf;
currentDistance(startVertex) = 0;
 
if (startVertex == targetVertex)
 shortestPath.path = targetVertex;
 shortestPath.distance = currentDistance(targetVertex);
 return;
end
path = [];
% The loop will end if queue becomes empty
while any(queue)
 VertexPoppedFromQueue = queue(1);
 % Find the next connected Vertices from the given table of data.
 nextPossibleVertices = find(tableForConnectedVertices(VertexPoppedFromQueue,:));
 
 for k = 1:length(nextPossibleVertices)
 % Get one connected Vertex from the list of connected Vertices.
 nextVertexToVisit = nextPossibleVertices(k); 
 if (any(path == nextVertexToVisit)) == false
 % Compare distances of two paths to reach to the next connected Vertex. 
 % One is the previously searched path and the other is the currently searched 
path. 
 if (currentDistance(nextVertexToVisit) > currentDistance(VertexPoppedFromQueue) 
+ DistanceCalculator(importedCoordinateData, VertexPoppedFromQueue, nextVertexToVisit))
 currentDistance(nextVertexToVisit) = currentDistance(VertexPoppedFromQueue) 
+ DistanceCalculator(importedCoordinateData, VertexPoppedFromQueue, nextVertexToVisit);
 queue = [queue nextVertexToVisit] ;
 % Store the path
 path(nextVertexToVisit) = VertexPoppedFromQueue;
 end
 end
 end
 
 % Remove the current Vertex from the queue
 queue(1) = [];
end
backTrackingIndex = length(path);
flippedShortestPath = targetVertex;
while backTrackingIndex ~= startVertex
flippedShortestPath = [flippedShortestPath path(backTrackingIndex)];
 backTrackingIndex = path(backTrackingIndex);
end
shortestPath.path = flip(flippedShortestPath);
shortestPath.distance = currentDistance(targetVertex);
end
