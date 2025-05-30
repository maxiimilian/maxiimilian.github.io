---
layout: pub_single

title: "OTCliM: generating a near-surface climatology of optical turbulence strength ($C_n^2$) using gradient boosting"
authors: "**M. Pierzyna**, S. Basu, R. Saathof"

resources:
- name: header
  src: mcp.png
  title: "Proposed OTCliM approach to extrapolate a measured 1-year time series of optical turbulence strength (yellow) to multiple years (orange) based on ERA5 reference data (blue)."

pubKey: 2025a_otclim
pubJournal: Artifical Intelligence for the Earth Systems
pubYear: 2025
pubUrl: https://doi.org/10.1175/AIES-D-24-0076.1
pubCode: https://github.com/mpierzyna/otclim
pubOpenAccess: true

tags:
- "Machine Learning"
- "Optical Turbulence"
---
This study introduces OTCliM (Optical Turbulence Climatology using Machine learning), a novel approach for deriving comprehensive climatologies of atmospheric optical turbulence strength ($C_n^2$) using gradient boosting machines. 
OTCliM addresses the challenge of efficiently obtaining reliable site-specific $C_n^2$ climatologies, crucial for ground-based astronomy and free-space optical communication.
Using gradient boosting machines and global reanalysis data, OTCliM extrapolates one year of measured $C_n^2$ into a multi-year time series.
We assess OTCliM's performance using $C_n^2$ data from 17 diverse stations in New York State, evaluating temporal extrapolation capabilities and geographical generalization.
Our results demonstrate accurate predictions of four held-out years of $C_n^2$ across various sites, including complex urban environments, outperforming traditional analytical models. 
Non-urban models also show good geographical generalization compared to urban models, which capture non-general site-specific dependencies. 
A feature importance analysis confirms the physical consistency of the trained models.
It also indicates the potential to uncover new insights into the physical processes governing $C_n^2$ from data.
OTCliM's ability to derive reliable $C_n^2$ climatologies from just one year of observations can potentially reduce resources required for future site surveys or enable studies for additional sites with the same resources.

