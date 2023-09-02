#include <kMeans.h>

#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <tuple>
#include <cmath>
#include <random>
#include <thread>
#include <mutex>

Point::Point(const std::vector<float> &coords)
    : coords{coords} {}

void Point::printPointInfo() const
{
    std::cout << "Point with Coords: ( ";
    int i = 0;
    while (i < coords.size() - 1)
    {
        std::cout << coords.at(i) << ", ";
        i++;
    }
    std::cout << coords.at(i) << " ) is in the cluster " << cluster << "\t\t";
    std::cout << "It's distance to its custer is: " << min_distance << std::endl;
}

kMeans::kMeans() {

}

kMeans::kMeans(int k, const std::string &name)
    : clusters{k}
{
    std::ifstream my_stream{name};
    if (my_stream.is_open())
    {
        while (my_stream)
        {
            std::string one_line;
            std::getline(my_stream, one_line);
            std::vector<float> c = split(one_line, ' ');
            if (!c.empty())
            {
                data.push_back(Point{c});
            }
        }
    }
}

kMeans::kMeans(int k, const std::vector<std::vector<float>> &data)
    : clusters{k}
{
    for (const std::vector<float> &a : data)
    {
        this->data.push_back(Point{a});
    }
}

void kMeans::assignClusters()
{
}

void printVec(const std::vector<int> &vec)
{
    for (int i = 0; i < vec.size(); ++i)
    {
        std::cout << vec.at(i) << " ";
    }
    std::cout << std::endl;
}

void printNVec(const std::vector<std::vector<float>> &means)
{
    for (int i = 0; i < means.size(); ++i)
    {
        for (int j = 0; j < means.at(i).size(); j++)
        {
            std::cout << means.at(i).at(j) << " ";
        }
        std::cout << '\t';
    }
    std::cout << std::endl;
}

void kMeans::cluster(std::vector<std::vector<float>> all_means)
{
    std::vector<std::vector<float>> start {all_means};
    bool done{false};
    std::vector<int> assigned_clusters(data.size(), 0);
    float total_distance{0};
    while (!done)
    {
        done = true;
        total_distance = 0;
        for (int i = 0; i < data.size(); ++i)
        {
            Point &p = data.at(i);
            const std::tuple<int, float> &indAndDist = getMinDistanceAndIndex(p.coords, all_means);
            int new_cluster = std::get<0>(indAndDist);
            float new_distance = std::get<1>(indAndDist);
            if (new_cluster != assigned_clusters.at(i))
            {
                done = false;
            }
            assigned_clusters[i] = new_cluster;
            total_distance += new_distance;
        }
        // std::cout << "The current means are: ";
        // printNVec(all_means);
        // std::cout << "The current assignments are: ";
        // printVec(assigned_clusters);
        // update_means(all_means, assigned_clusters);
    }

    std::lock_guard<std::mutex> lock(_mutex);
    if (total_edge_distance > total_distance)
    {
        total_edge_distance = total_distance;
        last_means = all_means;
        start_state = start;
        for (int i = 0; i < data.size(); ++i)
        {
            Point &p = data.at(i);
            p.cluster = assigned_clusters.at(i);
            p.min_distance = getDistance(p.coords, last_means.at(p.cluster));
        }
    }
}

void kMeans::ClusterData()
{
    std::vector<std::vector<float>> all_means{getMeans()};
    cluster(all_means);
}

void kMeans::threadedClustering()
{
    std::vector<std::thread> threads;
    for (int i = 0; i < 80000; i++)
    {
        std::vector<std::vector<float>> all_means{getMeans()};
        std::thread th(&kMeans::cluster, this, all_means);
        threads.push_back(std::move(th));
    }
    for (std::thread &t : threads)
    {
        t.join();
    }
}

void kMeans::printClusteredData()
{
    for (const Point &p : data)
    {
        p.printPointInfo();
    }

    for (int i = 0; i < last_means.size(); ++i)
    {
        std::cout << "The coordinates for mean " << i << " is: (";
        const std::vector<float> &mean_coord{last_means.at(i)};
        for (int j = 0; j < mean_coord.size() - 1; ++j)
        {
            std::cout << mean_coord.at(j) << ", ";
        }
        std::cout << mean_coord.at(mean_coord.size() - 1) << " )\n";
    }

    std::cout << "The total distance is: " << total_edge_distance << std::endl;
}

