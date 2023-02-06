# FishPassage

This repository contains the implementation of an OpenFOAM model for the case of fish passage. It uses `interFoam` to solve the free surface, and a Delayed Eddy Simulation treatment to solve the turbulence, using the `kOmegaSSTDDES` model.

The model has a couple of interesting features, that apply to other cases:
- A fixed water level boundary condition in the downstream boundary, which is achieved by fixing the pressure (`p_rgh`) in all the wet faces.
- The air velocities attenuation technique explained in this repository: [github.com/nicolasbadano/airVelocityAttenuation](https://github.com/nicolasbadano/airVelocityAttenuation)

## Getting Started

* Run the `prepare.sh` to generate the mesh and set up the simulation.
* Then run the case with `interFoam`

## Results

[![Watch the video](https://img.youtube.com/vi/ytWlFbu8u-I/maxresdefault.jpg)](https://youtu.be/ytWlFbu8u-I)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Author

Nicolás Diego Badano (https://www.linkedin.com/in/nicolas-diego-badano/)
