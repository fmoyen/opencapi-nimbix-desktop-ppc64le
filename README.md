# opencapi-nimbix-desktop-ppc64le
Github repository used to generate a docker image (ppc64le Ubuntu) allowing to test CAPI / OPENCAPI cards integration into Jarvice XE cloud (Kubernetes)

## Releases (linked with Docker Hub tags)
V1.4: Added iputils-ping installation
V1.6: Image upgraded to Ubuntu 18.04.5 LTS (Bionic Beaver) => SSH OK but GUI through Jarvice not working anymore => NOT VIABLE IMAGE !!
V1.7: Image upgraded to Ubuntu 16.04.7 LTS (Xenial Xerus) => GUI still working => GOOD
V1.8: update-manager-core installation & comment git clone stuff (clone is done when checking by running the image locally but when running in Jarvice cloud, snap and oc-accel not there !)
