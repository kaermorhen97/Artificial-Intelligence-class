function [ calculatedDistance ] = DistanceCalculator(inputCoordinate, from, to)
% DistanceCalculator This function calculates the distance from the current point to the 
next point of the path.
% 
% Usage: DistanceCalculator(inputCoordinateArray, currentPoint, nextPoint) 
% Param: inputCoordinateArray The input coordinate array of all Vertices
% currentPoint The current point of the path 
% nextPoint The next point of the path 
%
% Note: This function calculates the distance of the two points having
% (x, y) coordinates. 
 calculatedDistance = sqrt((inputCoordinate(from, 1)-inputCoordinate(to, 
1)).^2+(inputCoordinate(from, 2)-inputCoordinate(to, 2)).^2);
end
