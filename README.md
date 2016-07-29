# HPE Cloud Service Automation Community Edition
![HPE Cloud Service Automation Community Edition](images/csa.PNG?raw=true "CSA")

This repo contains **scripts** which start **HPE Cloud Service Automation Community Edition 4.7 (HPE CSA CE)** in Docker. 

HPE CSA CE solution is composed of four components (each one represents one Docker image): **CSA Management Console**, **Marketplace Portal**, **HP Operation Orchestration Community Edition (HP OO CE) Central Server** and **PostgreSQL database**. 


### Concepts
HPE CSA is a **cloud management** software focused on automation and management of IT services in Hybrid Cloud enviroments. 

This community edition of CSA allows users to automate deployments of infrastracture, platform and application services in a hybrid cloud environment. End users can order these services from Marketplace Portal.

•	Automation includes **infrastructure** provisioning, **platform software** installation or configuration, **deployment of application** on complex environment like load balancer etc. 

•	Build the end-to-end process of your application's deployments using various **resource providers** like **VMWare vCenter, AWS EC2, OpenStack, Docker and many others.** Embrace components from other systems like **HPE OO, Chef,		Puppet and HP SA** etc. to install or configure software and deploy applications. 

•	Every service can be tested prior to publishing to **consumer catalogs** to mitigate the risk of providing not working services.


### Key features

•	**Ease of automation**. Supports HPE OO CE which is  the native automation tool which helps the end user to automate any complex steps. It contains 6000+ pre-created automated operations and workflows which can be leveraged to automate the installation of software and deployment application from day one. 

•	Offers service **application portability** across a vendor- neutral ecosystem by using a sophisticated service design modeling based on **TOSCA’s guiding principles**.

•	Simplified cloud design experience with intutive UI  and a content store for cloud services 

•	**Single IT Service Control Point** - Simplifies administration by using a complete IT operations management toolset with a **single-pane-of-glass experience** across traditional IT, and private and public clouds.

•	**Integration with third party products** like **vCenter, AWS, Azure, OpenStack, Docker, Chef, Puppet and Mesosphere** etc. SDK to integrate with home grown products or any third party products

•	**20+ integration with HP Software products like HPE Sitescope, HPE Application Lifecycle Management, HPE Stackato, HPE Oneview etc.**

•	Build **Cloud Agnostic blueprints** to deploy the application across different cloud vendor

•	Build **Cloud Native blueprints** to make the application components deployed as “micro-services”

•	**In-built versioning system** for application blue-prints and components

•	Heavy lifting is already done by the proven software **HP OO which acts as a central engine**

•	**Authentication & Authorization** supports CAC, SSO, LDAP, SAML etc.

•	**Role Based Access Control (RBAC)** support



### HPE CSA CE trial license limitations
1.	Trial period of 30 days with unlimited deployment for any number of OSI.
2.	After expiry of trial period upto 5 OSI will be  available if collection of product usage data by HPE is not selected during product activation.
3.	Upto 25 OSI will be available if collection of product usage data by HPE is selected during product activation.

### CSA version 
```
CSA 4.70 
```

# Prerequisites 
1.	Set up Docker client with “docker-compose” latest version as given in this  Docker site. [Reference Site : Install Docker Engine](https://docs.docker.com/engine/installation/linux/ubuntulinux/) [Reference Site : Install Docker Compose] (https://docs.docker.com/compose/install/)
2.	OS & System Requirements for Docker Client/Workstation
```
OS  : Ubuntu 12.x and above
HDD : 40GB 
RAM : 8GB 
CPU : 4
```

# Instructions to launch HPE CSA CE 4.70

```
1.	Commands to execute:
(If you are not creating a folder under /tmp, please make sure there is no docker-compose.yml exists in the directory before you execute the curl command to stand up CSA/CSA"

	•	mkdir /tmp/csa
	•	cd /tmp/csa 
	•	curl -k -L https://github.com/HewlettPackard/csa-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin <hostname> <ipaddress> [<proxyhost>] [<proxyport>]
 
  Please replace the arguments as per the below instruction,
  <hostname> is the Docker workstation/client hostname
  <ipaddress> is the Docker workstation/client ipaddress
  <proxyhost> optional proxy host
  <proxyport> optional proxy port

  For example, the Curl command should be as below. The hostname and ipaddress are sample
  curl -k -L https://github.com/HewlettPackard/csa-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin mydockerclient.mydomain.com 10.1.1.12 web-proxy.mydomain.com 8080

  Please always stop or start the containers using below commands,
  To stop: docker-compose stop
  To start: docker-compose up --no-recreate -d
  (Kindly note that docker-compose start is currently not supported)
```

# CSA Endpoints
Please find the exposed ports from which you can access various portals of CSA
```
	CSA Management Console - https://<dockerworkstations_ip>:18444/csa

	Credentials 	
	Username: admin
	Password: cloud
	
	Marketplace Portal - https://<dockerworkstations_ip>:18089

	Credentials 	
	Username: consumer
	Password: cloud

	Operations Orchestration Central - https://<dockerworkstations_ip>:18445/oo
	
	Credentials 
	Username: admin
	Password: cloud	
```


### Documents
The following documentation from the CSA 4.70 full release version is available for your reference:

1.	[Concepts Guide](https://github.com/HewlettPackard/csa-ce/raw/master/Docs/CSA_470_Concepts_Guide.pdf)

2.	[Help Guide - Management Console](https://github.com/HewlettPackard/csa-ce/raw/master/Docs/CSA_470_Management_Console_Help.pdf)

3.	[Help Guide - Marketplace Portal](https://github.com/HewlettPackard/csa-ce/raw/master/Docs/CSA_470_Marketplace_Portal_Help.pdf)

4.	[Configuration Guide](https://github.com/HewlettPackard/csa-ce/raw/master/Docs/CSA_470_Configuration_Guide.pdf)



### Important notes

•  Launch  HP OO Central portal https://<dockerworkstations_ip>:18445/oo

	Content Management > Configuration Items > System Properties > CSA_REST_URI should use the host name or IP Address of the Docker client machine instead of localhost, and the port 18444 instead of 8444

	Content Management > Configuration Items > System Accounts > CSA_REST_CREDENTIALS should use the user name as ooInboundUser and the password as cloud 

• HPSSO/LWSSO is not enabled. Please refer the help guide to configure HPSSO/LWSSO. 

• The scripts which helps for configuring the CSA will be available at the /tmp location of all the containers (please reach out to us for any enhancement on these scripts).

• Any capsule content upload which is new can be done within Docker CSA container and no extra configurations are required. The content zip file location should be mentioned in the

	/usr/local/hpe/csa/Tools/CSLContentInstaller/silent_install.xml. 

	For CSA, please use silent_install_csa.xml, incase if you have installed CSA license

• Alternatively you can register with HPE using HP Passport sign-in and deploy wide variety of contents from HPE CSA Content store. 
  
  For  more information please check the [HPLN] (https://hpln.hpe.com/). To get access please check [HPLN Help] (https://hpln.hpe.com/help/content-access)


### Known Issues
For product known issues, please refer CSA 4.70 Release Notes [here](https://github.com/HewlettPackard/csa-ce/raw/master/Docs/CSA_470_Release_Notes.pdf).


### License
View [license](https://github.com/HewlettPackard/csa-ce/blob/master/LICENSE) information for the software contained in this repo.

### Issues
If you have any problems with the software, or have questions about the software contained in this repo, please write us to tech-ambassadors-capu@hpe.com or [GitHub issue](https://github.com/HewlettPackard/csa-ce/issues).
