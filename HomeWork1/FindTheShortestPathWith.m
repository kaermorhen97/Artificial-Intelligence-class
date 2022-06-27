function FindTheShortestPathWith(searchAlgorithm, startVertex, targetVertex, importedCoordinateData, tableForConnectedVertices)
    % FindTheShortestPath This function finds the shortest path from the given
    % starting Vertex with the user-specified search
    %
    % Usage: FindTheShortestPathWith(searchAlgorithm, startVertex, targetVertex, importedCoordinateData, tableForConnectedVertices)
    % Param: searchAlgorithm Search Algorithm that defined by user
    % startVertex Interger of starting point (or starting Vertex, e.g., 1 for Vertex 1)
    % targetVertex Interger of target point (or target Vertex, e.g., 11 for Vertex 11)
    %
    % Variable declarations to be used in all algorithm
    commonData.currentVertex = startVertex;
    commonData.targetVertex = targetVertex;
    shortestPath.path = [];
    shortestPath.distance = inf;
    if strcmp(searchAlgorithm, 'DFS') % Depth First Search is selected
        % Variable declarations to be used only in DFS
        dfsSpecificData.visitedList = zeros(1, length(importedCoordinateData));
        dfsSpecificData.accumulatedDistance = 0;
        commonData.searchCount = 0;
        [shortestPath] = DfsToFindTheShortestPath(importedCoordinateData, ... 
        tableForConnectedVertices, commonData, dfsSpecificData, shortestPath, []);
        
        
    elseif strcmp(searchAlgorithm, 'UCS') % Uniform-Cost Search is selected 
        [shortestPath] = UcsToFindTheShortestPath(importedCoordinateData, ...
        tableForConnectedVertices, commonData);
        
        
    elseif strcmp(searchAlgorithm, 'Greedy') % Greedy best-first Search is selected 
        [shortestPath] = GreedyToFindTheShortestPath(importedCoordinateData, ...
        tableForConnectedVertices, commonData);
        
        
    elseif strcmp(searchAlgorithm, 'Astar') % A* Search is selected 
        [shortestPath] = AToFindTheShortestPath(importedCoordinateData, ...
        tableForConnectedVertices, commonData);
        
        
    elseif strcmp(searchAlgorithm, 'BFS') % Breadth First Search is selected 
        [shortestPath] = BfsToFindTheShortestPath(importedCoordinateData, ...
        tableForConnectedVertices, commonData);
    end
    % Display the shortest path
    DisplayTheShortestPath(importedCoordinateData, shortestPath.path, ...
        shortestPath.distance, startVertex);
end
