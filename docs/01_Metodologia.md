---
editor: 
  markdown: 
    wrap: 72
---

# Modelos Estadísticos de Población

Para la realización del Censo de Población y Vivienda de Barbados 2023,
se emplearon avanzados modelos estadísticos con el objetivo de mejorar
la precisión y confiabilidad de las estimaciones poblacionales. La
División de Estadística del Departamento de Asuntos Económicos y
Planificación de Barbados, en colaboración con expertos de la Comisión
Económica para América Latina y el Caribe (CEPAL) y el Fondo de
Población de las Naciones Unidas (UNFPA), llevó a cabo un exhaustivo
proceso de investigación y desarrollo que culminó en la implementación
de varios modelos estadísticos integrados.

Estos modelos se basaron en una combinación de diversas fuentes de
información, incluyendo datos del censo, registros administrativos e
información geoespacial. La integración de estos datos permitió la
creación de un panorama más completo y detallado de la población
barbadense.

Entre los enfoques utilizados se encuentran:

## Modelo de Predicción de la Población

Para el Censo de Población y Vivienda de Barbados 2023, se implementó un
modelo estadístico bayesiano avanzado para predecir el número de
personas en las viviendas no visitadas o en las que se rechazó responder
al censo. Este modelo sigue una metodología similar a la utilizada en el
Proyecto WorldPop de la Universidad de Southampton, y está basado en la
suposición de que el número de personas en una unidad primaria de
muestreo (UPM) sigue una distribución de Poisson.

El modelo desarrollado permite predecir el número de personas en las
viviendas no visitadas o que rechazaron responder al censo. La
predicción se basa en la siguiente fórmula de Poisson:

\[ Y\_{ij} \sim \text{Poisson}(N\_{ij} \times D\_{ij}) \] \[
\log(D\_{ij}) = x\_{ij} \beta + z\_{ij} \gamma \]

donde:

-   ( Y\_{ij} ) representa el número de personas en la i-ésima vivienda
    de la j-ésima UPM.

-   ( N\_{ij} ) es el número de viviendas en esa UPM. - ( D\_{ij} ) es
    la densidad poblacional esperada en esa UPM.

Este modelo proporciona una estimación robusta de la población en áreas
que no han sido completamente cubiertas por el censo, mejorando la
calidad y exactitud de los datos obtenidos.

### Implementar el modelo en *Stan* {.unnumbered}

El modelo se especifica en el siguiente bloque de código, que utiliza el
lenguaje de modelización estadística Stan. Este enfoque permite integrar
múltiples fuentes de información y ajustar las estimaciones para
proporcionar una predicción precisa de la población en las UPMs.

**Datos:**


```stan
data {
  int<lower=1> D_obs; // Número de UGMs observadas en el censo 
  int<lower=1> D_tot; // Número de UGMs en el pais
  int<lower=1> P; // Cantidad de regresores en los efectos fijos 
  int<lower=1> Q; // Cantidad de efectos aleatorios
  int<lower=0> Y_obs[D_obs]; // Conteos de poblacion observada por UGM 
  int<lower=0> V_obs[D_obs]; // Número de estructuras observadas en la UGM 
  int<lower=0> V_tot[D_tot]; // Número de estructuras en la covariable satelital 
  matrix[D_obs, P] X_obs; // Matriz de covariables en las UGMs observadas 
  matrix[D_tot, P] X_tot; // Matriz de covariables en todas las UGMs del pais
  matrix[D_obs, Q] Z_obs; // Matriz de dummies para los efectos aleatorios en las UGMs observadas 
  matrix[D_tot, Q] Z_tot; // Matriz de dummies para los efectos aleatorios en todas las UGMs del pais
}
```


**Parámetros:**



**Parámetros Transformados:**

\`\`\` {.stan style="color: red", eval = FALSE} transformed parameters {
vector\<lower=0\>\[D_obs\] lambda; // Parámetro de la distribución
Poisson vector\[D_obs\] lp; // Parámetro lineal de la distribución
log-normal

lp = X_obs \* beta + Z_obs \* gamma;

for (d in 1:D_obs) { lambda\[d\] = densidad\[d\] \* V_obs\[d\]; } }

```         

**Modelo:**

```{.stan style="color: red", eval = FALSE}
model {
  // Priors
  gamma ~ normal(0, sigmaU);
  beta ~ normal(0, 1);
  sigma ~ cauchy(0, 2.5);
  sigmaU ~ normal(0, 1);
  
  // Likelihood
  Y_obs ~ poisson(lambda);
  
  // Log-normal distribution for densidad
  densidad ~ lognormal(lp, sigma);
}
```

**Cantidades Generadas:**

\`\`\`{.stan style="color: red", eval = FALSE} generated quantities {
vector\[D_tot\] lp_tot; real\<lower=0\> densidad_hat\[D_tot\]; //
Predicción de la densidad de todas las UGMs del país int\<lower=0\>
Y_tot\[D_tot\]; // Conteos de población observada por UGM en todo el
país

lp_tot = X_tot \* beta + Z_tot \* gamma;

for (d in 1:D_tot) { densidad_hat\[d\] = lognormal_rng(lp_tot\[d\],
sigma); densidad_hat\[d\] = fmin(densidad_hat\[d\], 20); Y_tot\[d\] =
poisson_rng(densidad_hat\[d\] \* V_tot\[d\]); } } \`\`\`
