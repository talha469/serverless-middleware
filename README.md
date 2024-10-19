
# Research Work in CSE

CRDT-based Serverless Middleware for Stateful Objects in the Edge-Cloud Continuum




If you have linux based system installed, please skip the below step 
## Oracle VM Ubuntu Installation 
- Download [Oracle VM](https://www.virtualbox.org/wiki/Downloads) and create a new virtual machine
- Download [Ubuntu Iso File](https://ubuntu.com/download/desktop) - we are using ubuntu 24.04.1 LTS in this project
- For easy copy paste and other handy options between host machine and VM, please follow these steps:

  - **Install Guest Additions**:
  Some VMs have already guest additions installed but the version mismatch     might cause the issue with Oracle VM Manager
    - Start your Ubuntu virtual machine.
    - From the VirtualBox menu, click on **Devices > Insert Guest Additions CD Image**.
    - Open a terminal in Ubuntu, and run the following command to install necessary dependencies:
      ```
      sudo apt update
      ```

    - After this, run the Guest Additions installer 

      ```
      sudo sh /media/$USER/VBox_GAs_*/VBoxLinuxAdditions.run
      ```
        In case you run with any issue, please install all required packages mentioned in the error details and retry above command

    - Restart the VM
        ```
        reboot
        ```
  - Enable Bidirectional Clipboard and Drag & Drop

    1. Click on your VM and go to **Settings** -> **Advanced**.
    2. Set **Shared Clipboard** to **Bidirectional**.
    3. Set **Drag and Drop** to **Bidirectional**.
    4. Click **OK** to save changes.


## Installation

Check if Git is installed in the system by running the following command in the terminal:

```bash
 git --version
```
If Git is installed, you will see the installed version of Git (e.g., git version 2.x.x). If Git is not installed, you will see a message like command not found

If Git is not installed, follow these steps:

```
sudo apt update
sudo apt install git
git --version
```

### Pull a GitHub Repository

 **Clone the repository**:
   ```bash
   git clone https://github.com/talha469/serverless-middleware.git
   cd serverless-middleware
   ```

### Install required tools
To save the time we have created a executable script to install all required packages and tools, run the script below. It can take some time

```
sudo ./install_tools.sh
```







## Acknowledgements

This repo is heavily built on [miso-serverless-middleware](https://github.com/valentingc/miso-serverless-middleware)

