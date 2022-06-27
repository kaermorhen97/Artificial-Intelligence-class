function createObstacle()
x1 = [61, 161, 161, 61];
y1 = [5, 5, 38, 38];
obs1 = polyshape(x1,y1);
drawnow
plot(obs1)
fill(x1,y1,'k','facealpha',0.1);
hold on 
x2 = [60, 92, 110, 87, 47];
y2 = [58, 52, 93, 125, 93];
obs2 = polyshape(x2,y2);
drawnow
plot(obs2)
fill(x2,y2,'k','facealpha',0.1);
hold on
x3 = [112, 140, 125];
y3 = [50, 50, 100];
obs3 = polyshape(x3,y3);
drawnow
plot(obs3)
fill(x3,y3,'k','facealpha',0.1);
hold on
x4 = [141, 180, 165, 141];
y4 = [82, 108, 125, 123];
obs4 = polyshape(x4,y4);
drawnow
plot(obs4)
fill(x4,y4,'k','facealpha',0.1);
hold on
x5 = [178, 198, 165];
y5 = [21, 41, 68];
obs5 = polyshape(x5,y5);
drawnow
plot(obs5)
fill(x5,y5,'k','facealpha',0.1);
hold on
x6 = [190, 232, 232, 190];
y6 = [58, 58, 122, 122];
obs6 = polyshape(x6,y6);
drawnow
plot(obs6)
fill(x6,y6,'k','facealpha',0.1);
hold on
x7 = [238, 255, 255, 239, 215, 215];
y7 = [5, 13, 39, 52, 39, 18];
obs7 = polyshape(x7,y7);
drawnow
plot(obs7)
fill(x7,y7,'k','facealpha',0.1);
hold on
x8 = [259, 265, 248, 238];
y8 = [50, 110, 123, 118];
obs8 = polyshape(x8,y8);
drawnow
plot(obs8)
fill(x8,y8,'k','facealpha',0.1);
hold on
end
