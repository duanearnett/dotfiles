# http://saintlad.com/install-macos-sierra-in-virtualbox-on-windows-10/
# vboxmanage modifyvm "macOS" --cpuidset 00000002 000106e5 00100800 0098e3fd bfebfbff
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/1/Config/DmiSystemProduct" "iMac11,3"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
#
#
# vboxmanage modifyvm "macOS" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
# vboxmanage setextradata "macOS" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
# VBoxManage setextradata "macOS" "VBoxInternal2/EfiGopMode" 5
# Where N can be one of 0,1,2,3,4,5 referring to the 640x480, 800x600, 1024x768, 1280x1024, 1440x900, 1900x1200
#  12345
