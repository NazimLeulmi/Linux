---
Author: Nazim Leulmi
Sub   : CompTIA network+ networking fundamentals
prof  : Messer
---

# Introduction to IP

## IP Analogy

- We can look at **UDP & TCP** as two different courier/shipping services :-
   - **TCP** is slower , however, it is a reliable service .
   - **UDP** is faster , however, it is unreliable.
- **Internet Protocol(IP)** is responsible for transferring data from an IP to another.
   - **trucks , ships, & planes** are commonly used to transfer items between addresses.
- The vehicles hold **packets of data** inside them
   - **UDP data packets** 
   - **TCP data packets**
   - The boxes (packets) themselves contain **application information**
- **Network topology** is the structure & arrangement of the network (DSL,Ethernet,Cable)
   - **roads , sky routes & oceans** define the structure that the vehicle uses to move on.
- Every piece has a specific job. 

---

## Visual representation of an Ethernet network (TCP/IP) 
**Ethernet Header** |      Ethernet Payload       | **Ethernet Trailer**  
**Ethernet Header** | IP |      IP Payload        | **Ethernet Trailer**  
**Ethernet Header** | IP | TCP |   TCP Payload    | **Ethernet Trailer**  
**Ethernet Header** | IP | TCP |   HTTP Data      | **Ethernet Trailer**  

### To move the HTTP (browsing data) across the network we need to :-
   1) Package & Encapsulate the HTTP data inside TCP
   2) Encapsulate the TCP packets inside IP
   3) Encapsulate the IP inside the Ethernet header 
---

## a closer look at (UDP & TCP) data transfer protocols

### Shared Features :-
- Both of them are encapsulated and transported by the Internet Protocol.  
- Both are located in the 4th(transport) layer of the OSI reference model.  
- Both of them have a feature called **multiplexing** 
     - That allow us to use multiple applications at the same time.
### TCP (Transmission Control Protocol) Features :- 
- TCP is a **reliable protocol** , because it acknowledges the flow of data , and 
   - Data can be reordered and recovered if necessary .
   - Control the flow of the communication .
- TCP is a **connection oriented protocol**, because ,
   - A formal connection is made with a separate device on the network.
   - The connection will be terminated when the transfer of data is over .
- TCP is slower because it has to establish a formal connection and acknowledge the transfer of data

### UDP (User Datagram Protocol) Features :- 
- UDP is an **unreliable protocol** because it doesn't care about whether the data is transferred or not.
   - UDP can't recover or reorder lost data
   - UDP doesn't have any data flow control 
      - The sender determines the amount of data transmitted
- UDP is a **connectionless protocol** because no formal connection is established with another device.
   - UDP is faster because it doesn't establish a formal connection or acknowledge the flow of data.
### Conclusion :-
The decision on which protocol to use is usually based on how the application works. The applications that need  
the acknowledgement of data transmission will use TCP , and the applications that don't care whether  
their data is being transmitted successfully or not will use UDP.

---
## Ports
- Every computer / device has its own IP address and **ports**. 
- **Ports** are used to decide where to drop off the data (destination).
   - When data arrives to a device it knows which application it is destined for.
- TCP and UDP ports can be any number from **0 ~ 65535**.
   - TCP and UDP port numbers are different ,so no conflict will arise.
### Common ports and protocols :-
#### 23/tcp : Telnet (Telecommunication Network)
- Login to devices remotely (similar to ssh but it is insecure)
- Your username & password is sent unencrypted which is not good for a production environment
#### 22/tcp : **SSH (Secure Shell)**
- Remote Encrypted connection 
#### 22/tcp : SFTP (Secure File Transfer Protocol)
- Encrypted file transfer protocol
- This protocol uses the secure shell file transfer protocol
- It uses the same port as the SSH service 
- full featured functionality (list,add,delete,etc)
#### 20/tcp (active mode) or 21/tcp (control mode) FTP
- Insecure file transfer protocol
- It has some kind of authentication 
- full featured functionality (list,add,delete,etc)
#### 69/udp TFTP (Trivial File Transfer Protocol)
- Simple File transfer protocol
- It doesn't use any authentication
- Not used on production systems
#### 67,68/udp : DHCP (Dynamic Host Configuration Protocol
- Automated process that assigns and configures some networking options like
   - IP address , subnet mask , DNS settings , and many other options
