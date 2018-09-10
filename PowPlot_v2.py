import numpy as np
from stingray import Lightcurve, Powerspectrum, AveragedPowerspectrum
import matplotlib.pyplot as plt
from astropy.io import ascii
p, q= np.loadtxt("lxp2level2_t1_50_3-10kev.txt", unpack=True, usecols=[0,1])
lc = Lightcurve(p,q)
avg_ps_mode = AveragedPowerspectrum(lc, 198, norm='leahy')
log_rb_ps = avg_ps_mode.rebin_log(f=0.02)
lin_rb_ps = avg_ps_mode.rebin(10, method='mean')
#plt.plot(lc.time, lc.counts, lw=1, color='blue')
plt.plot(avg_ps_mode.freq, avg_ps_mode.power, lw=1, color='black')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Power (Leahy)')
plt.show()

