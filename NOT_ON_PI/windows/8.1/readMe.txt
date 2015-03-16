https://social.technet.microsoft.com/forums/windows/en-US/56ff83ff-1f15-4fc1-aa37-6651340d46fa/windows-81-connecting-to-ad-hoc-networks


It turns out that Windows 8.1 doesn't show ad-hoc networks and it's by design. Not sure what on earth made them add this change.
Anyway, after a lot of digging, I was finally able to force it to connect. I compiled a small howto.
Note, this is NOT about how to create an ad-hoc network to share your Internet connection with another device! It's about how to connect your Windows 8.1 PC to an existing ad-hoc network created on another device.

How to connect to an ad-hoc WiFi network in Windows 8.1.
Because the wireless network picker in Windows 8.1 doesn't show ad-hoc networks, connecting must be done by hand.
To see all networks in range, including ad-hoc, run this command in command shell (cmd.exe):
> netsh wlan show networks

SETUP
This must be done once per network.
go to "Network and Sharing Center"
click "Set up a new connection or network"
double click "Manually connect to a wireless network"
enter the SSID of the ad-hoc network (as shown by "netsh wlan show networks") into the "Network name" field
configure security settings accordingly
uncheck "Start this connection automatically" (important)
click "Next", then "Close"
Run this command (important):
> netsh wlan set profileparameter <ssid> connectiontype=ibss
Replace <ssid> with the SSID of your network.

CONNECT
After setting up, run this command whenever you want to connect:
> netsh wlan connect <ssid>
Replace <ssid> with the SSID of your network.
Hovering over WiFi icon in system tray will show the name of the network that you are currently connected to, even if it's an ad-hoc network (the network picker will not show it if it's ad-hoc). The name is also visible in "Network and Sharing Center" window.

DISCONNECT
To disconnect from the ad-hoc network: connect to a different network, turn off wifi, or run this command:
> netsh wlan disconnect

CLEANUP
To remove the network profile from Windows, run this command:
> netsh wlan delete profile <ssid>
Replace <ssid> with the SSID of your network.

http://www.techotimes.com/p/adhoc-network-in-windows-8-and-81-solved.html

http://www.sharebeast.com/5ft39mql0ysx
