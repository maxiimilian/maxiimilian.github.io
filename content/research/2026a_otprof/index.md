---
layout: pub_single

title: "OTProf: estimating high-resolution profiles of optical turbulence ($C_n^2$) from reanalysis using deep learning"
authors: "**M. Pierzyna**, S. Basu, R. Saathof"

resources:
- name: header
  src: combined.png
  title: "Comparison of estimated (a) profiles and (b+c) column-integrated astroclimate parameters against meoscale model baseline (Ref) and traditional analytical baseline (HV+W71)."

pubKey: 2026a_otclim
pubJournal: arXiv (submitted to journal)
pubYear: 2026
pubUrl: https://arxiv.org/abs/2604.09346
# pubCode: https://github.com/mpierzyna/otprof
pubOpenAccess: true

tags:
- "Machine Learning"
- "Optical Turbulence"
---
Accurate high-resolution vertical profiles of optical turbulence ($C_n^2$), which reflect local meteorology and topography, are crucial for ground-based optical astronomy and free-space optical communication.
However, measuring these profiles or generating them with numerical weather models requires substantial operational or computational effort.
In this work, we present OTProf, a deep-learning method that estimates high-resolution $C_n^2$ profiles from widely available coarse-resolution ERA5 reanalysis data.
We evaluate the approach in the Netherlands and compare it with the commonly used Hufnagel-Valley model.
Overall, OTProf reproduces the vertical structure of $C_n^2$ more accurately than Hufnagel-Valley and yields more accurate estimates of the Fried parameter $r_0$ and the scintillation index $\sigma_I^2$.
As typical in machine learning, the $C_n^2$ predictions are slightly smoothed compared to reference data, especially in cases of rare strong turbulence.
This smoothing affects the integrated parameters, sometimes leading to overly optimistic $r_0$ and $\sigma_I^2$ values.
Despite this limitation, OTProf offers a more accurate, efficient, and physically consistent alternative to traditional analytical models and computationally expensive mesoscale models.
