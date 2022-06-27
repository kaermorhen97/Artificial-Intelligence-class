function [shortestPath] = BfsToFindTheShortestPath(importedCoordinateData, tableForConnectedVertices, commonData)
% Breadth First Search
startVertex = commonData.currentVertex;
targetVertex = commonData.targetVertex;
shortestPath.path(1) = startVertex;
shortestPath.distance = 0;
Nodes = [];
NodesInfo = [];
% Initialize the start node.
Nodes(:,:,1) = startVertex;
% Initialize NodeInfo for start node
% NodesInfo = [Node#, ParentNode#]
NodesInfo(:,:,1) = [1,0]; 
% Initialize the child and parent node number variables.
i = 2; % Child node number variable
j = 1; % Parent Node Number Variable
condition = 0;
while true
 CurrentNode = Nodes(:,:,j);
 nextPossibleVertices = find(tableForConnectedVertices(CurrentNode,:));
 for k = 1:length(nextPossibleVertices)
 nextVertexToVisit = nextPossibleVertices(k);
 if ((any(Nodes == nextVertexToVisit)) == false)
 Nodes(:,:,i) = nextVertexToVisit;
 NodesInfo(:,:,i) = [i,j];
 if Nodes(:,:,i) == targetVertex
 condition = 1;
 break
 end
 i = i + 1;
 end
 end
 if condition == 1
 break
 end
j = j + 1;
end
k = i;
count = 0;
shortestPath.distance = 0;
while k ~= 1 
 NodesInfo(:,:,k);
 a(k) = Nodes(1,1,k);
 info = NodesInfo((2*k));
 k = info;
 count = count+1;
end
shortestPath.path(:,2:length (find (a ~= 0))+1) = a(a ~= 0);
for i = 1:1:length(shortestPath.path)-1
 shortestPath.distance = shortestPath.distance + 
DistanceCalculator(importedCoordinateData, shortestPath.path(i), shortestPath.path(i+1));
end
end
