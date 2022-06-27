#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <deque>
#include <vector> 

using namespace std;
const int ACD = 19, ADE = 18, BCF = 11, DEG = 16, FHI = 17, GHJ = 22;
int level = 0, A = 1, B = 2, C = 3, D = 4, E = 5, F = 6, G = 7, H = 8, I = 9, J = 10;
const int SIZE = 11; //Including first element level

bool ACDSUM(int SUM); // prototypes
bool ADESUM(int SUM);
bool BCFSUM(int SUM);
bool DEGSUM(int SUM);
bool FHISUM(int SUM);
bool GHJSUM(int SUM);
bool legal();
bool BFS(vector<int>, deque <vector<int> > *);
bool DFS(vector<int>, deque <vector<int> > *);
bool Greedy(vector<int> Sol, deque <vector<int> > *goalQueue);
bool AStar(vector<int>, deque <vector<int> > *);
void bfs_expandChild(vector<int> child, deque <vector<int> > *goalQueue);
void dfs_expandChild(vector<int> child, deque <vector<int> > *goalQueue);
void astar_expandChild(vector<int> child, deque <vector<int> > *goalQueue);
void greedy_expandChild(vector<int> child, deque <vector<int> > *childsQueue);
int calHeuristic(vector<int> nextLevelChild);
int calHeuristic2(vector<int> nextLevelChild);

bool ACDSUM(int SUM) { return SUM == A + C + D; } // Checking functions
bool ADESUM(int SUM) { return SUM == A + D + E; }
bool BCFSUM(int SUM) { return SUM == B + C + F; }
bool DEGSUM(int SUM) { return SUM == D + E + G; }
bool FHISUM(int SUM) { return SUM == F + H + I; }
bool GHJSUM(int SUM) { return SUM == G + H + J; }
bool goal() {
	return ACDSUM(ACD) && ADESUM(ADE) && BCFSUM(BCF) &&
		DEGSUM(DEG) && FHISUM(FHI) && GHJSUM(GHJ);
}
void printaVector(vector<int> aVector) {
	cout << "(" << aVector[0] << "): <";
	vector<int>::iterator vii;
	for (vii = aVector.begin() + 1; vii != aVector.end(); vii++)
		cout << *vii << " ";
	cout << ">\n";
}
void swap(int *index1, int *index2) {
	int temp = *index1;
	*index1 = *index2;
	*index2 = temp;
}
void assignment(vector<int> combination) {
	A = combination[1]; B = combination[2]; C = combination[3]; D = combination[4]; E = combination[5];
	F = combination[6]; G = combination[7]; H = combination[8]; I = combination[9]; J = combination[10];
}
bool inTheQueue(vector<int> aChild, deque <vector<int> > theQueue) {
	deque <vector<int> >::iterator cii;
	for (cii = theQueue.begin(); cii <= theQueue.end(); cii++)
		if (*cii == aChild) return true;
}
// ACD(134)=19, ADE(145)=18, BCF(236)=11, DEG(457)=16, FHI(689)=17, GHJ(7810)=22;
int calHeuristic(vector<int> v) {
	return abs((v[1] + v[3] + v[4]) - ACD) + abs((v[1] + v[4] + v[5]) - ADE) + abs((v[2] + v[3] + v[6]) - BCF) +
		abs((v[4] + v[5] + v[7]) - DEG) + abs((v[6] + v[8] + v[9]) - FHI) + abs((v[7] + v[8] + v[10]) - GHJ);
}
int calHeuristic2(vector<int> v) {
	return abs(v[1] - A) + abs(v[2] - B) + abs(v[3] - C) + abs(v[4] - D) + abs(v[5] - E) +
		abs(v[6] - F) + abs(v[7] - G) + abs(v[8] - H) + abs(v[9] - I) + abs(v[10] - J);
}
int BFSCount = 0;
bool BFS(vector<int> Sol, deque <vector<int> > *goalQueue) {

	vector<int> currentChild;
	deque <vector<int> > childsQueue; deque <vector<int> >::iterator qii;
	childsQueue.push_back(Sol);            //Root is the same as the first child in level 1.
	++Sol[0]; childsQueue.push_back(Sol);  //Complement the first child.
	cout << "\nBFS search for the numeric puzzle:\n";
	bool found = false; time_t result = time(NULL);

	while (!childsQueue.empty() && !found) {
		currentChild = childsQueue.front(); assignment(currentChild);
		if (goal()) {
			cout << "This is a goal: ";
			printaVector(currentChild);
			goalQueue->push_back(currentChild);
			found = true;
		}
		bfs_expandChild(currentChild, &childsQueue);
		childsQueue.pop_front();
	}
	cout << "\nTotal time: " << time(NULL) - result << " Seconds to find a solution.";
	cout << "\nExpand totally: " << BFSCount << " nodes now" << endl;
	return !goalQueue->empty();
}
void bfs_expandChild(vector<int> child, deque <vector<int> > *childsQueue) {
	vector<int> nextLevelChild = child; ++nextLevelChild[0]; int level = child[0];
	for (int i = level + 1, j = 0; j<SIZE - i; j++) {
		swap(&nextLevelChild[i], &nextLevelChild[i + j]);
		BFSCount++;
		childsQueue->push_back(nextLevelChild); //First in First out = Queue
	}
}

