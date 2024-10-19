
# Research Work in CSE

CRDT-based Serverless Middleware for Stateful Objects in the Edge-Cloud Continuum

You can run the code by following approaches

- Download OVA file provided and follow the instructions
- Use VM Manager like Oracle or Ubuntu system installed on your machine and Install tools and libraries




## 1) Using Ubuntu OVA File

If you want to use provided Ubuntu Oracle VM system with pre-istalled libraries and tool, please download the file and import it in your oracle VM Manager

https://unioulu-my.sharepoint.com/:f:/g/personal/marshad23_student_oulu_fi/ElDnTtMHIW9Nr23ZtlzMm0MB6PSfXRLPUNzBsb7RYuBEag?e=Nczv0f

password = mtalhaarshad

Open the terminal and navigate to the "serverless-middleware" cloned already

```
cd ./Desktop/serverless-middleware
```
run the following script, This script ensures that your Kubernetes cluster (MicroK8s) is running and that all OpenFaaS pods in the openfaas namespace are both running and ready. It begins by verifying the pod statuses and enters a loop, waiting for a specified intervalto recheck until all pods are ready or a timeout is reached. The script initiates port-forwarding from localhost:8080 to the OpenFaaS gateway

```
./runFaas.sh
```

After running the script, you can access the OpenFaaS gateway by navigating to http://127.0.0.1:8080/ui/ in your web browser. This URL will open the OpenFaaS dashboard, where you can manage and monitor your serverless functions seamlessly.

username = admin

password = pA6iteNeWOQP





If you have linux based system installed, please skip the below step 
## 2) Oracle VM Ubuntu Installation 
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


