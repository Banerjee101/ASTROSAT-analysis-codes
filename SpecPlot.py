import numpy as np
import matplotlib.pyplot as plt
from astropy.io import fits
import stingray
from stingray.events import EventList
from stingray import Lightcurve, Powerspectrum, AveragedPowerspectrum
import matplotlib.font_manager as font_manager
from astropy.io import ascii
font_prop = font_manager.FontProperties(size=16)
p, q= np.loadtxt("lxp2level2.pha", unpack=True, usecols=[0,11])
fig, ax = plt.subplots(1,1,figsize=(17,10))
ax.plot(p, q, lw=1, color='black')
#ax.plot(lc.time, lc.counts, lw=1, color='black')
ax.set_xlabel("Channels", fontproperties=font_prop)
ax.set_ylabel("Counts/s", fontproperties=font_prop)
#ax.set_yscale('log')
ax.tick_params(axis='x', labelsize=9)
ax.tick_params(axis='y', labelsize=9)
ax.tick_params(which='major', width=1.5, length=7)
ax.tick_params(which='minor', width=1.5, length=4)
plt.show()

