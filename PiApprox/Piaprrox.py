#=======================
#
# 		Ismael CM
#
#		25/07/2021
#
#=======================

# Approximate PI using rand(0, 1)
# MonteCarlo method

import random 
import matplotlib.pyplot as plt 
import numpy as np  


# n is the number of points to use 
# the bigger, the better approximation
def estimate_pi(n):
	pts_in_circle = 0 
	for _ in range(n):
		x = random.uniform(0,1)
		y = random.uniform(0,1)

		d = x**2 + y **2 

		if d <= 1:
			pts_in_circle += 1 

	return 4*pts_in_circle/n


def pi_approx_draw(n):
	pts_in_circle = 0
	points_circle = []
	points_out_circle = []
	for _ in range(n):
		x = random.uniform(0,1)
		y = random.uniform(0,1)

		d = x**2 + y **2 

		if d <= 1:
			pts_in_circle += 1
			points_circle.append([x,y])
		else:
			points_out_circle.append([x,y])



	points_circle = np.array(points_circle)
	points_out_circle = np.array(points_out_circle)

	print(4*pts_in_circle/n)

	theta = np.linspace(0, 2*np.pi, 100)
	x_circ = np.cos(theta)
	y_circ = np.sin(theta)

	plt.plot(points_circle[:,0], points_circle[:,1], 'r+', markersize=1)
	plt.plot(points_out_circle[:,0], points_out_circle[:,1], 'bx', markersize=1)
	plt.plot(x_circ, y_circ, 'k-')
	plt.xlim(0, 1.1)
	plt.ylim(0, 1.1)
	plt.show()

pi_approx_draw(1000000)