std::tuple<int, float> kMeans::getMinDistanceAndIndex(const std::vector<float> &coord, const std::vector<std::vector<float>> &all_means)
{
    int index = 0;
    float min_distance{getDistance(coord, all_means.at(index))};
    for (int i = 1; i < all_means.size(); ++i)
    {
        float new_dist = getDistance(coord, all_means.at(i));
        if (new_dist < min_distance)
        {
            min_distance = new_dist;
            index = i;
        }
    }
    return std::tuple<int, float>{index, min_distance};
}

float kMeans::getDistance(const std::vector<float> &coord, const std::vector<float> &mean)
{
    float to_return{};
    for (int i = 0; i < coord.size(); ++i)
    {
        to_return += ((coord.at(i) - mean.at(i)) * (coord.at(i) - mean.at(i)));
    }
    return std::sqrt(to_return);
}

void kMeans::update_means(std::vector<std::vector<float>> &all_means, const std::vector<int> &assigned_clusters)
{
    std::vector<std::vector<float>> new_means(all_means.size(), std::vector<float>(all_means.at(0).size(), 0));
    std::vector<int> count(all_means.size(), 0);
    // for (const Point& p: data) {
    //     for (int i = 0; i < p.coords.size(); ++i) {
    //         new_means.at(p.cluster).at(i) += p.coords.at(i);
    //         count.at(p.cluster) += 1;
    //     }
    // }
    for (int i = 0; i < data.size(); ++i)
    {
        const Point &p = data.at(i);
        for (int j = 0; j < p.coords.size(); ++j)
        {
            new_means.at(assigned_clusters.at(i)).at(j) += p.coords.at(j);
        }
        count.at(assigned_clusters.at(i)) += 1;
    }

    for (int i = 0; i < all_means.size(); ++i)
    {
        for (int j = 0; j < all_means.at(0).size(); ++j)
        {
            if (count.at(i) != 0)
            {
                all_means.at(i).at(j) = new_means.at(i).at(j) / count.at(i);
            } else {
                all_means.at(i).at(j) = 0;
            }
        }
    }
}

std::vector<float> kMeans::split(const std::string &a, char delimiter)
{
    std::vector<float> to_return;
    std::string current{};
    for (int i = 0; i < a.size(); ++i)
    {
        if (a[i] == delimiter)
        {
            if (!current.empty())
            {
                to_return.push_back(std::atof(current.c_str()));
            }
            current = "";
        }
        else
        {
            current += a[i];
        }
    }
    if (!current.empty())
    {
        to_return.push_back(std::atof(current.c_str()));
    }
    return to_return;
}

std::vector<std::vector<float>> kMeans::getMeans()
{
    static std::vector<int> mins = getMins();
    static std::vector<int> maxs = getMaxs();
    std::random_device rd;  // obtain a random number from hardware
    std::mt19937 gen(rd()); // seed the generator

    std::vector<std::uniform_int_distribution<>> dists;
    for (int i = 0; i < mins.size(); ++i)
    {
        std::uniform_int_distribution<> distr(mins.at(i), maxs.at(i));
        dists.push_back(distr);
    }
    std::vector<std::vector<float>> means;
    for (int j = 0; j < clusters; ++j)
    {
        std::vector<float> rands;
        for (int i = 0; i < mins.size(); ++i)
        {
            rands.push_back(dists.at(i)(gen));
        }
        means.push_back(rands);
    }
    return means;
}

std::vector<int> kMeans::getMins()
{
    int min;
    int i = 0;
    std::vector<int> to_return;
    while (i < data.at(0).coords.size())
    {
        min = data.at(0).coords.at(i);
        for (int j = 1; j < data.size(); ++j)
        {
            if (data.at(j).coords.at(i) < min)
            {
                min = data.at(j).coords.at(i);
            }
        }
        to_return.push_back(min);
        i++;
    }
    return to_return;
}

std::vector<int> kMeans::getMaxs()
{
    int max;
    int i = 0;
    std::vector<int> to_return;
    while (i < data.at(0).coords.size())
    {
        max = data.at(0).coords.at(i);
        for (int j = 1; j < data.size(); ++j)
        {
            if (data.at(j).coords.at(i) > max)
            {
                max = data.at(j).coords.at(i);
            }
        }
        to_return.push_back(max);
        i++;
    }
    return to_return;
}