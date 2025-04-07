#!/bin/bash

echo Init file system...
steam

echo Creating Steam Temp Download file...
mkdir steamPackagesTemp
cd steamPackagesTemp

echo Downloading Steam runtime files...
#wget -O steamui_websrc_all.zip.vz https://client-update.steamstatic.com/steamui_websrc_all.zip.vz.1ad1f4ed7545ebaa3bd45076dad65929c469f4db_25036062
#wget -O strings_all.zip.vz https://client-update.steamstatic.com/strings_all.zip.vz.82489e483b7344b66c829e0fcaa866275d3e3feb_2009903
#wget -O public_all.zip.vz https://client-update.steamstatic.com/public_all.zip.vz.52e0b3370324bf50ed31f9e620850028d990afa2_23328936
#wget -O steamui_websrc_movies_all.zip https://client-update.steamstatic.com/steamui_websrc_movies_all.zip.53cd122dc50e8b909ef510c3eef4217db44d5051
#wget -O bins_ubuntu12.zip.vz https://client-update.steamstatic.com/bins_ubuntu12.zip.vz.ef81fc505c02c97ee5acdd013d280e79fea542c1_31445136
#wget -O bins_sdk_ubuntu12.zip.vz https://client-update.steamstatic.com/bins_sdk_ubuntu12.zip.vz.85d9284be57d36e2a66739730e2e00251649dbb8_19948017
#wget -O bins_misc_ubuntu12.zip.vz https://client-update.steamstatic.com/bins_misc_ubuntu12.zip.vz.2224721a20108d2bcc7012ce8aad4be8745bd2b6_18481599
#wget -O steam_ubuntu12.zip.vz https://client-update.steamstatic.com/steam_ubuntu12.zip.vz.617b4985a32c41761f000695118d3a286c050fd1_2509565
wget -O runtime_scout_ubuntu12.zip https://client-update.steamstatic.com/runtime_scout_ubuntu12.zip.24b2638d7cf6d284d786803cf17382472465ced7
wget -O runtime_sniper_ubuntu12.zip https://client-update.steamstatic.com/runtime_sniper_ubuntu12.zip.99c6062b6c89c13f9843dcc6eed99dfc66e8ef22

echo Unpacking 32 Bit runtime files...
unzip runtime_scout_ubuntu12.zip
cd ./ubuntu12_32/
unxz steam-runtime.tar.xz
tar xf steam-runtime.tar

echo Installing 32 Bit runtime files...
rm -rf ~/.local/share/Steam/ubuntu12_32/steam-runtime/
cp -r steam-runtime ~/.local/share/Steam/ubuntu12_32/
cd ..

echo Unpacking 64 Bit runtime files...
unzip runtime_sniper_ubuntu12.zip
cd ./ubuntu12_64/
unxz steam-runtime-sniper.tar.xz
tar xf steam-runtime-sniper.tar

echo Installing 64 Bit runtime files...
rm -rf ~/.local/share/Steam/ubuntu12_64/steam-runtime/
mkdir ~/.local/share/Steam/ubuntu12_64
#cp -r SteamLinuxRuntime_sniper ~/.local/share/Steam/ubuntu12_64/steam-runtime-sniper
#cp -r SteamLinuxRuntime_sniper ~/.local/share/Steam/ubuntu12_64/steam-runtime
cp -r SteamLinuxRuntime_sniper ~/.local/share/Steam/ubuntu12_64/SteamLinuxRuntime_sniper
cd ..

echo Cleaning up...
rm -rf steamPackagesTemp/
cd ~

echo Starting steam...
steam

