STARCRAFT_DIR=$WINEPREFIX/drive_c/StarCraft
if [ ! -e $STARCRAFT_DIR ]; then
  echo "Starcraft dir not found... maybe you should install it to C:/ first!"
  exit 1
fi

cp -r ~/TorchCraft/ $STARCRAFT_DIR
mkdir -p $STARCRAFT_DIR/characters
cp ~/bwapi.?pc $STARCRAFT_DIR/characters

cd $STARCRAFT_DIR
bash TorchCraft/quick_setup.sh

winetricks -q nocrashdialog

# For some reason docker hates setting up permission correctly :-/
echo starcraft | sudo -s ls -lah /root > /dev/null
