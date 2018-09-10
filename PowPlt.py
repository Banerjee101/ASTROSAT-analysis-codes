import numpy as np
import matplotlib.pyplot as plt
from astropy.io import fits
import stingray
from stingray.events import EventList
from stingray import Lightcurve, Powerspectrum, AveragedPowerspectrum
import matplotlib.font_manager as font_manager
from astropy.io import ascii

p, q= np.loadtxt("lxp2level2_t1_50_3-10kev.txt", unpack=True, usecols=[0,1])
font_prop = font_manager.FontProperties(size=16)

f = fits.open('lxp2level2.lcurv')		#Import fits
dt = f[1].header['TIMEDEL']
toa = f[1].data['TIME']
cou = f[1].data['RATE']
expo = f[1].header['EXPOSURE']
mean = np.mean(cou)

#lc = Lightcurve(toa, cou)
lc = Lightcurve(p,q)
#plt.plot(lc.time, lc.counts, lw=0.5, color='blue')
#plt.show()

avg_ps_mode = AveragedPowerspectrum(lc, 4000, norm='leahy')		#Change the segment size based on the data bin
print("Number of segments: %d" % avg_ps_mode.m)
fig, ax = plt.subplots(1,1,figsize=(17,10))
#log_rb_ps = avg_ps_mode.rebin_log(f=0.02)
#lin_rb_ps = avg_ps_mode.rebin(0.00025, method='mean')
ax.plot(avg_ps_mode.freq, avg_ps_mode.power, lw=1, color='black')
#ax.plot(lc.time, lc.counts, lw=1, color='black')
ax.set_xlabel("Frequency (Hz)", fontproperties=font_prop)
ax.set_ylabel("Power (Leahy)", fontproperties=font_prop)
#ax.set_yscale('log')
ax.tick_params(axis='x', labelsize=9)
ax.tick_params(axis='y', labelsize=9)
ax.tick_params(which='major', width=1.5, length=7)
ax.tick_params(which='minor', width=1.5, length=4)
plt.show()