- IP addresses are usually assigned from a pool of IP addresses that DHCP controls
- Each system is given a lease and must renew the lease or the IP address will be released
- You can make DHCP IP reserverations for certain devices.
- Some devices will be assigned an IP address based on their MAC address
#### 25/tcp : SMTP (Simple Mail Transfer Protocol)
- Send mail data from 1 mail server to another
- Also used to send emails to mail servers for outgoing mail
- Commonly configured on mobile devices and email clients
- IMAP & POP3 are usually used to receive incoming mail communication
#### 110/tcp ~ POP3 ~ Post Office Protocol v3
- Basic mail authentication amd transfer functionality 
- Not commonly used nowadays
#### tcp/143 IMAP4 - Internet Message Access Protocol v4
- We can use multiple clients to access our mail box
#### 53/udp : DNS (Domain Name System)
- Convert domain names (website.com) to IP addresses
#### 80/tcp : HTTP (Hyper Text Transfer Protocol
- web traffic that is not encrypted
- commonly used by the web clients and servers
#### 443/tcp: HTTPS (Hyper Text Transfer Protocol Secure
- Encrypted web traffic
- commonly used by the web clients and servers
#### 161/udp : SNMP (Simple Network Management Protocol)
- used by sysadmins to gather metrics from network devices
   - query and receive data from devices
- **v1** the first(original) version
   - Used structured tables
   - Didn't have any encryption
- **v2** the second version of SNMP
   - Data type enhancements
   - Bulk transfers
   - still doesn't have any encryption
- **v3** a secure standard
   - Message integrity
   - Authentication
   - Encryption
#### 3389/tcp : RDP (Remote Desktop Protocol)
- Share a desktop / application from a remote location
- RDP is mainly used to remotely administer and manage window devices 
- RDP has clients on different OSs
#### 25 : mail communication
#### 123/udp : NTP Network Time Protocol 
- NTP is a time sync service
- Every device has its own clock and they determine the right time and date through NTP
- Synchronizing the clock between all devices is very important 
- Very accurate way of syncing time
#### 5060,5061/tcp : SIP (Session Initiation Protocol)
- **VoIP (Voice Over IP)** Signaling on tcp port 5060 and 5061
- Setup and manage VoIP sessions 
   - Call , ring , hold , hangup , etc..
- Extend voice communication adding :-
   - Video conferencing , instant messaging , file transfer , etc..
#### SMB (Server Message Block)
- SMB is a protocol that is used by Microsoft to transfer files between devices.
   - File & Printer sharing
- Also called as **CIFS (Common Internet File System)**
- Communicate directly over port 445/tcp (NetBIOS-less)
- IPv4 Sockets 
  - server IP address , protocol , server application port number
  - client IP address , protocol , client port number

### IP networking tend to split ports into two groups :-
- **non-ephemeral ports (non temporary)(0 ~ 1023)**
   - Usually assigned to services running on a server
- **ephemeral ports (temporary)(1024 ~ 65535)**
   - Determined randomly by the client when it sends information back to the server
---

## ICMP (Internet Control Msg Protocol)
- Another protocol that is carried by IP ,however, it doesn't transfer any data.
- ICMP is used to test the reachability of a remote network device and report errors
### `ping` is used to determine whether a network device is reachable or not
- PC sends an ICMP echo request to the router's IP address
   - If the router receives the packet , it will let the PC know that it was received
   - If the device is not reachable it will report an error
