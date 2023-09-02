import kMeansPyExport

import tkinter as tk
import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from sklearn.datasets import make_blobs


class ClusterPointsApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Cluster Points")
        self.num_clusters = 4
        self.canvas = tk.Canvas(self.root, width=1500, height=900, bg="white")
        self.canvas.pack()
        self.makefile()
        self.points = np.array([list(map(float, line.strip().split(" "))) for line in open("file.txt")])  # Random points within the canvas
        k = kMeansPyExport.kMeansClass(4, "file.txt")

        self.current_cluster_means = np.array(kMeansPyExport.GetStartState(k))

        self.change_clusters()

        self.change_button = tk.Button(self.root, text="Change Clusters", command=self.change_clusters)
        self.change_button.pack()
    
    def makefile(self):
        X, y = make_blobs(n_samples=2000,
                  centers=[[50, 10], [500, 5], [1000, 20], [700, 50]], cluster_std = [20, 100, 150, 100],
                  n_features=2)
        np.savetxt('file.txt', X, fmt='%1.2f')
        
    def random_color(self):
        return "#{:02x}{:02x}{:02x}".format(np.random.randint(0, 255), np.random.randint(0, 255), np.random.randint(0, 255))
    
    def assign_clusters(self):
        distances = np.sum((self.points[:, np.newaxis]-self.current_cluster_means) ** 2, axis=2)
        self.labels = np.argmin(distances, axis=1)

    def change_clusters_mean(self):
        updated_means = np.array([[0]*self.current_cluster_means.shape[1]]*self.current_cluster_means.shape[0])
        count = [0] * self.current_cluster_means.shape[0]
        for index, point in enumerate(self.points):
            label = self.labels[index]
            for dim, ele in enumerate(point):
                updated_means[label][dim] += ele
            count[label] += 1
        for i in range(self.current_cluster_means.shape[0]):
            for j in range(self.current_cluster_means.shape[1]):
                if count[i] != 0:
                    to_change = updated_means[i][j] / count[i]
                else:
                    to_change = 0
                self.current_cluster_means[i][j] = to_change

    def cluster_points(self):
        self.assign_clusters()
        self.cluster_colors = [self.random_color() for _ in range(self.num_clusters)]
        self.change_clusters_mean()


    def draw_points(self):
        self.canvas.delete("all")
        count = {}
        for i, point in enumerate(self.points):
            x, y = point
            x += 100
            if x not in count:
                count[x] = 20
            y = 800 - y - count[x]
            count[x] += 40
            color = self.cluster_colors[self.labels[i]]
            self.canvas.create_oval(x - 5, y - 5, x + 5, y + 5, fill=color, outline="")
    
    def change_clusters(self):
        self.cluster_points()
        self.draw_points()

if __name__ == "__main__":
    root = tk.Tk()
    app = ClusterPointsApp(root)
    root.mainloop()
