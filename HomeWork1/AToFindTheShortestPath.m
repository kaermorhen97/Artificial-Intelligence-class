function [shortestPath] = AToFindTheShortestPath(importedCoordinateData, tableForConnectedVertices, commonData)
    % A* Search
    startVertex = commonData.currentVertex;
    targetVertex = commonData.targetVertex;
    queue = startVertex;
    currentDistance(1:targetVertex) = inf;
    currentDistance(startVertex) = 0;
    if (startVertex == targetVertex)
        shortestPath.path = targetVertex;
        shortestPath.distance = currentDistance(targetVertex);
        return;
    end

     % Initialize the variables.
     path = [];
     
     % Initialize the start node.
     path(1) = startVertex;
     
     % Initialize the child and parent node number variables.
     i = 2; % Child node number variable
    while any(queue)
        VertexPoppedFromQueue = queue(1);
        estimated_cost = inf;
        
        % Find the next connected Vertices from the given table of data.
        nextPossibleVertices = find(tableForConnectedVertices(VertexPoppedFromQueue,:));
        
        for k = 1:length(nextPossibleVertices)
            nextVertexToVisit = nextPossibleVertices(k);
            if (any(path == nextVertexToVisit)) == false
                % Calculate cost to go
                % g(x)
                g = sqrt(((importedCoordinateData(nextVertexToVisit,1) - ...
                    importedCoordinateData(VertexPoppedFromQueue,1))^2) + ...
                    ((importedCoordinateData(nextVertexToVisit,2) - ...
                    importedCoordinateData(VertexPoppedFromQueue,2))^2));
                % h(x)
                h = sqrt(((importedCoordinateData(nextVertexToVisit,1) - ...
                    importedCoordinateData(targetVertex,1))^2) + ...
                    ((importedCoordinateData(nextVertexToVisit,2) - ...
                    importedCoordinateData(targetVertex,2))^2));
                % f(x) = h(x) + g(x)
                f = h + g;
                if f < estimated_cost
                    Best_Node = nextVertexToVisit;
                    estimated_cost = f;
                end
            end
        end
        currentDistance(Best_Node) = currentDistance(VertexPoppedFromQueue) + ...
            DistanceCalculator(importedCoordinateData, VertexPoppedFromQueue, Best_Node);
        queue = [queue Best_Node] ;
        path(i) = Best_Node;
        i = i+1;
        
        if Best_Node == targetVertex
            shortestPath.path = path;
            shortestPath.distance = currentDistance(targetVertex);
            break
        end
        % Remove the current Vertex from the queue
        queue(1) = [];
    end 
end
