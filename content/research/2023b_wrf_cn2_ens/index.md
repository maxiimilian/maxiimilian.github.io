---
layout: pub_single

title: "A multi-physics ensemble modeling framework for reliable $C_n^2$ estimation"
authors: "**M. Pierzyna**, R. Saathof, S. Basu"

resources:
- name: header
  src: 2023b_wrf_cn2_ens.jpg
  title: "Ensemble $C_n^2$ predictions from Weather Research and Forecasting model compared to observed $C_n^2$ from two scintillometers."

pubKey: 2023b_wrf_cn2_ens
pubJournal: Environmental Effects on Light Propagation and Adaptive Systems VI
pubYear: 2023
pubUrl: https://doi.org/10.1117/12.2680997
pubOpenAccess: false
hideSummary: true

tags:
- "Mesoscale Modelling"
- "Optical Turbulence"
---
Free-space optical communication (FSOC) links are considered a key technology to support the increasing needs of our connected, data-heavy world, 
but they are prone to disturbance through atmospheric processes such as optical turbulence. 
Since turbulence is highly dependent on local topographic and meteorological conditions, modeling optical turbulence strength $C_n^2$ is challenging during the design phase of an optical link or network. 
Over the past 25 years, $C_n^2$ parameterizations of varying complexities have been combined with various numerical weather prediction models for the spatio-temporal estimation of $C_n^2$. 
However, the outputs of these models can exhibit substantial variability based on the user-defined configuration that determines how atmospheric processes are represented. 
To address this concern, we propose to run not a single model configuration but multiple diverse ones to generate an ensemble estimate of $C_n^2$. 
We employ the Weather Research and Forecasting model (WRF) with ten different planetary boundary layer (PBL) physics schemes forming a diverse ensemble yielding a probabilistic $C_n^2$ estimate. 
We demonstrate that this ensemble outperforms the individual runs when compared to scintillometer field measurements and show it to be robust against outliers. 
We believe that FSOC downstream tasks such as link budget estimations should also become more robust if based on a $C_n^2$ ensemble estimate compared to single model runs.
