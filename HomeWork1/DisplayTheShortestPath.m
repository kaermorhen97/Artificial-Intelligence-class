function DisplayTheShortestPath(coordinatesOfVertices, inputPath, distance, startPoint)
    % DisplayTheShortestPath This local function displays the distance of the input path
    for numberOfPlots = 1 : length(inputPath(:,1))
        figure;
        hold on;
        
        
        % Place the vertices in the figure
        titleString = strcat('Travel Map #', int2str(numberOfPlots), ',',...
        ' (Start point #V ', int2str(startPoint), ',',...
        ' Total travel distance= ', num2str(distance),...
        ' )');
        plot(coordinatesOfVertices(:,1), coordinatesOfVertices(:,2),'.r','MarkerSize',28);
        title(titleString);
        xlabel('Meter'), ylabel('Meter')
        
        % Plot the path visiting every vertex
        plot(coordinatesOfVertices(inputPath(numberOfPlots,:),1),...
            coordinatesOfVertices(inputPath(numberOfPlots,:),2), 'b', 'LineWidth', 4)
        
        for numberOfVertices = 1:length(coordinatesOfVertices)
            vertexName = strcat('#V ', int2str(numberOfVertices), ' (Order: ',...
            int2str(find(numberOfVertices == inputPath(numberOfPlots,:))),...
            ')');
            
            text(coordinatesOfVertices(numberOfVertices,1), ...
                coordinatesOfVertices(numberOfVertices,2), vertexName);
        end
        
        createObstacle(); 
        
        legend('Vertex','Travel Path')
        hold off;
    end
end
