<a name="readme-top"></a>

<!--
Readme for the tfvaed_0.1 Woods Lake model
-->

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">

<!--
  <a href="https://github.com/AquaticEcoDynamics/woods_model_tfvaed_0.1">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>
-->

<h3 align="center">HydroTasmania <em>Woods Lake Water Quality Model</em></h3>

  <p align="center">
    This repository houses the hydrodynamic-biogeochemical model for Woods Lake, a lake located in Tasmania.
    ·
    <a href="https://github.com/AquaticEcoDynamics/woods_model_tfvaed_0.1/issues">Report Bug</a>
    ·
    <a href="https://github.com/AquaticEcoDynamics/woods_model_tfvaed_0.1/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<br>

## Built With

<br>

[![TUFLOW-FV](https://img.shields.io/badge/TUFLOW--FV-2023.0.0-yellow)](https://tuflow.com/products/tuflow-fv/)
[![AED](https://img.shields.io/badge/AED-2.2.4-brightgreen)](https://aquatic.science.uwa.edu.au/research/models/AED/quickstart.html)

<!--
* [![Next][Next.js]][Next-url]
* [![React][React.js]][React-url]
* [![Vue][Vue.js]][Vue-url]
* [![Angular][Angular.io]][Angular-url]
* [![Svelte][Svelte.dev]][Svelte-url]
* [![Laravel][Laravel.com]][Laravel-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->
<br>

<!-- GETTING STARTED -->

## Getting Started

<br>

This repository contains model files (except the `bc_repo`) that are version-controlled can be run locally on Windows or Linux. The `bc_repo` contains boundary conditions files that the sizes are too large to be stored at Github, 
therefore they are stored in an associated project folder and can be accessed by direct download or a `fetch` method (see below). To get a local copy up and running follow these steps.

### Prerequisites

Running the model contained herein requires users to have an active TUFLOW-FV binary and license with the AED pre-compiled plugin.

- Download and install the TUFLOW-FV model and license server from [BMT TUFLOW](https://www.tuflow.com/products/tuflow-fv/).

- Download and install the compatible AED model plugin (FV-AED) from [the UWA-AED releases repository](https://github.com/AquaticEcoDynamics/releases).

### Cloning and executing the model

1. Clone the current woods_model_tfvaed_0.1 repo
   ```sh
   Linux: git clone https://github.com/AquaticEcoDynamics/woods_model_tfvaed_0.1.git
   Windows: use Github Destop to clone or download ZIP at the Github website
   ```
2. Clone the complete model files including `bc_repo` folder. For Linux users, copy the fetch_woods.sh shell file from the Github [woods_model_tools](https://github.com/AquaticEcoDynamics/woods_model_tools/blob/main/fetch/fetch_woods.sh) repository. Then fetch the `bc_repo` as:
   ```sh
   ./fetch_woods.sh 1.0
   ```
   The above fetch command will download all the model files including the bc_repo;
   
3. Go to the main model run directory, and execute model as:
   ```sh
   {tfv_aed binary} {csiem model tfvaed 1.0 main configuration}.fvc
   ```

### Folder structure and file naming conventions

1. Folder structure: model files are organized in the following catogories/folders:

| Folders        | Content                                                     |
| -------------- | ----------------------------------------------------------- |
| **bc_repo**    | repository for boundary condition files                     |
| **gis_repo**   | repository for GIS files required by the model simulations  |
| **includes**   | model configuration files for being included in simulations |
| **model_runs** | main model configuration files                              |
| **outputs**    | place holder for model output storage                       |

2. File naming convention: model files are named using the following conventions:

- model_runs

| Sub-type                | Conventions                                                            | comments                                                                                                                                                                                          |
| ----------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| WQ (water quality)      | woods\_{model generation ID}\_{mesh option}\_{model period}\_WQ.fvc    | Main configuration file for coupled TFV-AED model, e.g. woods_v1_B009_20130101_20131231_WQ.fvc                                                                                                    |
| HD (hydrodynamics)      | woods\_{model generation ID}\_{mesh  option}\_{model  period}\_HD.fvc  | Main configuration file for TFV hydrodynamic model only, e.g. woods_v1_B009_20130101_20131231_HD.fvc                                                                                              |

- includes

| Sub-type                 | Conventions                                       | comments                                                                         |
| ------------------------ | ------------------------------------------------- | -------------------------------------------------------------------------------- |
| bc (boundary conditions) | {boundary type}\_{data source}\_{data period}.fvc | e.g. met_BOM_liawenee_20130101_20131231.fvc                                      |
| ic (initial condition)   | initial_conditions\_{model version}.fvc           | e.g. initial_conditions_wq.fvc                                                   |
| domain                   | domain_config\_{mesh option}\_{model type}.fvc    | e.g. domain_config_woods_mesh.fvc                                                |
| turbulence               | turbulence.fvc                                    | Include configuration for turbulence parameters                                  |
| wq (water quality)       | AED model configuration files                     | Include configuration for AED water quality module                               |
| output                   | output\_{output category}.fvc                     | Configuration for model outputs, e.g. output_wq.fvc                              |
| roughness                | roughness_material\_{version NO}.fvc              | Configuration for benthic roughness settings, e.g. roughness_wq_Material_011.fvc |

- bc_repo

| Sub-type                                 | Conventions                                                                                              | comments                                                                             |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| 1_weather (weather condition)            | {data source}\_{domain}\_{UTC zone}\_{data period}.nc                                                    | e.g. BOM_UTC+0_20220101_20230101.nc                                              |
| 2_waves (waves inputs)                   | {data source}\_{domain}\_{UTC zone}\_{data period}.nc                                                    | e.g. SWAN_UTC+0_20150101_20151231.nc                                            |
| 3_weir (dam wall)                       | {location}\_{BC type}\_{ data period}\_{model type}.csv                                                  | e.g.  Dam_20100101_20230101_wq.csv                                             |
| 4_river (lake river)                     | N/A (to be updated)                                                                                      |                                                                                      |

- gis_repo

| Sub-type                                         | Conventions                                         | comments                             |
| ------------------------------------------------ | --------------------------------------------------- | ------------------------------------ |
| 1_domain (GIS files for model domain)            | woods\_mesh\_{mesh option}\_{version ID}\_{resolution} | e.g. woods_mesh_B009_opt.2dm         |
| 2_benthic (GIS files for benthic conditions)     | woods\_{benthic type}\_{version ID}                   | e.g. Woods_Material_011.shp |
| 3_output (GIS files for output definition)       | output_point.csv                                |                                      |

### Analysis

Input files and model output files are able to be processed using the `aed-marvl` repository that includes the supporting scripts and site data. Please contact the developers for further information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->

## Contributing

Contributions from the user and developer community are welcome and **greatly appreciated**!.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the --- License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Matt Hipsey: [@matthipsey](https://twitter.com/matthipsey) - matt.hipsey@uwa.edu.au


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/AquaticEcoDynamics/csiem_model_tfvaed_1.0.svg?style=for-the-badge
[contributors-url]: https://github.com/AquaticEcoDynamics/csiem_model_tfvaed_1.0/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AquaticEcoDynamics/csiem_model_tfvaed_1.0.svg?style=for-the-badge
[forks-url]: https://github.com/AquaticEcoDynamics/csiem_model_tfvaed_1.0/network/members
[stars-shield]: https://img.shields.io/github/stars/AquaticEcoDynamics/csiem_model_tfvaed_1.0.svg?style=for-the-badge
[stars-url]: https://github.com/AquaticEcoDynamics/csiem_model_tfvaed_1.0/stargazers
[issues-shield]: https://img.shields.io/github/issues/AquaticEcoDynamics/csiem_model_tfvaed_1.0.svg?style=for-the-badge
[issues-url]: https://github.com/AquaticEcoDynamics/csiem_model_tfvaed_1.0/issues
[license-shield]: https://img.shields.io/github/license/AquaticEcoDynamics/csiem_model_tfvaed_1.0.svg?style=for-the-badge
[license-url]: https://github.com/AquaticEcoDynamics/csiem_model_tfvaed_1.0/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