- The pc will show the run time
----
#### The OSI (Open System Interconnect) Model
----
##### Intro :-
The OSI model is a seven layer reference model used to categorize network components , and
the layers are organized bottom to top.
##### Layers :-
1) The **physical layer**
   - This layer is concerned how data(bits) are transmited to the wire , which is either electrically or optically
2) An **Ethernet Switch** in its basic form is a device that can be found in the **data link layer**
   , because it can make forwarding decisions based on an address that is burned into a network interface card . 
   - In a PC the burned in address is called the **MAC (Media Access Control) address**
   - A **MAC address** is a 48-bit address that is burned into a **NIC (Network Interface Card)**
   - Devices on the 2nd layer make forwarding decisions based on physical addresses
3) The **network layer** has devices that make forwarding decisions based on logical addresses
   - A Router is an example of a layer 3 device that bases it's forwarding decisions on logical addresses (IPs)
4) The **transport layer** is the 4th layer and it contains a couple of interesting protocols
   - **TCP (Transmission Control Protocol** is a reliable protocol that acknowledges the flow of data
   - **UDP (User Datagram Protocol)** is an unreliable protocol that doesn't care about whether the data is received or not
5) **Session Layer**
   - This layer is about setting up , maintaning , and tearing down sessions
   - **SIP** (Session Initiation Protocol) is a layer 5 protocol that is used in voice over ip (VoIP) to setup
     maintain and tear down a phone call.
6) **Presentation Layer**
   - This layer is concerned about how data is represented in the network
   - for example we can format a block of text using **ASCII** or **UNICODE**
   - Data Encryption is another concern.
7) **Application Layer**

- we don't have to neatly populate each of these layers because this is just a **reference model**
----
#### The DoD Model or TCP/IP Stack
----
##### Intro :-

The OSI model was designed to be very generic in terms of the protocols that you could map into it. However, our modern
networks are IP based either IPv4 or IPv6 .

- The TCP/IP stack was developed by the United States Department of Defence
- The layers of the DoD model can be mapped directly to one or more layers of the OSI models

##### Layers :-

1) **Network Access Layer** ==>  **Physical & Data Link (OSI Layers)** 
2) **Internet Layer (IP Protocol)** ==>  **Network (OSI)** 
   - Network Interface Layer = Network Layer = Link Layer
3) **Transport Layer** ==>  **Transport (OSI)** 
4) **Application Layer** ==> **Application , Presentation & Session**

##### Network & Transport Layer :-

A couple of popular protocols in the Network Layer are :-

- **IP (Internet Protocol)** is used to forward packets to their intended destination
   - IP is able to encapsulate,carry and send upper layer protocols across the network such as :-
      1) **UDP (User Datagram Protocol)** 
      2) **TCP (Transmission Control Protocol)**
   - 

A couple of  popular protocols in the Transport Layer are :-

- **UDP (User Datagram Protocol)** 
   - UDP is considered unreliable because it doesn't send back a replay if whether the segment reached its
     destination or not
- **TCP (Transmission Control Protocol)**

 - **The internet protocol** dictates the header format of a datagram or packet
 which is similar to a label on a package as well as the way the data payload is nested
 within it to improve effeciency
 
 - **Routing** is predicting and selecting the best possible path for data transmission
   across network boundaries , and this job is usually done by routers.
 
- **IPv4** , the first non-experimental version of the internet protocol & the cornerstone of the internet
  has only received minor revisions since the early 70's.IPv4 has a couple of limitations
   - It allows only 4 billion unique addresses which might seem alot but its not actually enough .
- **IPv6** replaces IPv4's 32-bit address with a 128-bit address that allows 340 trillion trillion trillion addresses.
- Aside from reusing IP addresses one of the main ways we have elleviated the need to have more of them is through
  **network address translation**
- IPv6 devices can **configure themselves** rather than relying on DHCP to get an address 
   - The header data that must be included with each packet is larger and flexible in IPv6
- **Compatibility** is an issue when you try to access a website that only runs IPv6 from an IPv4 System it wont work
   - No Backward compatibility


