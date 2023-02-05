---
layout: pub_single

title: Data-driven splashing threshold model for drop impact on dry smooth surfaces
authors: "**M. Pierzyna**, D. A. Burzynski, S. E. Bansmer, R. Semaan"

resources:
- name: header
  src: 2021_drop_impact.png
  title: Schematic of our three-step data-driven approach.

pubJournal: Physics of Fluids
pubYear: 2021
pubUrl: https://aip.scitation.org/doi/10.1063/5.0076427
pubCode: https://github.com/FlowModelingControl/data_driven_splashing_model
pubOpenAccess: true

tags:
- "Machine Learning"
---
We propose a data-driven threshold model to redefine the boundary between deposition and splashing 
for drop impact on dry smooth surfaces. The starting point is the collection and digitization of 
multiple experimental sources with varying impact conditions. The model is based on the theory of 
Riboux and Gordillo [Riboux and Gordillo, "Experiments of drops impacting a smooth solid surface: 
A model of the critical impact speed for drop splashing," Phys. Rev. Lett. 113, 024507 (2014)] and 
is obtained by an uncertainty quantification analysis coupled with machine learning. The uncertainty 
quantification analysis elucidates the relevance of the impact condition uncertainties when estimating 
the splashing parameter. The proposed threshold model is trained using a support vector machine 
algorithm variant that includes uncertainty as a hyperparameter. This threshold model is generalized 
by complexity reduction and is eightfold cross-validated on the reference data. The results reveal 
a dependency of the splashing threshold on the impact velocity, the liquid viscosity, the surface 
tension, and the gas density. Detailed quantification of the prediction performance and a comparison 
with state-of-the-art models show that the proposed threshold model is the most accurate model to 
describe the boundaries between deposition and splashing for a wide range of impact conditions. 
The simplicity and accuracy of this model make it an alternative to existing approaches.
