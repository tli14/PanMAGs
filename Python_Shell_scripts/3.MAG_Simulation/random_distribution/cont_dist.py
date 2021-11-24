## Modified based on the original code: https://stackoverflow.com/questions/49801071

import sys
import scipy
from scipy import stats
import numpy as np
import random

# change the parameters
desired_mean = str(sys.argv[1])
desired_skew = 3
desired_sd = str(desired_mean)

def createSkewDist(mean, sd, skew, size):

    # calculate the degrees of freedom 1 required to obtain the specific skewness statistic, derived from simulations
    loglog_slope=-2.211897875506251
    loglog_intercept=1.002555437670879
    df2=500
    df1 = 10**(loglog_slope*np.log10(abs(skew)) + loglog_intercept)

    # sample from F distribution
    fsample = np.sort(stats.f(df1, df2).rvs(size=size))

    # adjust the variance by scaling the distance from each point to the distribution mean by a constant, derived from simulations
    k1_slope = 0.5670830069364579
    k1_intercept = -0.09239985798819927
    k2_slope = 0.5823114978219056
    k2_intercept = -0.11748300123471256

    scaling_slope = abs(skew)*k1_slope + k1_intercept
    scaling_intercept = abs(skew)*k2_slope + k2_intercept

    scale_factor = (sd - scaling_intercept)/scaling_slope
    new_dist = (fsample - np.mean(fsample))*scale_factor + fsample

    # flip the distribution if specified skew is negative
    if skew < 0:
        new_dist = np.mean(new_dist) - new_dist

    # adjust the distribution mean to the specified value
    final_dist = new_dist + (mean - np.mean(new_dist))

    return final_dist

final_dist = createSkewDist(mean=int(desired_mean), sd=int(desired_sd), skew=desired_skew, size=100)
final_dist = np.round(final_dist,2)
random.shuffle(final_dist)
final_dist = final_dist.tolist()
print('\n'.join(map(str, final_dist)))
