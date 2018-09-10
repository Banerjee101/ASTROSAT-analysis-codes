pro IDLCode
  ; Select a text file and open for reading
  file = DIALOG_PICKFILE(FILTER='/home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/*.txt')
  OPENR, lun, file, /GET_LUN
  ; Read one line at a time, saving the result into array
  array = ''
  line = ''
  WHILE NOT EOF(lun) DO BEGIN & $
    READF, lun, line & $
    array = [array, line] & $
    ffttime = 128.D
    RADPS, array, ffttime, dps, nyquistfreq=2048.D, freqavg=ff, freqwid=fw
  ENDWHILE
  ; Close the file and free the file unit
  window, 0, xsize=480, ysize=360
  binlc, array, lc1, tbinsize=1.D, error=elc1, time=tt1, climits=[0,13];, outfile='/home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/lc_idl_trial2_PS.lc'
  ;plot, lc1
  ;ploterr, tt1-tt1(0), lc1, elc1
  plot, ff, dps                          ;plotting dynamic PS
  window, 1, xsize=480, ysize=360
  binlc, array, lc2, tbinsize=1.D, error=elc2, time=tt2, climits=[14,28];, outfile='/home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/lc_idl_trial2_PS.lc'
  ;plot, lc2
  ;ploterr, tt2-tt2(0), lc2, elc2
  plot, ff, dps                          ;plotting dynamic PS
  window, 3, xsize=480, ysize=360
  binlc, array, lc3, tbinsize=1.D, error=elc3, time=tt3, climits=[29,42];, outfile='/home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/lc_idl_trial2_PS.lc'
  ;plot, lc3
  ;ploterr, tt3-tt3(0), lc3, elc3
  plot, ff, dps                          ;plotting dynamic PS
  window, 4, xsize=480, ysize=360
  binlc, array, lc4, tbinsize=1.D, error=elc4, time=tt4, climits=[43,70];, outfile='/home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/lc_idl_trial2_PS.lc'
  ;plot, lc4
  ;ploterr, tt4-tt4(0), lc4, elc4
  plot, ff, dps                          ;plotting dynamic PS

  ;binlc, array, lc2, tbinsize=1.D, error=elc2, time=tt2, climits=[14,28]
  ;binlc, array, lc3, tbinsize=1.D, error=elc3, time=tt3, climits=[29,42]
  ;binlc, array, lc4, tbinsize=1.D, error=elc4, time=tt4, climits=[43,70]
  
  
  ;ffttime = 128.D
  ;RADPS, array, ffttime, dps, nyquistfreq=2048.D, freqavg=ff, freqwid=fw, climits=[0,140]
  
  
  
  
  ;plotting section  

  ;Plotting tool 1, only good if one wants to see the nature of the plot, however, it is not recommended when you need to know the time of an event.
  ;p = PLOT(lc, "r1-", YTITLE='counts', XTITLE='time (s)' ,TITLE="Light Curve for P90042", DIM=[1500,1000], MARGIN=0.2)
  ; Set some properties
  ;p.SYM_INCREMENT = 5
  ;p.SYM_COLOR = "blue"
  ;p.SYM_FILLED = 1
  ;p.SYM_FILL_COLOR = 0


  ;default plotting tool, highly recommended, however do not forget to use this with ploterr since otherwise it seems that this would just plot both the plots together.
  ;plotting for dynamic power spectra
  FREE_LUN, lun
end

;Note: it is not recommended that one use different obs ID observations since they might give problems with the time axis of LC