int DFSCount = 0;
bool DFS(vector<int> Sol, deque <vector<int> > *goalQueue) {
	vector<int> currentChild;
	deque <vector<int> > childsQueue; deque <vector<int> >::iterator qii;
	childsQueue.push_back(Sol);
	++Sol[0]; childsQueue.push_back(Sol); //Complement the first child.
	cout << "\nDFS search for the numeric puzzle:\n";
	bool found = false; time_t result = time(NULL);

	while (!childsQueue.empty() && !found) {
		currentChild = childsQueue.front(); assignment(currentChild);
		childsQueue.pop_front();
		if (goal()) {
			cout << "This is a goal: ";
			printaVector(currentChild);
			goalQueue->push_back(currentChild);
			found = true;
		}
		dfs_expandChild(currentChild, &childsQueue);
	}
	cout << "\nTotal time: " << time(NULL) - result << " Seconds to find a solution.";
	cout << "\nExpand totally: " << DFSCount << " nodes now" << endl;
	return !goalQueue->empty();
}
void dfs_expandChild(vector<int> child, deque <vector<int> > *childsQueue) {
	vector<int> nextLevelChild = child; ++nextLevelChild[0]; int level = child[0];
	for (int i = level + 1, j = 0; j<SIZE - i; j++) {
		swap(&nextLevelChild[i], &nextLevelChild[i + j]);
		DFSCount++;
		childsQueue->push_front(nextLevelChild); //First in Last out = Stack
	}
}

int GreedyCount = 0;
bool Greedy(vector<int> Sol, deque <vector<int> > *goalQueue) {
	vector<int> currentChild;
	deque <vector<int> > childsQueue; deque <vector<int> >::iterator qii;
	childsQueue.push_back(Sol);
	++Sol[0]; childsQueue.push_back(Sol);  //Complement the first child.
	cout << "\nGreedy search for the numeric puzzle:\n";
	bool found = false; time_t result = time(NULL);
	int Max = 0, Min = 32768;

	while (!childsQueue.empty() && !found) {
		currentChild = childsQueue.front(); assignment(currentChild);
		childsQueue.pop_front();
		if (currentChild[11] > Max) Max = currentChild[11];
		if (currentChild[11] < Max) Min = currentChild[11];
		if (goal()) {
			cout << "This is a goal: ";
			printaVector(currentChild);
			goalQueue->push_back(currentChild);
			found = true;
		}
		greedy_expandChild(currentChild, &childsQueue);
	}
	cout << "\nTotal time: " << time(NULL) - result << " Seconds to find a solution.";
	cout << "\nExpand totally: " << GreedyCount << " nodes now" << endl;
	cout << "Maximum heuristic value: " << Max << "  Minimum heuristic value: " << Min << endl;
	return !goalQueue->empty();
}
void greedy_expandChild(vector<int> child, deque <vector<int> > *childsQueue) {
	vector<int> nextLevelChild = child; ++nextLevelChild[0]; int level = child[0];
	// vector<int> Solution={level, 9, 6, 2, 8, 1, 3, 7, 10, 4, 5, huristicValue};	
	deque <vector<int> >::iterator qii;
	for (int i = level + 1, j = 0; j<SIZE - i; j++) {
		swap(&nextLevelChild[i], &nextLevelChild[i + j]);
		nextLevelChild[11] = calHeuristic(nextLevelChild); //use only heuristic values f(n)=h(n)
		for (qii = childsQueue->begin(); qii != childsQueue->end() && nextLevelChild[11] >(*qii)[11]; qii++);
		childsQueue->insert(qii, nextLevelChild);  // Priority Queue
	}
	GreedyCount++;
}

