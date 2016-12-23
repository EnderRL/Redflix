#include <iostream>
#include <vector>
#include <list>
using namespace std;

typedef list<pair<int, int>>::iterator IteratorP;
typedef list<int>::iterator IteratorI;

int main(int argc, char* argv[]) {
    if (argc != 4) {
        cout << "Usage: Problem_Creator [number of contents] [number of predecessors] [number of parallels]" << endl;
        exit(-1);
    }
    int numContents = atoi(argv[1]);
    int numPredecessors = atoi(argv[2]);
    int numParallels = atoi(argv[3]);

    vector<int> contents(numContents);
    list<int> listContents;

    srand(time(NULL));

    for (int i = 0; i < numContents; ++i) {
        listContents.push_back(i);
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
        cout << " c" << i << " - Content";
    }
    for (int i = 0; i < numContents; ++i) {
        cout << " d" << i << " - Day";
    }
    cout << ")" << endl << "(:init" << endl;

    vector<int> predecessorsToAsign(numContents, 0);
    for (int i = 0; i < numPredecessors and possibleEdges.size() > 0; ++i) {
        int random = rand()%possibleEdges.size();

        IteratorP it = possibleEdges.begin();
        for (int j = 0; j < random; ++j) ++it;
        pair<int, int>& edge = *it;

        ++predecessorsToAsign[edge.second];
        cout << "\t(predecessor c" << edge.first << " c" << edge.second  << ")" << endl;

        possibleEdges.erase(it);
    }

    for (int i = 0; i < numParallels and possibleEdges.size() > 0; ++i) {
        int random = rand()%possibleEdges.size();

        IteratorP it = possibleEdges.begin();
        for (int j = 0; j < random; ++j) ++it;
        pair<int, int>& edge = *it;

        cout << "\t(parallel c" << edge.first << " c" << edge.second  << ")" << endl;

        possibleEdges.erase(it);
    }

    for (int i = 0; i < numContents; ++i) {
        cout << "\t(= (numDay d" << i << ") " << i << ")" << endl;
    }
    for (int i = 0; i < numContents; ++i) {
        cout << "\t(= (predecessorsToAsign c" << i << ") " << predecessorsToAsign[i] << ")" << endl;
    }

    cout << ")" << endl;
    cout << " (:goal (forall (?content - Content) (asignedContent ?content - Content)))" << endl << ")" << endl;

}

