#include <iostream>
#include <vector>
#include <list>
using namespace std;

typedef list<pair<int, int>>::iterator IteratorP;
typedef list<int>::iterator IteratorI;

bool DFS(int v, int dest, vector<list<int>>& Graph, vector<bool>& visited) {
    visited[v] = true;
    if (v == dest) return true;
    for (int adj : Graph[v]) {
        if (not visited[adj] and DFS(adj, dest, Graph, visited)) return true;
    }
    return false;
}

int main(int argc, char* argv[]) {
    if (argc != 5) {
        cout << "Usage: Problem_Creator [number of contents] [number of desirables] [number of viewed] [number of predecessors]" << endl;
        exit(-1);
    }
    int numContents = atoi(argv[1]);
    int numDesirables = atoi(argv[2]);
    int numViewed = atoi(argv[3]);
    int numPredecessors = atoi(argv[4]);

    if (numDesirables + numViewed > numContents) {
        cout << "Can't generate problem, more contents viewed and desirable than total" << endl;
        exit(-1);
    }
    if (numPredecessors >= numContents) {
        cout << "Can't generate problem, more predecessors than total" << endl;
        exit(-1);
    }

    vector<int> contents(numContents);
    vector<bool> contentViewed(numContents, false);
    list<int> listContents;
    list<int> listOfContents;

    srand(time(NULL));

    for (int i = 0; i < numContents; ++i) {
        listContents.push_back(i);
        listOfContents.push_back(i);
    }

    for (int i = 0; i < numContents; ++i) {
        int random = rand()%listContents.size();

        IteratorI it = listContents.begin();
        for (int j = 0; j < random; ++j) {
            ++it;
        }

        contents[i] = *it;
        listContents.erase(it);
    }

    list<pair<int, int>> possibleEdges;

    for (int i = 0; i < numContents; ++i) {
        for (int j = i+1; j < numContents; ++j) {
            possibleEdges.push_back(make_pair(contents[i], contents[j]));
        }
    }

    cout << "(define (problem basicProblem1)" << endl <<
            "(:domain redflix)" << endl <<
            "(:objects";
    for (int i = 0; i < numContents; ++i) {
        cout << endl << "\tc" << i+1 << " - Content";
    }
    for (int i = 0; i < numContents; ++i) {
        cout << endl << "\td" << i+1 << " - Day";
    }

    cout << endl << ")" << endl << "(:init" << endl;

    for (int i = 0; i < numViewed; ++i) {
        int random = rand()%listOfContents.size();

        IteratorI it = listOfContents.begin();
        for (int j = 0; j < random; ++j) ++it;

        contentViewed[*it] = true;
        cout << "\t(asignedContent c" << *it+1 << ")" << endl;
        listOfContents.erase(it);
    }

    cout << endl;

    for (int i = 0; i < numDesirables; ++i) {
        int random = rand()%listOfContents.size();

        IteratorI it = listOfContents.begin();
        for (int j = 0; j < random; ++j) ++it;

        cout << "\t(desiredContent c" << *it+1 << ")" << endl;
        listOfContents.erase(it);
    }

    cout << endl;

    vector<bool> predecesorViewed(numContents, false);
    vector<bool> predecessorAsigned(numContents, false);

    int i = 0;
    while (i < numPredecessors and possibleEdges.size() > 0) {
        int random = rand()%possibleEdges.size();

        IteratorP it = possibleEdges.begin();
        for (int j = 0; j < random; ++j) ++it;
        pair<int, int>& edge = *it;

        if (not predecessorAsigned[edge.second]) {
            if (contentViewed[edge.first]) predecesorViewed[edge.second] = true;
            cout << "\t(predecessor c" << edge.first+1 << " c" << edge.second+1  << ")" << endl;
            predecessorAsigned[edge.second] = true;
            ++i;
        }

        possibleEdges.erase(it);
    }

    cout << endl;

    for (int i = 0; i < numContents; ++i) {
        if (not predecessorAsigned[i] or predecesorViewed[i]) {
            cout << "\t(asignedPredecessor c" << i+1 << ")" << endl;
        }
    }

    cout << ")" << endl;
    cout << "(:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))" << endl << ")" << endl;
}

