#ifndef MAIN_H
#define MAIN_H

#include <iostream>
#include <ncurses.h>
#include <vector>
#include <string>
#include <cmath>
#include <algorithm>
#include <random>
#include <cstdlib>
#include <ctime>
#include <unordered_map>
#include <chrono>
#include <thread>




#define random static_cast<double>(std::rand()) / RAND_MAX
#define activation_to_color(value) (std::round((value * 5.0) + 1.0))


#define blue 1
#define cyan 2
#define green 3
#define yellow 4
#define magenta 5
#define red 6
#define white 7

class Edge;

class DataPoint {

    public:

        std::vector<double> inputs;
        std::vector<double> expected_outputs;

        DataPoint(int num_inputs, int num_outputs);

};

class Node {

    public:

        std::vector<Edge*> input_edges;
        std::vector<Edge*> output_edges;

        double activation;
        double activation_derivative;
        double bias;
        double weighted_sum;
        double gradient;
        double node_value;

        Node();

        void calcualte_weighted_sum();

        void calculate_activation();

        void calculate_activation_derivative();

        void apply_gradient(double learn_rate);

        void update_gradient();

        void calculate_node_value();

        void calculate_output_layer_node_value(double expected_output);

        double cost(double expected);

        double cost_derivative(double expected);

};

class Edge {

    public:

        Node* first_node;
        Node* second_node;
        double weight;
        double gradient;

        Edge();

        Edge(Node* first_node, Node* second_node);

};

class Layer {

    public:

        std::vector<Node*> nodes;
        Layer* prev_layer;
        Layer* next_layer;

        Layer();

        Layer(int num_nodes, Layer* prev_layer, Layer* next_layer);

        void connect_layer(Layer* prev_layer, Layer* next_layer);

        void calculate_activations();

        void calculate_node_values();

        void calculate_output_layer_node_values(DataPoint& data);

        void apply_gradients(double learn_rate);

        void update_gradients();

        void reset_gradients();

};

class Network {

    public:

        Layer* input_layer;
        Layer* output_layer;

        std::vector<Layer*> layers;
        double cost;

        Network(int num_inputs, int num_outputs);

        Network(std::string file_name);

        void save(std::string file_name);

        void add_hidden_layer(int num_nodes);

        std::vector<double> run(DataPoint& inputs);

        void learn(std::vector<DataPoint*>& training_data, double learn_rate);

    private:

        double average_cost(std::vector<DataPoint*> training_data);

        void apply_all_gradients(double learn_rate);

        void update_all_gradients(DataPoint& data);

        void reset_all_gradients();
};



void init_colors();



void display_network(Network& network, int x, int y);



std::string prompt(std::string text);

void train(Network& network);

void test(Network& network);

#endif