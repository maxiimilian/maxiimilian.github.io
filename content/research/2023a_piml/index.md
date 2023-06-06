---
layout: pub_single

title: "$\\Pi$-ML: A dimensional analysis-based machine learning parameterization of optical turbulence in the atmospheric surface layer"
authors: "**M. Pierzyna**, R. Saathof, S. Basu"

resources:
- name: header
  src: 2023a_piml_methodology.png
  title: "The two components of our $\\Pi$-ML approach: Combination of dimensional variables into non-dimensional $\\Pi$-variables and the subsequent XGBoost ensemble training."

pubJournal: arXiv (pre-print)
pubYear: 2023
pubUrl: https://arxiv.org/abs/2304.12177
pubCode: https://github.com/mpierzyna/piml
pubOpenAccess: true

tags:
- "Machine Learning"
- "Optical Turbulence"
---
Turbulent fluctuations of the atmospheric refraction index, so-called optical turbulence, can significantly distort propagating laser beams. 
Therefore, modeling the strength of these fluctuations ($C_n^2$) is highly relevant for the successful development and deployment of future free-space optical communication links. 
In this article, we propose a physics-informed machine learning (ML) methodology, $\Pi$-ML, based on dimensional analysis and gradient boosting to estimate $C_n^2$.
Our approach combines ideas from traditional physics-based $C_n^2$ parametrizations and recent ML-based ones into a high-accuracy, statistically robust, non-dimensional model.
Through a systematic feature importance analysis, we identify the normalized variance of potential temperature as the dominating feature for predicting turbulence strength.
For statistical robustness, we train an ensemble of models which yields high performance on the out-of-sample data of $R^2=0.958\pm0.001$.
