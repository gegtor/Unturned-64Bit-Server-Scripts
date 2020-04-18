## Tested and confirmed working on (As of April 18th 2020)
    Ubuntu 16.04 LTS
    Ubuntu 18.04 LTS

## 0. Install these prerequisites
    sudo apt-get install screen htop unzip                                   # Usefull utilities
    sudo apt-get install lib32stdc++6                                        # SteamCMD dependencies
    sudo apt-get install mono-runtime mono-reference-assemblies-2.0          # Unity env
    sudo apt-get install libc6 libgl1-mesa-glx libxcursor1 libxrandr2        # 64 bit prerequisites for Unity 3D
    sudo apt-get install libc6-dev libgcc-4.8-dev                            # prerequisites for BattlEye
    
## 1. Download and extract files in your home dir
    wget https://github.com/gegtor/Unturned-64Bit-Server-Scripts/archive/master.zip
    unzip master.zip
    rm master.zip
    cp -r Unturned-64Bit-Server-Scripts-master/* ~/
    rm -r Unturned-64Bit-Server-Scripts-master/

## 2. Set correct script permissions and allow them to execute
    sudo chmod +x start.sh
    sudo chmod +x update.sh

## 3. Install the game
    ./update.sh

## 4. Copy Rocket module and exe and then delete them
    cp -r Rocket.Unturned/ Unturned_Server/Modules/
    cp RocketLauncher.exe Unturned_Server/

    rm -r Rocket.Unturned/ RocketLauncher.exe

## 5. Copy Steam lib just to be on the safe side
    sudo cp Steam_CMD/linux64/steamclient.so /lib

## 6. Start your new server!
    ./start.sh <instance_name>
    ./start.sh server-1

## 7. To prevent server from being closed when exiting ssh session run it in screen
    screen -S <screen_name>
    ./start.sh <instance_name>

    screen -x <screen_name> to return to your screen
