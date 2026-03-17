# !bin/bash

if [[ -v layermap_configured ]]; then

    echo ""
    echo "layer-MAP is already configured"
    echo ""

    return
fi

## set up the environment here below

# fresurfer
export FREESURFER_HOME=/usr/local/freesurfer/7.3.2 #linux
# export FREESURFER_HOME=/Applications/freesurfer/7.4.1 #mac

source $FREESURFER_HOME/SetUpFreeSurfer.sh

# matlab
matlabpath=/usr/local/MATLAB/R2018a/bin/matlab

## DO NOT TOUCH HERE BELOW ###################################################

# get the path of the current script aka the toolbox
# layer_MAP_dir="$(dirname $0)"

# make all the scripts executable
find $layer_MAP_dir/src -name '*.sh' -exec chmod u+x {} \;

# add the toolbox to the path
export PATH=$PATH:$layer_MAP_dir
export PATH=$PATH:$(find $layer_MAP_dir/src -maxdepth 1 -type d | paste -sd ":" -)

## print messages

echo ""
echo ""
echo "    ___________________________________________________________"
echo "                                        _   _    __     ____   "
echo "        /                                /  /|    / |    /    )"
echo "    ---/----__----------__---)__--------/| /-|---/__|---/____/-"
echo "      /   /   ) /   / /___) /   ) ===  / |/  |  /   |  /            is ready to use"
echo "    _/___(___(_(___/_(___ _/__________/__/___|_/____|_/________"
echo "                  /                                            "
echo "    ___________________________________________________________"       
echo ""
echo ""
echo "    Contributors: "
echo "      - Marco Barilari"
echo "      - Kenshu Koiso"
echo "      - Paul A. Taylor"
echo "      - Omer Faruk Gulban Taylor"
echo "      - Daniel Glen"
echo "      - Peter Bandettini"
echo "      - Olivier Collignon"
echo "      - Renzo Huber"
echo "      - et al. ... do you want to be the next one?"
echo ""
echo ""


layermap_configured=1
