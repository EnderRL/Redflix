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
    if (argc != 6) {
        cout << "Usage: Problem_Creator [number of contents] [number of desirables] [number of viewed] [number of predecessors] [number of parallels]" << endl;
        exit(-1);
    }
    int numContents = atoi(argv[1]);
    int numDesirables = atoi(argv[2]);
    int numViewed = atoi(argv[3]);
    int numPredecessors = atoi(argv[4]);
    int numParallels = atoi(argv[5]);

    if (numDesirables + numViewed > numContents) {
        cout << "Can't generate problem, more contents viewed and desirable than total" << endl;
        exit(-1);
    }
    if (numPredecessors + numParallels > (numContents*(numContents-1))/2) {
        cout << "Can't generate problem, more predecessors and parallels than total" << endl;
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
        cout << endl << "\tc" << i << " - Content";
    }
    for (int i = 0; i < numContents; ++i) {
        cout << endl << "\td" << i << " - Day";
    }

    cout << endl << ")" << endl << "(:init" << endl;

    for (int i = 0; i < numViewed; ++i) {
        int random = rand()%listOfContents.size();

        IteratorI it = listOfContents.begin();
        for (int j = 0; j < random; ++j) ++it;

        contentViewed[*it] = true;
        cout << "\t(asignedContent c" << *it << ")" << endl;
        listOfContents.erase(it);
    }

    for (int i = 0; i < numDesirables; ++i) {
        int random = rand()%listOfContents.size();

        IteratorI it = listOfContents.begin();
        for (int j = 0; j < random; ++j) ++it;

        cout << "\t(desiredContent c" << *it << ")" << endl;
        listOfContents.erase(it);
    }

    vector<list<int>> Graph(numContents);
    vector<int> predecessorsToAsign(numContents, 0);

    for (int i = 0; i < numPredecessors; ++i) {
        int random = rand()%possibleEdges.size();

        IteratorP it = possibleEdges.begin();
        for (int j = 0; j < random; ++j) ++it;
        pair<int, int>& edge = *it;

        Graph[edge.first].push_back(edge.second);

        if (not contentViewed[edge.first]) ++predecessorsToAsign[edge.second];
        cout << "\t(predecessor c" << edge.first << " c" << edge.second  << ")" << endl;

        possibleEdges.erase(it);
    }

    int i = 0;
    while (i < numParallels and possibleEdges.size() > 0) {
        int random = rand()%possibleEdges.size();

        IteratorP it = possibleEdges.begin();
        for (int j = 0; j < random; ++j) ++it;
        pair<int, int>& edge = *it;
        vector<bool> aux(numContents, false);

        if (not DFS(edge.first, edge.second, Graph, aux)) {
            cout << "\t(parallel c" << edge.first << " c" << edge.second  << ")" << endl;
            cout << "\t(parallel c" << edge.second << " c" << edge.first  << ")" << endl;
            ++i;
        }

        possibleEdges.erase(it);
    }
    bool achieved = i == numParallels;

    for (int i = 0; i < numContents; ++i) {
        cout << "\t(= (numDay d" << i << ") " << i << ")" << endl;
    }

    for (int i = 0; i < numContents; ++i) {
        cout << "\t(= (minDay d" << i << ") " << 0 << ")" << endl;
    }

    vector<int> tiempos = {20, 45, 60, 90, 120, 150, 180};

    for (int i = 0; i < numContents; ++i) {
        int j = rand()%7;
        cout << "\t(= (minContent c" << i << ") " << tiempos[j] << ")" << endl;
    }

    for (int i = 0; i < numContents; ++i) {
        cout << "\t(= (predecessorsToAsign c" << i << ") " << predecessorsToAsign[i] << ")" << endl;
    }

    cout << ")" << endl;
    cout << "(:goal (forall (?content - Content) (imply (desiredContent ?content) (asignedContent ?content))))" << endl << ")" << endl;

    if (not achieved) cout << ";Could not generate all desired parallels due to incompatibility with predecessors." << endl;
}

