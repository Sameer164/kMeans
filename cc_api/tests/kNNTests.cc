#include <kMeans.h>
#include <gtest/gtest.h>
#include <gmock/gmock.h>

#include <vector>
#include <string>
#include <tuple>
#include <random>

TEST(kMeansTest, GetMaxMinsTest)
{
    kMeans k{2, std::vector<std::vector<float>>{{1, 1}, {1, 2}, {1, 3}, {100, 1}, {100, 2}, {100, 3}}};
    ASSERT_THAT(k.getMins(), ::testing::ElementsAre(1, 1));
    ASSERT_THAT(k.getMaxs(), ::testing::ElementsAre(100, 3));
}

TEST(kMeansTest, GetSplittedFloat)
{
    kMeans k{2, std::vector<std::vector<float>>{{1, 1}, {1, 2}, {1, 3}, {100, 1}, {100, 2}, {100, 3}}};
    ASSERT_THAT(k.split("1 2 4", ' '), ::testing::ElementsAre(1, 2, 4));
}

TEST(kMeansTest, UpdatesMeans)
{
    kMeans k{2, std::vector<std::vector<float>>{{1, 1}, {1, 2}, {1, 3}, {100, 1}, {100, 2}, {100, 3}}};
    std::vector<std::vector<float>> all_means{{3, 5}, {50, 5}};
    k.update_means(all_means, {0, 1, 0, 1, 0, 1});
    EXPECT_EQ(all_means.size(), 2);
    EXPECT_EQ(all_means.at(0).size(), 2);
    EXPECT_EQ(all_means.at(1).size(), 2);
    ASSERT_THAT(all_means.at(0), ::testing::ElementsAre(34, 2));
    ASSERT_THAT(all_means.at(1), ::testing::ElementsAre(67, 2));

    k.update_means(all_means, {0, 0, 0, 0, 0, 0});
    ASSERT_THAT(all_means.at(0), ::testing::ElementsAre(50.5, 2));
    ASSERT_THAT(all_means.at(1), ::testing::ElementsAre(0, 0));

    k.update_means(all_means, {1, 1, 1, 1, 1, 1});
    ASSERT_THAT(all_means.at(0), ::testing::ElementsAre(0, 0));
    ASSERT_THAT(all_means.at(1), ::testing::ElementsAre(50.5, 2));

    kMeans k2
    {
        2,
        {
            {1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {100, 1}, {100, 2}, {100, 3}, {100, 4}, {100, 5}, { 500, 1 }
        }
    };

    std::vector<std::vector<float>> all_means2 {{1,3}, {200, 3.2}};
    k2.update_means(all_means2, {0,0,0,0,0,0,0,0,0,0,1});
    ASSERT_THAT(all_means2.at(1), ::testing::ElementsAre(500,1 ));
}

TEST(kMeansTest, GetDistance)
{
    kMeans k{2, std::vector<std::vector<float>>{{0, 0}}};
    EXPECT_EQ(k.getDistance({0, 0}, {3, 4}), 5);
}

TEST(kMeansTest, GetMinDistanceAndIndex)
{
    kMeans k{2, std::vector<std::vector<float>>{{0, 0}}};
    std::tuple<int, float> info = k.getMinDistanceAndIndex({3, 4}, {{100, 4}, {0, 0}, {2, 5000}});
    EXPECT_EQ(std::get<0>(info), 1);
    EXPECT_EQ(std::get<1>(info), 5);
}

int main()
{
    ::testing::InitGoogleTest();
    return RUN_ALL_TESTS();
}