# Eventually run this as User-data on the machine, but now just manually running in powershell

# Will also likely in the future want to download to EBS as opposed to machine

$DOWNLOAD_LOCATION="C:\Users\Administrator\Downloads\"

# Download the installer and run silently
$STEAM_SETUP=$DOWNLOAD_LOCATION + "SteamSetup.exe"
Invoke-WebRequest -Uri "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -Outfile $STEAM_SETUP

Start-Process -Wait -FilePath $STEAM_SETUP -Argument "/S" -PassThru

# TODO add NVIDIA drivers if needed
# https://docs.aws.amazon.com/en_en/AWSEC2/latest/WindowsGuide/install-nvidia-driver.html

# add niceDCVServer
$niceDCVServer=$DOWNLOAD_LOCATION + "NICEDCV-Server.msi"
Invoke-WebRequest -Uri "https://d1uj6qtbmh3dt5.cloudfront.net/nice-dcv-server-x64-Release.msi" -Outfile $niceDCVServer
$niceDCVArgs = "/I " + $niceDCVServer + " /quiet /norestart"
Start-Process msiexec -Wait -ArgumentList $niceDCVArgs

# TODO add niceDCVDisplayDriverUrl if needed (unclear when)


# Finally start steam with login

# This works but requires that Steam Guard be disabled or have to input MFA code
'.\Program Files (x86)\Steam\Steam.exe' -login $USERNAME $PASSWORD