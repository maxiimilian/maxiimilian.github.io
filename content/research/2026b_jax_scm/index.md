---
layout: pub_single

title: "JAX-SCM v1.0: a modern atmospheric single-column model for boundary layer research"
authors: "**M. Pierzyna**"

resources:
- name: header
  src: res_WG33.png
  title: "Simulation of convective boundary layer using JAX-SCM. Initial profiles are from observations/soundings."

pubKey: 2026b_jax_scm
pubJournal: arXiv (submitted to journal)
pubYear: 2026
pubUrl: https://arxiv.org/abs/2605.24544
pubCode: https://github.com/mpierzyna/jax_scm
pubOpenAccess: true

tags:
- "Machine Learning"
- "Boundary Layer Turbulence"
---
We present JAX-SCM v1.0, an open-source atmospheric single-column model for boundary layer research, implemented in Python using the JAX computing library.
The model solves for horizontal wind, potential temperature, and specific humidity, combined with prognostic turbulent kinetic energy and turbulent statistics parameterized by the Mellor-Yamada-Nakanishi-Niino level-2.5 (MYNN-2.5) turbulence closure.
We verify the implementation against three well-established benchmark cases covering neutral (turbulent Ekman layer), stable (GABLS1), and convective (Wangara Day-33) conditions.
Close agreement with reference solutions is demonstrated across all regimes.
By building on JAX, the model benefits from just-in-time compilation and native GPU support.
While JAX-SCM is not yet fully differentiable, basing it on JAX also lays the foundation for future integration with machine learning components. 
The model is designed for simplicity and modularity, lowering the barrier to entry for users and developers alike.