int AStarCount = 0;
bool AStar(vector<int> Sol, deque <vector<int> > *goalQueue) {
	vector<int> currentChild;
	deque <vector<int> > childsQueue; deque <vector<int> >::iterator qii;
	childsQueue.push_back(Sol);
	++Sol[0]; childsQueue.push_back(Sol);  //Complement the first child.
	cout << "\nA* search for the numeric puzzle:\n";
	bool found = false; time_t result = time(NULL);
	int Max = 0, Min = 32768;
	while (!childsQueue.empty() && !found) {
		currentChild = childsQueue.front(); assignment(currentChild);
		childsQueue.pop_front();
		if (currentChild[11] > Max) Max = currentChild[11];
		if (currentChild[11] < Max) Min = currentChild[11];
		if (goal()) {
			cout << "This is a goal: ";
			printaVector(currentChild);
			goalQueue->push_back(currentChild);
			found = true;
		}
		astar_expandChild(currentChild, &childsQueue);
	}
	cout << "\nTotal time: " << time(NULL) - result << " Seconds to find a solution.";
	cout << "\nExpand totally: " << AStarCount << " nodes now" << endl;
	cout << "Maximum heuristic value: " << Max << "  Minimum heuristic value: " << Min << endl;
	return !goalQueue->empty();
}
void astar_expandChild(vector<int> child, deque <vector<int> > *childsQueue) {
	vector<int> nextLevelChild = child; ++nextLevelChild[0]; int level = child[0];
	// vector<int> Solution={level, 9, 6, 2, 8, 1, 3, 7, 10, 4, 5, huristicValue};	
	deque <vector<int> >::iterator qii;
	for (int i = level + 1, j = 0; j<SIZE - i; j++) {
		swap(&nextLevelChild[i], &nextLevelChild[i + j]);
		nextLevelChild[11] = calHeuristic(nextLevelChild) + level * 4; //Heuristic function f(n)=g(n)+H(n)
		for (qii = childsQueue->begin(); qii != childsQueue->end() && nextLevelChild[11] >(*qii)[11]; qii++);
		childsQueue->insert(qii, nextLevelChild);  //Priority Queue
	}
	AStarCount++;
}

int main() {
	vector<int> Sol = { level, A, B, C, D, E, F, G, H, I, J }; //9 6 2 8 1 3 7 10 4 5
	vector<int> HeuristicSol = { level, A, B, C, D, E, F, G, H, I, J, 0 }; //HeuristicSol[11] is the huristic value

	// The following is the BFS soultion
	deque <vector<int> > bfsgoalQueue; deque <vector<int> >::iterator qii;

	if (BFS(Sol, &bfsgoalQueue)) {
		cout << "BFS solutions" << endl;
		for (qii = bfsgoalQueue.begin(); qii != bfsgoalQueue.end(); qii++)
			printaVector(*qii);
	}
	// The following is the DFS solution	
	deque <vector<int> > dfsgoalQueue;
	if (DFS(Sol, &dfsgoalQueue)) {
		cout << "DFS solutions" << endl;
		for (qii = bfsgoalQueue.begin(); qii != bfsgoalQueue.end(); qii++)
			printaVector(*qii);
	}
	// The following is the Greedy solution
	deque <vector<int> > greedygoalQueue;
	if (Greedy(HeuristicSol, &greedygoalQueue)) {
		cout << "Greedy solutions" << endl;
		for (qii = greedygoalQueue.begin(); qii != greedygoalQueue.end(); qii++)
			printaVector(*qii);
	}
	// The following is the A* solution
	deque <vector<int> > astargoalQueue;
	if (AStar(HeuristicSol, &astargoalQueue)) {
		cout << "A* solutions" << endl;
		for (qii = astargoalQueue.begin(); qii != astargoalQueue.end(); qii++)
			printaVector(*qii);
	}
	return 0;
}
