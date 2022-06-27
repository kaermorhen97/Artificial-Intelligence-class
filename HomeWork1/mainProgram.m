close all
clear 
clc
%% General Settings
% searchAlgorithm: 
% 'BFS' --> Breadth First Search
% 'UCS' --> Uniform-Cost Search
% 'DFS' --> Depth-First Search
% 'Greedy' --> Greedy best-first Search
% 'Astar' --> A* Search
searchAlgorithm = 'Astar';
startVertex = 1;
targetVertex = 35;
plotBranch = 0; % 1: plot the figure connetion between vertices; 0: doesn't plot the figure
[importedCoordinateData,tableForConnectedVertices] = importdata(plotBranch); % import data 
tic
FindTheShortestPathWith(searchAlgorithm, startVertex, targetVertex, importedCoordinateData, tableForConnectedVertices);
toc
