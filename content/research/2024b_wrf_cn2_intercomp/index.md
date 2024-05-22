---
layout: pub_single

title: "Intercomparison of flux, gradient, and variance-based optical turbulence ($C_n^2$) parameterizations"
authors: "**M. Pierzyna**, O. Hartogensis, S. Basu, R. Saathof"

resources:
- name: header
  src: thumbnail.jpg
  title: "Comparision of $C_n^2$ (markers) observed at two levels with $C_n^2$ time series (line) estimated from mesoscale simulations using a variance-based parameterization."

pubKey: 2024b_wrf_cn2_intercomp
pubJournal: Applied Optics
pubYear: 2024
pubUrl: https://doi.org/10.1364/AO.519942
pubCode: https://github.com/mpierzyna/wrf_cn2_intercomp
pubOpenAccess: false

tags:
- "Mesoscale Modelling"
- "Optical Turbulence"
---
For free-space optical communication (FSOC) or ground-based optical astronomy, abundant data of optical turbulence strength ($C_n^2$) is imperative but typically scarce. 
Turbulence conditions are strongly site-dependent, so their accurate quantification requires in-situ measurements or numerical weather simulations.
If $C_n^2$ is not measured directly, e.g., with a scintillometer, $C_n^2$ parameterizations must be utilized to estimate $C_n^2$ from meteorological observations or model output. 
Even though various such parameterizations exist in the literature, their relative performance is unknown.
We fill this knowledge gap by performing a systematic three-way comparison of a flux-based, a gradient-based, and a variance-based parameterization.
Each parameterization is applied to both observed and simulated meteorological variables, and the resulting $C_n^2$ estimates are compared against observed $C_n^2$ from two scintillometers. 
The variance-based parameterization yields the overall best performance, and unlike other approaches, its application is not limited to the lowest part of the atmospheric boundary layer, i.e., the surface layer.
We also show that $C_n^2$ estimated from the output of the Weather Research and Forecasting (WRF) model aligns well with observations, highlighting the value of mesoscale models for optical turbulence modeling.

The `namelist` files to run the WRF model and the Python code to post-process the simulation output to obtain $C_n^2$ are available on Github: https://github.com/mpierzyna/wrf_cn2_intercomp.
